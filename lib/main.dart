import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();       // ✅ 필수
  await Firebase.initializeApp(                    // ✅ Firebase 준비 끝날 때까지 대기
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());                           // ✅ 초기화 후 앱 시작
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Locker',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SplashScreen(), // 3초 후 HomeScreen으로 pushReplacement
    );
  }
}
