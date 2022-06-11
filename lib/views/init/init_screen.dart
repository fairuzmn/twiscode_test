import 'package:flutter/material.dart';
import 'package:twistcode/utils/size_config.dart';
import 'package:twistcode/views/home/home_screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, Orientation orientation) {
          SizeConfig().init(context);
          return const HomeScreen();
        },
      ),
    );
  }
}
