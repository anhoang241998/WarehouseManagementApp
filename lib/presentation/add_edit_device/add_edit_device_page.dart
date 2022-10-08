import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../domain/models/device.dart';
import '../../shared/di/di_configure.dart';
import 'bloc/add_edit_device_cubit.dart';

class AddEditPageParams extends Equatable {
  final bool isAdd;
  final Device? device;

  const AddEditPageParams({
    required this.isAdd,
    this.device,
  });

  @override
  List<Object?> get props => [isAdd, device];

  @override
  bool? get stringify => true;
}

class AddEditDevicePage extends StatelessWidget {
  final AddEditPageParams params;

  const AddEditDevicePage({
    required this.params,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<AddEditDeviceCubit>(
        create: (context) => getIt<AddEditDeviceCubit>(),
        child: AddEditDeviceLayout(
          params: params,
        ),
      );
}

class AddEditDeviceLayout extends StatefulWidget {
  final AddEditPageParams params;

  const AddEditDeviceLayout({
    required this.params,
    Key? key,
  }) : super(key: key);

  @override
  State<AddEditDeviceLayout> createState() => _AddEditDeviceLayoutState();
}

class _AddEditDeviceLayoutState extends State<AddEditDeviceLayout> {
  final TextEditingController _controller = TextEditingController();
  String _deviceCode = '';

  @override
  Widget build(BuildContext context) =>
      BlocListener<AddEditDeviceCubit, AddEditDeviceState>(
        listener: (context, state) {
          switch (state.status) {
            case AddEditDeviceStatus.added:
              Navigator.of(context).pop();
              break;
            case AddEditDeviceStatus.error:
              break;
            default:
              break;
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title:
                  Text(widget.params.isAdd ? 'Add New Device' : 'Edit Device'),
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<AddEditDeviceCubit>()
                        .addNewDevice(_controller.text);
                  },
                  icon: const Icon(Icons.save),
                )
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          labelText: 'Device Code',
                        ),
                      ),
                      SizedBox(height: 8.h),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _deviceCode = _controller.text;
                          });
                        },
                        child: Text(
                          'Generate Qr Image',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      QrImage(
                        data: _deviceCode,
                        gapless: false,
                        size: 200,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
