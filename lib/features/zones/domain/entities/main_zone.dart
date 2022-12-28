import 'package:equatable/equatable.dart';

class MainZone extends Equatable {
  final int? id;
  final String? name;

  const MainZone({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}
