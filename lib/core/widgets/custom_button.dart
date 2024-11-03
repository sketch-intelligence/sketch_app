import 'package:flutter/material.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.text, this.icon, this.onPressed});
  final String text;
  final Widget? icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: kGreenColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: ButtonBody(icon: icon, text: text),
      ),
    );
  }
}

class ButtonBody extends StatelessWidget {
  const ButtonBody({
    super.key,
    required this.icon,
    required this.text,
  });

  final Widget? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: icon ?? const SizedBox(),
        ),
        const Expanded(child: SizedBox()),
        Expanded(
          flex: 4,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style:
                AppStyles.styleRegular18(context).copyWith(color: Colors.white),
          ),
        ),
        const Expanded(flex: 2, child: SizedBox())
      ],
    );
  }
}
