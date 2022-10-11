import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'setting_state.dart';

@injectable
class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());

  void changeTheme({required bool isChecked}) {
    emit(state.copyWith(appTheme: isChecked ? AppTheme.dark : AppTheme.light));
  }
}
