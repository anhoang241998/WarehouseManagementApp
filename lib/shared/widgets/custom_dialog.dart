import 'package:flutter/material.dart';

import '../../domain/models/device.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback cancelDialogListener;
  final void Function(Device device) confirmationDeleteListener;
  final Device device;

  const CustomDialog({
    required this.device,
    required this.cancelDialogListener,
    required this.confirmationDeleteListener,
    Key? key,
  }) : super(key: key);

  Widget _renderHeader() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Are you absolutely sure?',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );

  Widget _renderWarningNotification() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.yellow.shade200,
          border: Border.all(
            color: Colors.yellow.shade600,
          ),
        ),
        child: const Text(
          'Unexpected bad things will happen if you don’t read this!',
          style: TextStyle(fontSize: 15),
        ),
      );

  Widget _renderBodyContent(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        margin: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'This action cannot be undone. This will permanently delete the device.',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 8),
          ],
        ),
      );

  Widget _renderConfirmation(
    void Function(Device device) confirmationDeleteTapped,
    VoidCallback cancelDialogTapped,
  ) =>
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: cancelDialogTapped,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.blue,
                ),
              ),
              child: const Text('No'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                confirmationDeleteTapped(device);
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _renderHeader(),
            _renderWarningNotification(),
            _renderBodyContent(context),
            _renderConfirmation(
                confirmationDeleteListener, cancelDialogListener),
          ],
        ),
      );
}
