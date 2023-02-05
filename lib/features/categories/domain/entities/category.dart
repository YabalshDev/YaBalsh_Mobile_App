import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;
  final String? name;
  final String? imagePath;

  const Category({
    this.id,
    this.name = '',
    this.imagePath = '',
  });

  @override
  List<Object?> get props => [id, name, imagePath];
}
