import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ix_task/data/employee_data.dart';
import 'package:ix_task/presentation/cubit/employee_state.dart';
import '../../domain/model/employee_model.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(const EmployeeState(employees: []));

  void loadEmployees() async {
    emit(state.copyWith(isLoading: true));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final employees = EmployeeApi.employees;
      emit(state.copyWith(employees: employees, isLoading: false));
    } catch (e) {
      emit(state.copyWith(
        error: 'Failed to load employees: ${e.toString()}',
        isLoading: false,
      ));
    }
  }

  void updateAnswer(String employeeId, int questionIndex, String answer, {XFile? imageFile}) {
    final updatedEmployees = state.employees.map((employee) {
      if (employee.id == employeeId) {
        final updatedQuestions = List<RateQuestion>.from(employee.rateQuestions);
        updatedQuestions[questionIndex] = updatedQuestions[questionIndex].copyWith(
          answer: answer,
          imageFile: imageFile,
        );
        return employee.copyWith(rateQuestions: updatedQuestions);
      }
      return employee;
    }).toList();

    emit(state.copyWith(employees: updatedEmployees));
  }

  void submitAnswers(String employeeId) {
    final updatedEmployees = state.employees.map((employee) {
      if (employee.id == employeeId) {
        final allQuestionsAnswered = _areAllQuestionsAnswered(employee);
        return employee.copyWith(isSubmitted: allQuestionsAnswered);
      }
      return employee;
    }).toList();

    emit(state.copyWith(employees: updatedEmployees));
  }

  void submitAllAnswersGlobally() {
    final updatedEmployees = state.employees.map((employee) {
      final allQuestionsAnswered = _areAllQuestionsAnswered(employee);
      return employee.copyWith(isSubmitted: allQuestionsAnswered);
    }).toList();

    emit(state.copyWith(employees: updatedEmployees));
  }

  bool _areAllQuestionsAnswered(EmployeeModel employee) {
    return employee.rateQuestions.every((question) =>
    question.answer.isNotEmpty && (question.answer != 'No' || question.imageFile != null));
  }
}