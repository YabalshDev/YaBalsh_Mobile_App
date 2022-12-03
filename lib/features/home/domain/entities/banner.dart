import 'package:equatable/equatable.dart';

class Banner extends Equatable {
  final String? imagePath;
  final String? keyword;

  const Banner({this.imagePath, this.keyword});

  @override
  List<Object?> get props => [imagePath, keyword];
}
