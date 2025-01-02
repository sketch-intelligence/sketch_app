import 'package:flutter/material.dart';
import 'package:sketch/features/design/presentation/views/widget/generate_design_page_body.dart';

class GenerateDesignPage extends StatelessWidget {
  const GenerateDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GenerateDesignPageBody(),
    );
  }
}
