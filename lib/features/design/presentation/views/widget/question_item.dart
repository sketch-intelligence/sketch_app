import 'package:flutter/material.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/features/design/presentation/views/widget/option_item.dart';

class QuestionItem extends StatefulWidget {
  final String question;
  final List<OptionItem> options;

  const QuestionItem({
    super.key,
    required this.question,
    required this.options,
  });

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: AppStyles.styleBold18(context),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 16,
              mainAxisSpacing: 12,
            ),
            itemCount: widget.options.length,
            itemBuilder: (context, index) {
              final option = widget.options[index];
              return OptionItem(
                optionItemName: option.optionItemName,
                optionItemImg: option.optionItemImg,
                isSelected: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
