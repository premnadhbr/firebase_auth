import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_firebase/app/provider/auth_provider.dart';
import 'package:user_management_firebase/app/utils/utils.dart';
import 'package:user_management_firebase/app/view/sign_in/signin_screen.dart';
import 'package:user_management_firebase/app/view/splashScreen/splashscreen.dart';
import 'package:user_management_firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthServices(),
        )
      ],
      child: MaterialApp(
        scaffoldMessengerKey: Utils.messKey,
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
