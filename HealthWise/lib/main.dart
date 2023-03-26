import 'package:Healthwise/helpers/dataVariables.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Healthwise/pages/home.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import 'package:permission_handler/permission_handler.dart';

Future<void> checkPermission() async {
  // get the current permission status
  PermissionStatus permission = await Permission.activityRecognition.status;

  if (permission == PermissionStatus.denied) {
    // if permission is denied, request permission at runtime
    permission = await Permission.activityRecognition.request();
  }

  if (permission == PermissionStatus.granted) {
    // permission granted
    print('Permission granted ==============================');
  } else {
    // permission denied
    print('Permission denied');
    openAppSettings();
  }
}

List<CameraDescription>? cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarBrightness: Brightness.light,
  //     statusBarIconBrightness: Brightness.light,
  //     systemStatusBarContrastEnforced: true
  //     // statusBarColor: bgColor,
  //     ));
  checkPermission();
  cameras = await availableCameras();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: bgColor, statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // appBarTheme: AppBarTheme(
          //   systemOverlayStyle:
          //       SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          // ),

          // scaffoldBackgroundColor: Colors.white,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color.fromARGB(255, 253, 126, 153),
            selectionColor: Color.fromARGB(255, 199, 182, 186),
            selectionHandleColor: Color.fromARGB(255, 253, 126, 153),
          ),
        ),
        home: Home());
  }
}
