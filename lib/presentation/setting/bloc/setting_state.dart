part of 'setting_cubit.dart';

enum AppTheme { light, dark }

class SettingState extends Equatable {
  final AppTheme appTheme;

  const SettingState({required this.appTheme});

  factory SettingState.initial() => const SettingState(
        appTheme: AppTheme.light,
      );

  @override
  List<Object> get props => [appTheme];

  SettingState copyWith({
    AppTheme? appTheme,
  }) =>
      SettingState(
        appTheme: appTheme ?? this.appTheme,
      );
}
