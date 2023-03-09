import 'package:equatable/equatable.dart';
import 'package:final_project_edspert/domain/core/entity.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/questions/value_object.dart';

class Question extends Equatable implements IEntity {
  @override
  final UniqueId id;
  final ExerciseIdFk exerciseIdFk;
  final QuestionTitle questionTitle;
  final QuestionTitleImg questionTitleImg;
  final List<Option> options;
  final List<OptionImg> optionImgs;
  final StudentAnswer studentAnswer;

  const Question({
    required this.id,
    required this.exerciseIdFk,
    required this.questionTitle,
    required this.questionTitleImg,
    required this.options,
    required this.optionImgs,
    required this.studentAnswer,
  });

  @override
  List<Object?> get props => [
        id,
        exerciseIdFk,
        questionTitle,
        questionTitleImg,
        options,
        optionImgs,
        studentAnswer,
      ];
}
