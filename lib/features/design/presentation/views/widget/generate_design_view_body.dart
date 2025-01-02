import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/features/design/presentation/views/widget/option_item.dart';
import 'package:sketch/features/design/presentation/views/widget/question_page.dart';

class GenerateDesignViewBody extends StatelessWidget {
  const GenerateDesignViewBody({super.key});

  static final PageController _pageController = PageController();
  static final List<Widget> _pages = [
    const QuestionPage(
      question: 'Which building do you like?',
      options: [
        OptionItem(
          optionItemName: 'Sky Tower',
          optionItemImg: Assets.imagesImage20,
        ),
        OptionItem(
          optionItemName: 'Sky Tower2',
          optionItemImg: Assets.imagesImage20,
        ),
        OptionItem(
          optionItemName: 'Sky Tower3',
          optionItemImg: Assets.imagesImage20,
        ),
        OptionItem(
          optionItemName: 'Sky Tower4',
          optionItemImg: Assets.imagesImage20,
        ),
      ],
    ),
    const QuestionPage(
      question: 'Which  do you like?',
      options: [
        OptionItem(
          optionItemName: 'Sky ',
          optionItemImg: Assets.imagesImage20,
        ),
        OptionItem(
          optionItemName: 'Sky ',
          optionItemImg: Assets.imagesImage20,
        ),
        OptionItem(
          optionItemName: 'Sky ',
          optionItemImg: Assets.imagesImage20,
        ),
        OptionItem(
          optionItemName: 'Sky ',
          optionItemImg: Assets.imagesImage20,
        ),
      ],
    ),
  ];
  void _goToNextPage() {
    if (_pageController.page!.toInt() < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppPaddingSize.padding_12),
        child: Column(
          children: [
            const BackWidget(
              existBack: false,
              title: 'Sketch',
            ),
            const SizedBox(height: 16),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _pages.length,
                itemBuilder: (context, index) => _pages[index],
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: "Next",
              onPressed: () {
                _goToNextPage();
              },
            ),
          ],
        ));
  }
}
