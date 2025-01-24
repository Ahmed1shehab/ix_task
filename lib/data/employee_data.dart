import 'package:ix_task/domain/model/employee_model.dart';

class EmployeeApi {
  static final List<EmployeeModel> employees = [
    EmployeeModel(
      name: 'Ahmed Shehab',
      id: '001',
      email: 'ahmed21@gmail.com',
      photo:
      'https://plus.unsplash.com/premium_photo-1678197937465-bdbc4ed95815?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      rateQuestions: [
        RateQuestion(question: 'Is Ahmed punctual?'),
        RateQuestion(question: 'Does Ahmed communicate effectively?'),
        RateQuestion(question: 'Is Ahmed a team player?'),
      ],
    ),
    EmployeeModel(
      name: 'Omar Ehab',
      id: '002',
      email: 'Omar.Ehab@gmail.com',
      photo:
      'https://plus.unsplash.com/premium_photo-1664541336692-e931d407ba88?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      rateQuestions: [
        RateQuestion(question: 'Is Omar proactive?'),
        RateQuestion(question: 'Does Omar meet deadlines?'),
        RateQuestion(question: 'Is Omar detail-oriented?'),
      ],
    ),
    EmployeeModel(
      name: 'Mohab Ibrahim',
      id: '003',
      email: 'Mohab.123@gmail.com',
      photo:
      'https://plus.unsplash.com/premium_photo-1675130119373-61ada6685d63?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      rateQuestions: [
        RateQuestion(question: 'Is Mohab innovative?'),
        RateQuestion(question: 'Does Mohab handle pressure well?'),
        RateQuestion(question: 'Is Mohab a good listener?'),
      ],
    ),
  ];
}
