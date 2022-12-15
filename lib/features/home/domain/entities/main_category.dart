import 'package:equatable/equatable.dart';

class MainCategory extends Equatable {
  final String? name;
  final String? imagePath;

  const MainCategory({this.name = '', this.imagePath = ''});
  @override
  List<Object?> get props => [name, imagePath];
}
