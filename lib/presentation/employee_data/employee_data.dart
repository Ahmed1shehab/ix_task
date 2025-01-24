import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ix_task/presentation/employee_data/widgets/questions.dart';
import 'package:ix_task/presentation/resource/color_manager.dart';
import 'package:ix_task/presentation/resource/font_manager.dart';
import 'package:ix_task/presentation/resource/values_manager.dart';
import 'package:ix_task/presentation/resource/styles_manager.dart';
import '../../domain/model/employee_model.dart';
import '../resource/string_manager.dart';

class EmployeeData extends StatefulWidget {
  final EmployeeModel employee;

  const EmployeeData({super.key, required this.employee});

  @override
  _EmployeeDataState createState() => _EmployeeDataState();
}

class _EmployeeDataState extends State<EmployeeData> {
  bool _isSubmitted = false;
  final Map<int, String> _errorMessages = {};

  void _submitAnswers() {
    _errorMessages.clear();
    for (int i = 0; i < widget.employee.rateQuestions.length; i++) {
      final question = widget.employee.rateQuestions[i];
      if (question.answer.isEmpty) {
        _errorMessages[i] = AppStrings.pleaseAnswerThisQuestion;
      } else if (question.answer == 'No' && question.imageFile == null) {
        _errorMessages[i] = AppStrings.pleaseAttachFileForNoAnswers;
      }
    }

    if (_errorMessages.isNotEmpty) {
      setState(() {});
      return;
    }

    setState(() {
      _isSubmitted = true;
    });
    if (kDebugMode) {
    for (var question in widget.employee.rateQuestions) {

        print('Question: ${question.question}');

        print('Answer: ${question.answer}');
        if (question.imageFile != null) {
          print('Image Path: ${question.imageFile!.path}');
        }
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(AppStrings.formSubmittedSuccessfully),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.ixTask),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.employee.photo),
                radius: AppSize.s50,
              ),
            ),
            const SizedBox(height: AppSize.s16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${AppStrings.name}: ${widget.employee.name}",
                  style: getBoldStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.onSurface,
                  ),
                ),
                const SizedBox(height: AppSize.s8),
                Text(
                  "${AppStrings.email}: ${widget.employee.email}",
                  style: getRegularStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s24),
            Expanded(
              child: ListView.builder(
                itemCount: widget.employee.rateQuestions.length,
                itemBuilder: (context, index) {
                  final question = widget.employee.rateQuestions[index];
                  return QuestionTile(
                    question: question,
                    onAnswerChanged: (answer) {
                      setState(() {
                        question.answer = answer['answer'];
                        question.imageFile = answer['imageFile'];
                      });
                    },
                    errorText: _errorMessages[index],
                  );
                },
              ),
            ),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: _isSubmitted ? null : _submitAnswers,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  foregroundColor: ColorManager.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p40,
                    vertical: AppPadding.p16,
                  ),
                ),
                child: const Text(AppStrings.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
