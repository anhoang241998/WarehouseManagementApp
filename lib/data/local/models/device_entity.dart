import 'package:hive/hive.dart';

part 'device_entity.g.dart';

@HiveType(typeId: 1)
class DeviceEntity extends HiveObject {
  @HiveField(0)
  final String code;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String block;

  @HiveField(3)
  final String floor;

  @HiveField(4)
  final String position;

  @HiveField(5)
  final String subPosition;

  @HiveField(6)
  final String shortLabel;

  @HiveField(7)
  final bool isNew;

  @HiveField(8)
  final String imageUrl;

  DeviceEntity({
    required this.code,
    required this.name,
    required this.block,
    required this.floor,
    required this.position,
    required this.subPosition,
    required this.shortLabel,
    required this.imageUrl,
    this.isNew = true,
  });

  DeviceEntity copyWith({
    String? code,
    String? name,
    String? block,
    String? floor,
    String? position,
    String? subPosition,
    String? shortLabel,
    bool? isNew,
    String? imageUrl,
  }) =>
      DeviceEntity(
        code: code ?? this.code,
        name: name ?? this.name,
        block: block ?? this.block,
        floor: floor ?? this.floor,
        position: position ?? this.position,
        subPosition: subPosition ?? this.subPosition,
        shortLabel: shortLabel ?? this.shortLabel,
        isNew: isNew ?? this.isNew,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  @override
  String toString() => 'DeviceEntity{code: $code,'
      ' name: $name,'
      ' block: $block,'
      ' floor: $floor,'
      ' position: $position,'
      ' subPosition: $subPosition,'
      ' shortLabel: $shortLabel,'
      ' isNew: $isNew,'
      ' imageUrl: $imageUrl}';
}
