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
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    );
  }
}
