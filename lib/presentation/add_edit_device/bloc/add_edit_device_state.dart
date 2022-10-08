part of 'add_edit_device_cubit.dart';

enum AddEditDeviceStatus { initial, adding, added, error }

class AddEditDeviceState extends Equatable {
  final AddEditDeviceStatus status;
  final String? error;

  const AddEditDeviceState({
    required this.status,
    this.error,
  });

  factory AddEditDeviceState.initial() =>
      const AddEditDeviceState(status: AddEditDeviceStatus.initial);

  @override
  List<Object?> get props => [status, error];

  @override
  bool? get stringify => true;

  AddEditDeviceState copyWith({
    AddEditDeviceStatus? status,
    String? error,
  }) =>
      AddEditDeviceState(
        status: status ?? this.status,
        error: error ?? this.error,
      );
}
