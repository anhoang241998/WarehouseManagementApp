import 'package:equatable/equatable.dart';

class Device extends Equatable {
  final int id;
  final String name;
  final String code;
  final String block;
  final String floor;
  final String position;
  final String subPosition;
  final String shortLabel;
  final String imageUrl;
  final bool isNew;

  const Device({
    required this.id,
    required this.name,
    required this.code,
    required this.block,
    required this.floor,
    required this.position,
    required this.subPosition,
    required this.shortLabel,
    required this.imageUrl,
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
    String? imageUrl,
  }) =>
      Device(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        block: block ?? this.block,
        floor: floor ?? this.floor,
        position: position ?? this.position,
        subPosition: subPosition ?? this.subPosition,
        shortLabel: shortLabel ?? this.shortLabel,
        isNew: isNew ?? this.isNew,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [
        id,
        name,
        code,
        block,
        floor,
        position,
        subPosition,
        shortLabel,
        isNew,
        imageUrl,
      ];
}
