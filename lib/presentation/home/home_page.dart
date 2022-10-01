import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/di/di_configure.dart';
import 'bloc/home_cubit.dart';
import 'widgets/add_button.dart';
import 'widgets/device_list.dart';
import 'widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<HomeCubit>(
        create: (context) => getIt<HomeCubit>(),
        child: const HomeLayout(),
      );
}

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadListOfDevice();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SearchBar(
                        onSearchValueChanged: (searchText) {
                          context.read<HomeCubit>().searchDevice(searchText);
                        },
                      ),
                      SizedBox(height: 12.h),
                      Expanded(
                        child: DeviceList(
                          deviceList: state.deviceList ?? [],
                          onItemTapped: (device) {
                            debugPrint('device ${device.deviceCode}');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              floatingActionButton: AddButton(
                setOnTapListener: () {
                  context.read<HomeCubit>().addNewDevice();
                },
              ),
            ),
          ),
        ),
      );
}
