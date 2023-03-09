import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/questions/value_object.dart';
import 'package:final_project_edspert/domain/questions/question.dart';

class QuestionDto {
  final String? exerciseIdFk;
  final String? bankQuestionId;
  final String? questionTitle;
  final String? questionTitleImg;
  final String? optionA;
  final String? optionAImg;
  final String? optionB;
  final String? optionBImg;
  final String? optionC;
  final String? optionCImg;
  final String? optionD;
  final String? optionDImg;
  final String? optionE;
  final String? optionEImg;
  final String? studentAnswer;

  const QuestionDto._({
    required this.exerciseIdFk,
    required this.bankQuestionId,
    required this.questionTitle,
    required this.questionTitleImg,
    required this.optionA,
    required this.optionAImg,
    required this.optionB,
    required this.optionBImg,
    required this.optionC,
    required this.optionCImg,
    required this.optionD,
    required this.optionDImg,
    required this.optionE,
    required this.optionEImg,
    required this.studentAnswer,
  });

  factory QuestionDto.fromJson(Map<String, dynamic> json) => QuestionDto._(
        exerciseIdFk: json['exercise_id_fk'] as String?,
        bankQuestionId: json['bank_question_id'] as String?,
        questionTitle: json['question_title'] as String?,
        questionTitleImg: json['question_title_img'] as String?,
        optionA: json['option_a'] as String?,
        optionAImg: json['option_a_img'] as String?,
        optionB: json['option_b'] as String?,
        optionBImg: json['option_b_img'] as String?,
        optionC: json['option_c'] as String?,
        optionCImg: json['option_c_img'] as String?,
        optionD: json['option_d'] as String?,
        optionDImg: json['option_d_img'] as String?,
        optionE: json['option_e'] as String?,
        optionEImg: json['option_e_img'] as String?,
        studentAnswer: json['student_answer'] as String?,
      );

  factory QuestionDto.fromDomain(Question question) {
    return QuestionDto._(
      exerciseIdFk: question.exerciseIdFk.value,
      bankQuestionId: question.id.value.toString(),
      questionTitle: question.questionTitle.value,
      questionTitleImg: question.questionTitleImg.value,
      optionA: question.options[0].value,
      optionAImg: question.optionImgs[0].value,
      optionB: question.options[1].value,
      optionBImg: question.optionImgs[1].value,
      optionC: question.options[2].value,
      optionCImg: question.optionImgs[2].value,
      optionD: question.options[3].value,
      optionDImg: question.optionImgs[3].value,
      optionE: question.options[4].value,
      optionEImg: question.optionImgs[4].value,
      studentAnswer: question.studentAnswer.value,
    );
  }

  Question toDomain() {
    return Question(
      id: UniqueId(bankQuestionId ?? ""),
      exerciseIdFk: ExerciseIdFk(exerciseIdFk ?? ""),
      questionTitle: QuestionTitle(questionTitle ?? ""),
      questionTitleImg: QuestionTitleImg(questionTitleImg ?? ""),
      options: [
        Option(optionA ?? ""),
        Option(optionB ?? ""),
        Option(optionC ?? ""),
        Option(optionD ?? ""),
        Option(optionE ?? ""),
      ],
      optionImgs: [
        OptionImg(optionAImg ?? ""),
        OptionImg(optionBImg ?? ""),
        OptionImg(optionCImg ?? ""),
        OptionImg(optionDImg ?? ""),
        OptionImg(optionEImg ?? ""),
      ],
      studentAnswer: StudentAnswer(studentAnswer ?? ""),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "exercise_id_fk": exerciseIdFk,
      "bank_question_id": bankQuestionId,
      "question_title": questionTitle,
      "question_title_img": questionTitleImg,
      "option_a": optionA,
      "option_a_img": optionAImg,
      "option_b": optionB,
      "option_b_img": optionBImg,
      "option_c": optionC,
      "option_c_img": optionCImg,
      "option_d": optionD,
      "option_d_img": optionDImg,
      "option_e": optionE,
      "option_e_img": optionEImg,
      "student_answer": studentAnswer,
    };
  }
}
