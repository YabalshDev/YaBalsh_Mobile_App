import 'package:equatable/equatable.dart';

class Brand extends Equatable {
  final int? id;
  final String? imagePath;
  final String? name;

  const Brand({this.id, this.imagePath, this.name});

  @override
  List<Object?> get props => [id, imagePath, name];
}
