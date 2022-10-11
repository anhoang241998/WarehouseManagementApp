import 'package:equatable/equatable.dart';

import '../../domain/models/device.dart';

class AddEditPageParams extends Equatable {
  final bool isAddNewDevice;
  final Device? device;

  const AddEditPageParams({
    required this.isAddNewDevice,
    this.device,
  });

  @override
  List<Object?> get props => [isAddNewDevice, device];

  @override
  bool? get stringify => true;
}
