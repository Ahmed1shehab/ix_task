import '../../domain/model/employee_model.dart';

class EmployeeState {
  final List<EmployeeModel> employees;
  final bool isLoading;
  final String? error;

  const EmployeeState({
    required this.employees,
    this.isLoading = false,
    this.error,
  });

  EmployeeState copyWith({
    List<EmployeeModel>? employees,
    bool? isLoading,
    String? error,
  }) {
    return EmployeeState(
      employees: employees ?? this.employees,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}