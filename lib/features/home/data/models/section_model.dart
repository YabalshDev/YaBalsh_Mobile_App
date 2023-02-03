import 'package:yabalash_mobile_app/features/home/domain/entities/section.dart';

class SectionModel extends Section {
  const SectionModel({
    int? id,
    String? name,
    int? priority,
  }) : super(id: id, name: name, priority: priority);

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
        id: json['id'], name: json['name'], priority: json['priority'] ?? 0);
  }
}
