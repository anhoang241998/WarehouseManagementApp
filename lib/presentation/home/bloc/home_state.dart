part of 'home_cubit.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<Device>? deviceList;

  const HomeState({
    required this.status,
    this.deviceList,
  });

  factory HomeState.initial() => const HomeState(status: HomeStatus.initial);

  @override
  List<Object?> get props => [status, deviceList];

  @override
  bool? get stringify => true;

  HomeState copyWith({
    HomeStatus? status,
    List<Device>? deviceList,
  }) =>
      HomeState(
        status: status ?? this.status,
        deviceList: deviceList ?? this.deviceList,
      );
}
