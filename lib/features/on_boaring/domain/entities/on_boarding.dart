import 'package:equatable/equatable.dart';

class OnBoarding extends Equatable {
  final String? title;
  final String? subTitile;
  final String? imagePath;

  const OnBoarding({this.title = '', this.subTitile = '', this.imagePath = ''});

  @override
  List<Object?> get props => [title, subTitile, imagePath];
}
