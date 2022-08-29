// ignore_for_file: await_only_futures, non_constant_identifier_names, avoid_print, use_key_in_widget_constructors, prefer_const_constructors, unused_import

// import 'package:center/Screens/ProfileScreen.dart';
// import 'package:center/Screens/ServiceDetailsScreen.dart';
// import 'package:center/Screens/SignInScreen.dart';
// import 'package:center/Screens/CreateProfileScreen.dart';
// import 'package:center/Screens/SubCategoriesScreen.dart';
// import 'package:center/Screens/VerifyCodeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/OnBoardingScreen.dart';
import 'Screens/SignInScreen.dart';
import 'Utils/ThemeConstants.dart';
import 'screens/BookingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

bool firstUse = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.removeAfter(initialization);
  SharedPreferences Preferences = await SharedPreferences.getInstance();
  firstUse = await Preferences.getBool("firstUse") ?? false;
  await Preferences.setBool("firstUse", true);
  runApp(MyApp());
  print("1111111");
}

/// WALAa 1
Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 2));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), //(), //firstUse ? HomeScreen() : OnBoardingScreen(),
    );
  }
}
