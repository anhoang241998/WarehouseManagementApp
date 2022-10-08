import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/models/device.dart';
import '../../shared/di/di_configure.dart';
import '../../shared/routes/app_route.dart';
import '../../shared/widgets/custom_dialog.dart';
import '../add_edit_device/add_edit_device_page.dart';
import 'bloc/home_cubit.dart';
import 'widgets/add_button.dart';
import 'widgets/device_list.dart';
import 'widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<HomeCubit>(
      create: (context) => getIt<HomeCubit>(),
      child: const HomeLayout(),
    );
  }

  @override
  bool get wantKeepAlive => true;
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

  void listenerForAddButton() {
    Navigator.of(context)
        .pushNamed(AppRoute.addEditRoute,
            arguments: const AddEditPageParams(isAdd: true))
        .then((_) => context.read<HomeCubit>().loadListOfDevice());
  }

  void deleteDevice(Device device) {
    context.read<HomeCubit>().deleteDevice(device);
    Navigator.of(context).pop(context);
  }

  void updateUnseenDevice(Device device) {
    context.read<HomeCubit>().updateUnseenDeviceToReadDevice(device);
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Search'),
              ),
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
                          onItemExpandedListener: updateUnseenDevice,
                          onCreateNewButtonTapped: listenerForAddButton,
                          onItemTapped: (device) {
                            // Navigator.of(context).pushNamed(
                            //   AppRoute.addEditRoute,
                            //   arguments: AddEditPageParams(
                            //     isAdd: false,
                            //     device: device,
                            //   ),
                            // );
                          },
                          onItemDeleteTapped: (device) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => CustomDialog(
                                device: device,
                                cancelDialogListener: () {
                                  Navigator.of(context).pop(context);
                                },
                                confirmationDeleteListener: deleteDevice,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              floatingActionButton: (state.deviceList ?? []).isEmpty
                  ? null
                  : AddButton(setOnTapListener: listenerForAddButton),
            ),
          ),
        ),
      );
}
