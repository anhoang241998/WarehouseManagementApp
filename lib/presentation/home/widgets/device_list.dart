import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../domain/models/device.dart';

class DeviceList extends StatelessWidget {
  final List<Device> deviceList;
  final void Function(Device device) onItemTapped;

  const DeviceList({
    required this.onItemTapped,
    required this.deviceList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: deviceList.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final deviceCode = deviceList[index].deviceCode;
          return InkWell(
            onTap: () => onItemTapped(deviceList[index]),
            child: ListTile(
              title: Text('Code: $deviceCode'),
              trailing: QrImage(data: deviceCode, gapless: false),
            ),
          );
        },
      );
}
