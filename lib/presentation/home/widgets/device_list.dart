import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../domain/models/device_entity.dart';

class DeviceList extends StatelessWidget {
  final List<DeviceEntity> deviceList;

  const DeviceList({required this.deviceList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: deviceList.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final deviceCode = deviceList[index].deviceCode;
          return ListTile(
            title: Text('Device code: $deviceCode'),
            trailing: QrImage(data: deviceCode, gapless: false),
          );
        },
      );
}
