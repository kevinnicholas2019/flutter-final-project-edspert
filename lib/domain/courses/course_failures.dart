import 'package:final_project_edspert/domain/core/value_failures.dart';

abstract class CourseFail implements ValueFailures<String> {}

class CourseFailCustom implements CourseFail {
  @override
  final String failedValue;

  CourseFailCustom(this.failedValue);
}
