import 'package:final_project_edspert/domain/banners/value_objects.dart';
import 'package:final_project_edspert/domain/core/entity.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';

class Banner implements IEntity {
  const Banner({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.url,
  });

  @override
  final UniqueId id;
  final Title title;
  final Description description;
  final Image image;
  final Url url;
}
