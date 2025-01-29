// lib/features/Add Project/Architect Project/screens/architect_project.dart
import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/ui/widgets/custom_text_form_field.dart';
import 'package:sketch/features/Add Project/Architect Project/data/models/architect_model.dart';
import 'package:sketch/features/Add%20Project/Architect%20Project/presentation/widgets/date_picker.dart';
import 'package:sketch/features/Add%20Project/Architect%20Project/presentation/widgets/file_upload_widget.dart';
import 'package:sketch/features/Add%20Project/Architect%20Project/presentation/widgets/label_widget.dart';
import '../../../../../core/constant/text_styles/font_size.dart';

class ArchitectProject extends StatefulWidget {
  final ArchitectProjectModel? project;

  const ArchitectProject({super.key, this.project});

  @override
  _ArchitectProjectState createState() => _ArchitectProjectState();
}

class _ArchitectProjectState extends State<ArchitectProject> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _completionDateController =
      TextEditingController();
  String? selectedFile;

  @override
  void initState() {
    super.initState();
    if (widget.project != null) {
      _titleController.text = widget.project!.title;
      _descriptionController.text = widget.project!.description;
      _completionDateController.text = widget.project!.completionDate.isNotEmpty
          ? widget.project!.completionDate[0]
          : '';
    }
  }

  void _submitProject() {
    ArchitectProjectModel newProject = ArchitectProjectModel(
      id: "1",
      title: _titleController.text,
      description: _descriptionController.text,
      imageUrl: selectedFile ?? '',
      completionDate: [_completionDateController.text],
    );

    print("Project Submitted: ${newProject.title}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: LayoutBuilder(
          builder: (context, constraints) {
            double fontSize = constraints.maxWidth < 360 ? 16 : 20;
            return Text(
              "Add New Project",
              style: TextStyle(fontSize: fontSize),
            );
          },
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LabelWidget(text: "Project Title"),
            CustomTextFormField(
              controller: _titleController,
              borderColor: AppColors.greyDD,
              fillColor: Colors.white,
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const SizedBox(height: 12),
            const LabelWidget(text: "Project Gallery"),
            FileUploadWidget(
              selectedFile: selectedFile,
              onTap: () {
                setState(() {
                  selectedFile = "SampleFile.png";
                });
              },
            ),
            const SizedBox(height: 12),
            const LabelWidget(text: "Project Description"),
            CustomTextFormField(
              controller: _descriptionController,
              borderColor: AppColors.greyDD,
              fillColor: Colors.white,
              height: MediaQuery.of(context).size.height * 0.15,
              maxLines: 5,
            ),
            const SizedBox(height: 12),
            const LabelWidget(
              text: "Completion Date",
            ),
            DatePickerField(controller: _completionDateController),
            const SizedBox(height: 60),
            Center(
              child: CustomButton(
                text: "Submit",
                w: MediaQuery.of(context).size.width * 0.85,
                h: MediaQuery.of(context).size.height * 0.06,
                color: AppColors.primary,
                textStyle: AppTextStyle.getBoldStyle(
                  fontSize: AppFontSize.size_16,
                  color: Colors.white,
                ),
                onPressed: _submitProject,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
