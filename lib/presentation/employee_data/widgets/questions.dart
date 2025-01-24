import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ix_task/presentation/resource/color_manager.dart';
import 'package:ix_task/presentation/resource/font_manager.dart';
import 'package:ix_task/presentation/resource/values_manager.dart';
import 'package:ix_task/presentation/resource/styles_manager.dart';

import '../../../domain/model/employee_model.dart';
import '../../resource/string_manager.dart';

class QuestionTile extends StatefulWidget {
  final RateQuestion question;
  final Function(Map<String, dynamic> answer) onAnswerChanged;
  final String? errorText;

  const QuestionTile({
    super.key,
    required this.question,
    required this.onAnswerChanged,
    this.errorText,
  });

  @override
  QuestionTileState createState() => QuestionTileState();
}

class QuestionTileState extends State<QuestionTile> {
  bool isYesSelected = false;
  bool isNoSelected = false;
  XFile? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
      _notifyParent();
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.attachFile),
        content: const Text(AppStrings.selectImageSource),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
            child: const Text(AppStrings.gallery),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
            child: const Text(AppStrings.camera),
          ),
        ],
      ),
    );
  }

  void _notifyParent() {
    widget.onAnswerChanged({
      'question': widget.question.question,
      'answer': isYesSelected ? AppStrings.yes : (isNoSelected ? AppStrings.no : null),
      'imageFile': _imageFile,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question.question,
              style: getSemiBoldStyle(
                fontSize: FontSize.s16,
                color: ColorManager.onSurface,
              ),
            ),
            const SizedBox(height: AppPadding.p8),
            Row(
              children: [
                // Yes Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isYesSelected = true;
                      isNoSelected = false;
                      widget.question.answer = AppStrings.yes;
                      _imageFile = null;
                    });
                    _notifyParent();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isYesSelected
                        ? ColorManager.primary
                        : ColorManager.lightGrey,
                    foregroundColor: isYesSelected
                        ? ColorManager.onPrimary
                        : ColorManager.onSurface,
                  ),
                  child: const Text(AppStrings.yes),
                ),
                const SizedBox(width: AppPadding.p8),
                // No Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isYesSelected = false;
                      isNoSelected = true;
                      widget.question.answer = AppStrings.no;
                    });
                    _notifyParent();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isNoSelected
                        ? ColorManager.error
                        : ColorManager.lightGrey,
                    foregroundColor: isNoSelected
                        ? ColorManager.onPrimary
                        : ColorManager.onSurface,
                  ),
                  child: const Text(AppStrings.no),
                ),
              ],
            ),
            if (isNoSelected)
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.pleaseAttachFile,
                      style: getRegularStyle(
                        fontSize: FontSize.s14,
                        color: ColorManager.error,
                      ),
                    ),
                    const SizedBox(height: AppPadding.p8),
                    ElevatedButton(
                      onPressed: _showImageSourceDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                        foregroundColor: ColorManager.onPrimary,
                      ),
                      child: const Text(AppStrings.attachFile),
                    ),
                  ],
                ),
              ),
            if (_imageFile != null)
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p8),
                child: Image.file(
                  File(_imageFile!.path),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            // Display validation error message
            if (widget.errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p8),
                child: Text(
                  widget.errorText!,
                  style: getRegularStyle(
                    fontSize: FontSize.s14,
                    color: ColorManager.error,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}