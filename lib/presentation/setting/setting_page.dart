import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/setting_cubit.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with AutomaticKeepAliveClientMixin<SettingPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const SettingLayout();
  }

  @override
  bool get wantKeepAlive => true;
}

class SettingLayout extends StatelessWidget {
  const SettingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: Column(
          children: [
            Material(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 22,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Dark Mode: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Switch(
                      value: context.watch<SettingCubit>().state.appTheme ==
                          AppTheme.dark,
                      onChanged: (isChecked) {
                        context
                            .read<SettingCubit>()
                            .changeTheme(isChecked: isChecked);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
