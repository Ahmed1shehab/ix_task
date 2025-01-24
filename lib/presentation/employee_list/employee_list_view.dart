import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ix_task/presentation/cubit/employee_cubit.dart';
import 'package:ix_task/presentation/cubit/employee_state.dart';
import 'package:ix_task/presentation/employee_list/widgets/employee_card.dart';

import '../shimmer/shimmer_loading.dart';


class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'), // TODO: Add to String manager
      ),
      body: BlocBuilder<EmployeeCubit, EmployeeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: ShimmerLoading());
          }
          if (state.error != null) {
            return Center(child: Text(state.error!));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.employees.length,
                  itemBuilder: (context, index) {
                    final employee = state.employees[index];
                    return EmployeeCard(employee: employee);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => _submitAllAnswersGlobally(context),
                  child: const Text('Submit All Answers'), // TODO: Add to String manager
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _submitAllAnswersGlobally(BuildContext context) {
    final cubit = context.read<EmployeeCubit>();
    final state = cubit.state;

    for (final employee in state.employees) {
      for (final question in employee.rateQuestions) {
        if (question.answer.isEmpty) {
          _showSnackBar(context, 'Please answer all questions for ${employee.name}.');
          return;
        }
      }
    }

    if (kDebugMode) {
      for (final employee in state.employees) {
        print('Employee: ${employee.name}');
        for (final question in employee.rateQuestions) {
          print('Question: ${question.question}');
          print('Answer: ${question.answer}');
          if (question.imageFile != null) {
            print('Image Path: ${question.imageFile!.path}');
          }
        }
      }
    }

    cubit.submitAllAnswersGlobally();
    _showSnackBar(context, 'All answers submitted successfully!'); // TODO: Add to String manager
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}