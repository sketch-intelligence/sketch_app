import 'package:flutter/material.dart';
import 'package:sketch/core/utils/app_styles.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key,
    required this.optionItemName,
    required this.optionItemImg,
    required this.isSelected,
    required this.onTap,
  });

  final String optionItemName;
  final String optionItemImg;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                color: Colors.black,
                optionItemImg,
                fit: BoxFit.fill,
              ),
              Flexible(
                child: Text(
                  optionItemName,
                  style: AppStyles.styleBold18(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
