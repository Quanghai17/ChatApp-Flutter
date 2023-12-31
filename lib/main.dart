import 'dart:js';

import 'package:chatapptute/firebase_options.dart';
import 'package:chatapptute/pages/login_page.dart';
import 'package:chatapptute/pages/register_page.dart';
import 'package:chatapptute/services/auth/auth_gate.dart';
import 'package:chatapptute/services/auth/auth_service.dart';
import 'package:chatapptute/services/auth/login_or_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
