import 'package:flutter/material.dart';
import 'package:ix_task/presentation/resource/routes_manager.dart';
import 'package:ix_task/presentation/resource/font_manager.dart';
import 'package:ix_task/presentation/resource/values_manager.dart';
import 'package:ix_task/presentation/resource/styles_manager.dart';

import '../../../domain/model/employee_model.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeModel employee;


  const EmployeeCard({
    super.key,
    required this.employee,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(AppMargin.m8),
      elevation: AppSize.s4, // Use AppSize
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.userDataRoute,
            arguments: employee,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(employee.photo),
                radius: AppSize.s30,
              ),
              const SizedBox(width: AppSize.s16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employee.name,
                      style: getSemiBoldStyle(
                        fontSize: FontSize.s18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: AppSize.s4),
                    Text(
                      employee.email,
                      style: getRegularStyle(
                        fontSize: FontSize.s14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              // Check Icon (Commented out for now)
              // IconButton(
              //   icon: Icon(
              //     allQuestionsChecked ? Icons.check_circle : Icons.radio_button_unchecked,
              //     color: allQuestionsChecked ? Colors.green : Colors.grey,
              //     size: AppSize.s30, // Use AppSize
              //   ),
              //   onPressed: allQuestionsChecked ? onSubmitted : null, // Disable if not all questions are checked
              // ),
            ],
          ),
        ),
      ),
    );
  }
}