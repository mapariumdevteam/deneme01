import 'package:flutter/material.dart';
import 'package:t01_dynamicforms/dynamic_form_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dynamic Forms',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const DynamicFormScreen(),
    );
  }
}
