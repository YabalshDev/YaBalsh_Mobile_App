import 'package:equatable/equatable.dart';

class Section extends Equatable {
  final int? id;
  final String? keyWord;

  const Section({this.keyWord, this.id});
  @override
  List<Object?> get props => [
        keyWord,
        id,
      ];
}
