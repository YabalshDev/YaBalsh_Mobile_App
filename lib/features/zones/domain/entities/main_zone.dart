import 'package:equatable/equatable.dart';

class MainZone extends Equatable {
  final int? id;
  final String? name;

  const MainZone({this.id, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
