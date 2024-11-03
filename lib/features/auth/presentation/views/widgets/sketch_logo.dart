import 'package:flutter/widgets.dart';
import 'package:sketch/core/utils/app_assets.dart';

class SketchLogo extends StatelessWidget {
  const SketchLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Image.asset(
        Assets.imagesSketchLogo,
      ),
    );
  }
}
