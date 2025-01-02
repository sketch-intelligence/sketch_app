import 'package:flutter/material.dart';
import 'package:sketch/core/utils/app_styles.dart';

class OptionItem extends StatelessWidget {
  const OptionItem(
      {super.key, required this.optionItemName, required this.optionItemImg});
  final String optionItemName;
  final String optionItemImg;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
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
            )
          ],
        ),
      ),
    );
  }
}
