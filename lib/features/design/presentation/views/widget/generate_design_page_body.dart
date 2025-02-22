import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/ui/dialogs/app_dialog.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/design/data/model/similar_desgin.dart';
import 'package:sketch/features/design/data/use_case/get_similar_designs_use_case.dart';
import 'package:sketch/features/design/presentation/views/widget/similar_design_item.dart';
import 'package:sketch/features/design/repository/design_repository.dart';
import 'package:sketch/features/root_navigation_screens/data/cubit/root_page_cubit.dart';
import 'package:sketch/translations.dart';

class GenerateDesignPageBody extends StatefulWidget {
  const GenerateDesignPageBody({super.key});

  @override
  State<GenerateDesignPageBody> createState() => _GenerateDesignPageBodyState();
}

class _GenerateDesignPageBodyState extends State<GenerateDesignPageBody> {
  final TextEditingController promptController = TextEditingController();
  Uint8List? _imageData;
  bool _isLoading = false;
  Future<File> convertUint8ListToFile(Uint8List imageData) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/temp_image.png');
    await file.writeAsBytes(imageData);
    return file;
  }

  Future<void> generateImage(
      {required String description, required VoidCallback onSuccess}) async {
    setState(() {
      _isLoading = true;
    });

    final url =
        Uri.parse('https://da13-149-34-244-140.ngrok-free.app/generate-image');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'description': description}),
    );

    if (response.statusCode == 200) {
      setState(() {
        _imageData = response.bodyBytes;
      });
      onSuccess();
    } else {
      print("Error: ${response.statusCode}");
    }

    setState(() {
      _isLoading = false;
    });
  }

  void fetchSimilarDesigns() {
    if (_imageData != null) {
      setState(() {});
    }
  }

  bool _shouldFetchSimilarDesigns = false;

  void _showTipDialog(BuildContext context) {
    AppCustomAlertDialog.alertDialog(
      context: context,
      widget: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tip',
              style: AppStyles.styleBold18(context),
            ),
            const SizedBox(height: 8),
            Text(
              'To generate images, enter a clear and detailed prompt. Include style, structure, and any specific elements you want to see.',
              style: AppStyles.styleRegular16(context),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: AppStyles.styleBold18(context)
                      .copyWith(color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppPaddingSize.padding_12),
      child: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackWidget(
                title: AppLocalizations.of(context)!.generateDesign,
                onBack: () {
                  context.read<RootPageCubit>().changePageIndex(0);
                  GoRouter.of(context).go(AppRouter.kRootView);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.promptInput,
                    style: AppStyles.styleBold18(context),
                  ),
                  IconButton(
                    icon: Icon(Icons.info_outline, color: AppColors.primary),
                    onPressed: () => _showTipDialog(context),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                controller: promptController,
                hint: AppLocalizations.of(context)!.describeStructure,
                iconPath: Assets.imagesEdit,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  const Expanded(flex: 2, child: SizedBox()),
                  const SizedBox(
                    height: 22,
                  ),
                  Expanded(
                    child: (_isLoading)
                        ? const CupertinoActivityIndicator()
                        : CustomButton(
                            text: '',
                            onPressed: () {
                              generateImage(
                                  description: promptController.text,
                                  onSuccess: () {
                                    setState(() {
                                      _shouldFetchSimilarDesigns = true;
                                    });
                                  });
                            },
                            rowChild: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 6,
                                ),
                                SvgPicture.asset(Assets.imagesButtonPlay),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.generate,
                                  style: AppStyles.styleRegular18(context)
                                      .copyWith(color: AppColors.whiteF0),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                              ],
                            ),
                          ),
                  )
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              if (!_isLoading && _imageData != null)
                Center(
                  child: Expanded(
                    child: Image.memory(
                      _imageData!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(
                height: 22,
              ),
              if (!_isLoading && _imageData != null)
                Text(
                  'Similar Design',
                  style: AppTextStyle.getBoldStyle(color: Colors.black),
                ),
              const SizedBox(
                height: 22,
              ),
              if (_shouldFetchSimilarDesigns && _imageData != null)
                Expanded(
                  child: GetModel<ListSimilarDesign>(
                    useCaseCallBack: () async {
                      File imageFile =
                          await convertUint8ListToFile(_imageData!);
                      print('the file file is : $imageFile');
                      return GetSimilarDesignsUseCase(
                        designRepository: DesignRepository(),
                      ).call(
                        params: GetSimilarDesignParams(image: imageFile),
                      );
                    },
                    modelBuilder: (model) {
                      return SizedBox(
                        height: 150, // Set an appropriate height
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: model.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return SimilarDesignItem(
                                design: model.data![index]);
                          },
                        ),
                      );
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
