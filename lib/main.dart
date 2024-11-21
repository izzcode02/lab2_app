import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; //new
import 'package:provider/provider.dart';
import 'package:lab2_app/views/admin_landing_page.dart';
import 'package:lab2_app/views/login_screen.dart';
import 'package:lab2_app/views/staff_landing_page.dart';
import 'package:lab2_app/views/student_landing_page.dart';

import 'controller/auth.dart';
import 'provider/student_profile_provider.dart';
import 'views/register.dart';

AuthService auth = AuthService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCPSKLPpZfuGHU2yHb4eDsmNl3dP3Vlan0',
      appId: '1:813370372349:android:550f18d8c2dfb257dfce94',
      messagingSenderId: '813370372349',
      projectId: 'student-management-syste-8475b',
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentProfileProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        //login
        '/login': (context) => const LoginScreen(),

        //register
        '/register': (context) => const RegistrationScreen(),

        //user
        '/users/admin': (context) => const AdminLandingPage(),
        '/users/staff': (context) => const StaffLandingPage(),
        '/users/student': (context) => const StudentLandingPage(),
      },
    );
  }
}
