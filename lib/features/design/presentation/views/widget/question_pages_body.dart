import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/features/design/presentation/views/widget/option_item.dart';
import 'package:sketch/features/design/presentation/views/widget/question_item.dart';

class QuestionPagesBody extends StatelessWidget {
  const QuestionPagesBody({super.key});

  static final PageController _pageController = PageController();
  static final List<QuestionItem> _questionData = [
    const QuestionItem(
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
    const QuestionItem(
      question: 'Which do you like?',
      options: [
        OptionItem(
          optionItemName: 'Sky',
          optionItemImg: Assets.imagesImage20,
        ),
        OptionItem(
          optionItemName: 'Sky',
          optionItemImg: Assets.imagesImage20,
        ),
        OptionItem(
          optionItemName: 'Sky',
          optionItemImg: Assets.imagesImage20,
        ),
        OptionItem(
          optionItemName: 'Sky',
          optionItemImg: Assets.imagesImage20,
        ),
      ],
    ),
  ];

  void _goToNextPage(BuildContext context, {bool isSkip = false}) {
    if (isSkip) {
      // Immediately navigate to GenerateDesignPage if isSkip is true
      GoRouter.of(context).go(AppRouter.kDesignView);
      return;
    }

    final currentPage =
        _pageController.hasClients && _pageController.page != null
            ? _pageController.page!.toInt()
            : 0;

    if (currentPage == _questionData.length - 1) {
      // Navigate to GenerateDesignPage when on the last page
      GoRouter.of(context).go(AppRouter.kDesignView);
    } else {
      // Otherwise, go to the next page
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
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackWidget(
                  existBack: false,
                  title: 'Sketch',
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 150,
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _questionData.length,
                itemBuilder: (context, index) {
                  final data = _questionData[index];
                  return QuestionItem(
                    question: data.question,
                    options: data.options,
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomButton(
                text: "Next",
                onPressed: () {
                  _goToNextPage(context);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomButton(
                text: "Skip",
                onPressed: () {
                  _goToNextPage(context, isSkip: true);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
