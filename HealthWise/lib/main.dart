import 'package:Healthwise/pages/splashScreen.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Healthwise/pages/home.dart';
import 'package:flutter/services.dart';
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // We have removed the appbar
          // appBarTheme: const AppBarTheme(
          //   systemOverlayStyle: SystemUiOverlayStyle(
          //       statusBarColor: Colors.white,
          //       statusBarBrightness: Brightness.light),
          // ),
          scaffoldBackgroundColor: Colors.white,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color.fromARGB(255, 253, 126, 153),
            selectionColor: Color.fromARGB(255, 199, 182, 186),
            selectionHandleColor: Color.fromARGB(255, 253, 126, 153),
          ),
        ),
        home: Home());
  }
}
