import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/features/design/presentation/views/expert_page.dart';

class QuestionPagesBody extends StatelessWidget {
  const QuestionPagesBody({super.key});

  // static final PageController _pageController = PageController();
  // static final List<QuestionItem> _questionData = [
  //   QuestionItem(
  //     question: 'Which building do you like?',
  //     options: [
  //       OptionItem(
  //         optionItemName: 'Sky Tower',
  //         optionItemImg: Assets.imagesImage20,
  //         isSelected: false,
  //         onTap: () {},
  //       ),
  //       OptionItem(
  //         optionItemName: 'Sky Tower',
  //         optionItemImg: Assets.imagesImage20,
  //         isSelected: false,
  //         onTap: () {},
  //       ),
  //       OptionItem(
  //         optionItemName: 'Sky Tower',
  //         optionItemImg: Assets.imagesImage20,
  //         isSelected: false,
  //         onTap: () {},
  //       ),
  //       OptionItem(
  //         optionItemName: 'Sky Tower',
  //         optionItemImg: Assets.imagesImage20,
  //         isSelected: false,
  //         onTap: () {},
  //       ),
  //     ],
  //   ),
  //   QuestionItem(
  //     question: 'Which do you like?',
  //     options: [
  //       OptionItem(
  //         optionItemName: 'Sky Tower',
  //         optionItemImg: Assets.imagesImage20,
  //         isSelected: false,
  //         onTap: () {},
  //       ),
  //       OptionItem(
  //         optionItemName: 'Sky Tower',
  //         optionItemImg: Assets.imagesImage20,
  //         isSelected: false,
  //         onTap: () {},
  //       ),
  //       OptionItem(
  //         optionItemName: 'Sky Tower',
  //         optionItemImg: Assets.imagesImage20,
  //         isSelected: false,
  //         onTap: () {},
  //       ),
  //     ],
  //   ),
  // ];

  void _goToNextPage(BuildContext context, {bool isSkip = false}) {
    if (isSkip) {
      GoRouter.of(context).go(AppRouter.kDesignView);
      return;
    }

    // final currentPage =
    //     _pageController.hasClients && _pageController.page != null
    //         ? _pageController.page!.toInt()
    //         : 0;

    // if (currentPage == _questionData.length - 1) {
    //   GoRouter.of(context).go(AppRouter.kDesignView);
    // } else {
    //   _pageController.nextPage(
    //     duration: const Duration(milliseconds: 300),
    //     curve: Curves.easeInOut,
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppPaddingSize.padding_12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: MediaQuery.of(context).size.height - 150,
          //     child: PageView.builder(
          //       controller: _pageController,
          //       physics: const NeverScrollableScrollPhysics(),
          //       itemCount: _questionData.length,
          //       itemBuilder: (context, index) {
          //         final data = _questionData[index];
          //         return QuestionItem(
          //           question: data.question,
          //           options: data.options,
          //         );
          //       },
          //     ),
          //   ),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Text(
          //       'Generate : ',
          //       style: AppStyles.styleBold20(context),
          //     ),
          //   ],
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: CustomButton(
              text: 'Text to image',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kDesignView);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: CustomButton(
              text: 'Questions',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VillaDesignScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
