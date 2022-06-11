import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twistcode/providers/store.dart';
import 'package:twistcode/views/init/init_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StoreProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InitScreen(),
      ),
    );
  }
}
