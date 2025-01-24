import 'package:image_picker/image_picker.dart';

class EmployeeModel {
  final String name;
  final String id;
  final String email;
  final String photo;
  final List<RateQuestion> rateQuestions;
  final bool isSubmitted;

  EmployeeModel({
    required this.name,
    required this.id,
    required this.email,
    required this.photo,
    required this.rateQuestions,
    this.isSubmitted = false,
  });

  EmployeeModel copyWith({
    String? name,
    String? id,
    String? email,
    String? photo,
    List<RateQuestion>? rateQuestions,
    bool? isSubmitted,
  }) {
    return EmployeeModel(
      name: name ?? this.name,
      id: id ?? this.id,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      rateQuestions: rateQuestions ?? this.rateQuestions,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}

class RateQuestion {
  final String question;
  String answer;
  XFile? imageFile;



  RateQuestion({
    required this.question,
    this.answer = "",
    this.imageFile,

  });

  RateQuestion copyWith({
    String? question,
    String? answer,
    XFile? imageFile,
  }) {
    return RateQuestion(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      imageFile: imageFile ?? this.imageFile,
    );
  }
}