import 'package:flutter/material.dart';
import 'package:sketch/core/utils/app_styles.dart';

class QuestionPage extends StatelessWidget {
  final String question;
  final List<Widget> options;
  const QuestionPage({
    super.key,
    required this.question,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: AppStyles.styleBold18(context),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 16,
            mainAxisSpacing: 12,
          ),
          itemCount: options.length,
          itemBuilder: (context, index) => options[index],
        ),
      ],
    );
  }
}
