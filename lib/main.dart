import 'package:flutter/material.dart';
import 'package:sketch/core/utils/app_router.dart';

void main() {
  runApp(const Sketch());
}

class Sketch extends StatelessWidget {
  const Sketch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
