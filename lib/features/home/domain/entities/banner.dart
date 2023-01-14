import 'package:equatable/equatable.dart';

import 'section.dart';

class Banner extends Equatable {
  final String? imagePath;
  final int? id;
  final Section? section;

  const Banner({this.imagePath, this.id, this.section});

  @override
  List<Object?> get props => [imagePath, id, section];
}
