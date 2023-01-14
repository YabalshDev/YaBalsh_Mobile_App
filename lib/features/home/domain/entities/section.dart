import 'package:equatable/equatable.dart';

class Section extends Equatable {
  final int? id;
  final String? name;
  final int? priority;

  const Section({
    this.name,
    this.id,
    this.priority,
  });
  @override
  List<Object?> get props => [name, id, priority];
}
