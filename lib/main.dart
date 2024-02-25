import 'package:dashboard/home.dart';
import 'package:dashboard/modules/bindings/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashboard/data/database_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 48, 0, 130)),
        useMaterial3: true,
      ),initialBinding: HomeBinding(),
      home: HomePage(),
    );
  }
}
