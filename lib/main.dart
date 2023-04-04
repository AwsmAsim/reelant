import 'package:flutter/material.dart';
import 'package:reelant_1/view/pages/app_main/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:reelant_1/view/pages/login_and_register/login_page.dart';
import 'package:reelant_1/view/pages/login_and_register/splash_screen_page.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Core());
}


class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
        ),
      debugShowCheckedModeBanner: false,
        home: SafeArea(child: SplashScreen())
    );
  }
}
