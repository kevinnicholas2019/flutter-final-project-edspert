import 'package:final_project_edspert/domain/banners/banner.dart';
import 'package:final_project_edspert/domain/banners/value_objects.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';

class BannerDto {
  final String eventId;
  final String eventTitle;
  final String eventDescription;
  final String eventImage;
  final String eventUrl;

  const BannerDto._({
    required this.eventId,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventImage,
    required this.eventUrl,
  });

  factory BannerDto.fromJson(Map<String, dynamic> json) => BannerDto._(
        eventId: json['event_id'] as String,
        eventTitle: json['event_title'] as String,
        eventDescription: json['event_description'] as String,
        eventImage: json['event_image'] as String,
        eventUrl: json['event_url'] as String,
      );

  factory BannerDto.fromDomain(Banner banner) {
    return BannerDto._(
      eventId: banner.id.value.toString(),
      eventTitle: banner.title.value,
      eventDescription: banner.description.value,
      eventImage: banner.image.value,
      eventUrl: banner.url.value,
    );
  }

  Banner toDomain() {
    return Banner(
      id: UniqueId(eventId),
      title: Title(eventTitle),
      description: Description(eventDescription),
      image: Image(eventImage),
      url: Url(eventUrl),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "event_id": eventId,
      "event_title": eventImage,
      "event_description": eventDescription,
      "event_image": eventImage,
      "event_url": eventUrl,
    };
  }
}
