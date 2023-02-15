import 'package:Healthwise/pages/listPage.dart';
import 'package:Healthwise/pages/resultPage.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Healthwise/pages/home.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

List<CameraDescription>? cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color.fromARGB(255, 253, 126, 153),
            selectionColor: Color.fromARGB(255, 253, 126, 153),
            selectionHandleColor: Color.fromARGB(255, 253, 126, 153),
          ),
        ),
        home: Home());
  }
}
