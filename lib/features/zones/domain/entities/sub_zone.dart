import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'sub_zone.g.dart';

@HiveType(typeId: 1)
class SubZone extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(3)
  final String? mainZoneName;

  const SubZone({this.id, this.name, this.mainZoneName});

  @override
  List<Object?> get props => [id, name, mainZoneName];
}
