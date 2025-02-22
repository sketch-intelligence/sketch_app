import 'package:flutter/material.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/features/design/presentation/views/widget/question_pages_body.dart';

class QuestionPages extends StatelessWidget {
  const QuestionPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: BackWidget(
                title: 'Sketch',
              ),
              centerTitle: true,
            ),
            body: QuestionPagesBody()));
  }
}
