import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with AutomaticKeepAliveClientMixin<UserPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const UserLayout();
  }

  @override
  bool get wantKeepAlive => true;
}

class UserLayout extends StatelessWidget {
  const UserLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('hello'),
        ),
        body: const Center(
          child: Text('User'),
        ),
      );
}
