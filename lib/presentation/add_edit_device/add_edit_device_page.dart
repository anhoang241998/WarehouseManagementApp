import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/di/di_configure.dart';
import 'add_edit_page_params.dart';
import 'bloc/add_edit_device_cubit.dart';
import 'widgets/device_info_textfield_widget.dart';
import 'widgets/drop_down_widget.dart';
import 'widgets/image_picker_widget.dart';
import 'widgets/save_button_widget.dart';

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
  // Device Name
  final TextEditingController _deviceNameController = TextEditingController();

  // Device Code
  final TextEditingController _deviceCodeController = TextEditingController();

  // block
  final List<String> blockList = [
    'Select Block',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
  ];
  String selectedBlock = 'Select Block';

  // Device Floor
  final List<String> floorList = [
    'Select Floor',
    'I',
    'II',
    'III',
    'IV',
    'V',
    'VI',
  ];
  String selectedFloor = 'Select Floor';

  // position
  final List<String> positionList = [
    'Select Position',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
  ];
  String selectedPosition = 'Select Position';

  // sub-position
  final List<String> subPositionList = [
    'a',
    'b',
    'c',
    'd',
  ];
  String selectedSubPosition = 'a';

  String imagePath = '';
  File? file;

  Future<void> getImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      imagePath = image.path;
      setState(() {
        file = File(imagePath);
      });
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  void saveListener() {
    if (widget.params.isAddNewDevice) {
      context.read<AddEditDeviceCubit>().addNewDevice(
            deviceName: _deviceNameController.text,
            deviceCode: _deviceCodeController.text,
            floor: selectedFloor,
            block: selectedBlock,
            position: selectedPosition,
            subPosition: selectedSubPosition,
            imageUrl: imagePath,
          );
    } else {
      context.read<AddEditDeviceCubit>().editExistingDevice(
            deviceToUpdate: widget.params.device!,
            deviceName: _deviceNameController.text,
            deviceCode: _deviceCodeController.text,
            floor: selectedFloor,
            block: selectedBlock,
            position: selectedPosition,
            subPosition: selectedSubPosition,
            imageUrl: imagePath,
          );
    }
  }

  void showErrorSnackBar(BuildContext context, String msg) {
    final snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    final params = widget.params;
    _deviceNameController.text = params.device?.name ?? '';
    _deviceCodeController.text = params.device?.code ?? '';

    setState(() {
      if (widget.params.isAddNewDevice) {
        return;
      }
      selectedBlock = params.device?.block ?? '';
      selectedFloor = params.device?.floor ?? '';
      selectedPosition = params.device?.position ?? '';
      selectedSubPosition = params.device?.subPosition ?? '';
      imagePath = params.device?.imageUrl ?? '';
      file = File(imagePath);
    });
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<AddEditDeviceCubit, AddEditDeviceState>(
        listener: (context, state) {
          switch (state.status) {
            case AddEditDeviceStatus.added:
              Navigator.of(context).pop();
              break;
            case AddEditDeviceStatus.error:
              showErrorSnackBar(
                context,
                state.error ?? 'Something went wrong. Please try again',
              );
              break;
            default:
              break;
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                widget.params.isAddNewDevice ? 'Add New Device' : 'Edit Device',
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImagePickerWidget(
                        imageFile: file,
                        onImagePickerTapped: getImageFromGallery,
                      ),
                      const SizedBox(height: 30),
                      DeviceInfoTextFieldWidget(
                        label: 'Device Name',
                        controller: _deviceNameController,
                      ),
                      const SizedBox(height: 20),
                      DeviceInfoTextFieldWidget(
                        label: 'Device Code',
                        controller: _deviceCodeController,
                      ),
                      const SizedBox(height: 20),
                      DropDownWidget(
                        dropDownLabel: 'Block',
                        values: blockList,
                        selectedValue: selectedBlock,
                        isDropDownRequired: true,
                        onDropDownChangeValue: (value) => setState(
                          () => selectedBlock = value,
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropDownWidget(
                        dropDownLabel: 'Floor',
                        values: floorList,
                        selectedValue: selectedFloor,
                        isDropDownRequired: true,
                        onDropDownChangeValue: (value) => setState(
                          () => selectedFloor = value,
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropDownWidget(
                        dropDownLabel: 'Position',
                        values: positionList,
                        selectedValue: selectedPosition,
                        isDropDownRequired: true,
                        onDropDownChangeValue: (value) => setState(
                          () => selectedPosition = value,
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropDownWidget(
                        dropDownLabel: 'Sub-Position',
                        values: subPositionList,
                        selectedValue: selectedSubPosition,
                        isDropDownRequired: false,
                        onDropDownChangeValue: (value) => setState(
                          () => selectedSubPosition = value,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SaveButtonWidget(saveButtonTapped: saveListener),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
