import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/models/device.dart';
import '../../../gen/assets.gen.dart';

class DeviceList extends StatelessWidget {
  final List<Device> deviceList;
  final VoidCallback onCreateNewButtonTapped;
  final void Function(Device device) onItemTapped;
  final void Function(Device device) onItemDeleteTapped;
  final void Function(Device device) onItemExpandedListener;

  const DeviceList({
    required this.onItemExpandedListener,
    required this.onItemTapped,
    required this.onItemDeleteTapped,
    required this.deviceList,
    required this.onCreateNewButtonTapped,
    Key? key,
  }) : super(key: key);

  Widget _renderViewsIfListEmpty() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.imgNoDevice.image(
              width: 128,
              height: 128,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 18),
            Text(
              'No Device, yet.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: onCreateNewButtonTapped,
              child: const Text('Create New'),
            )
          ],
        ),
      );

  Widget _renderDeviceList() => ListView.builder(
        itemCount: deviceList.length,
        itemBuilder: (context, index) {
          final device = deviceList[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            elevation: 2,
            child: ExpansionTile(
              title: _renderTitleWithNewIndicator(
                device.isNew,
                device.name,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Code: ${device.code}'),
                    const SizedBox(height: 8),
                    Text(
                      device.shortLabel,
                      style: TextStyle(
                        color: Colors.red.shade400,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.topLeft,
              onExpansionChanged: (isExpanded) {
                if (isExpanded && device.isNew) {
                  onItemExpandedListener(device.copyWith(isNew: false));
                }
              },
              children: [
                ListTile(title: Text('Block: ${device.block}')),
                ListTile(title: Text('Floor: ${device.floor}')),
                ListTile(title: Text('Position: ${device.position}')),
                ListTile(title: Text('Sub-Position: ${device.subPosition}')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(4),
                    clipBehavior: Clip.antiAlias,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 2,
                        child: Image.file(
                          File(device.imageUrl),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _renderButton(
                        () => onItemDeleteTapped(device),
                        'Delete',
                        Icons.delete,
                        Colors.red,
                      ),
                      const SizedBox(width: 20),
                      _renderButton(
                        () => onItemTapped(device),
                        'Edit',
                        Icons.edit,
                        Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );

  Widget _renderTitleWithNewIndicator(
    bool isNew,
    String deviceName,
  ) =>
      Row(
        children: [
          isNew ? _renderNewIndicator() : const SizedBox(height: 0, width: 0),
          Flexible(
            child: Text(
              'Name: $deviceName',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );

  Widget _renderNewIndicator() => Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        margin: const EdgeInsets.only(right: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.red.shade600,
        ),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.shade100,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'New',
              style: TextStyle(color: Colors.red.shade100),
            ),
          ],
        ),
      );

  Widget _renderButton(
    void Function() onButtonClicked,
    String title,
    IconData icon,
    Color color,
  ) =>
      ElevatedButton(
        onPressed: onButtonClicked,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(fontSize: 15)),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) =>
      deviceList.isEmpty ? _renderViewsIfListEmpty() : _renderDeviceList();
}
