import 'package:equatable/equatable.dart';

class MainCategory extends Equatable {
  final int? id;
  final String? name;
  final String? imagePath;

  const MainCategory({this.name = '', this.imagePath = '', this.id});
  @override
  List<Object?> get props => [name, imagePath, id];
}
