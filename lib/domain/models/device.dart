import 'package:equatable/equatable.dart';

class Device extends Equatable {
  final String name;
  final String code;
  final String block;
  final String floor;
  final String position;
  final String subPosition;
  final String shortLabel;
  final bool isNew;

  const Device({
    required this.name,
    required this.code,
    required this.block,
    required this.floor,
    required this.position,
    required this.subPosition,
    required this.shortLabel,
    this.isNew = true,
  });

  Device copyWith({
    int? id,
    String? name,
    String? code,
    String? block,
    String? floor,
    String? position,
    String? subPosition,
    String? shortLabel,
    bool? isNew,
    bool? isExpanded,
  }) =>
      Device(
        name: name ?? this.name,
        code: code ?? this.code,
        block: block ?? this.block,
        floor: floor ?? this.floor,
        position: position ?? this.position,
        subPosition: subPosition ?? this.subPosition,
        shortLabel: shortLabel ?? this.shortLabel,
        isNew: isNew ?? this.isNew,
      );

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [
        name,
        code,
        block,
        floor,
        position,
        subPosition,
        shortLabel,
        isNew,
      ];
}
