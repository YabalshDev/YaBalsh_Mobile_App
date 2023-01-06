import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

class Creator extends Equatable {
  final int? id;
  final String? imagePath;
  final String? name;
  final List<Recipie>? recipies;

  const Creator({this.id, this.imagePath, this.name, this.recipies});

  @override
  List<Object?> get props => [id, imagePath, name, recipies];
}
