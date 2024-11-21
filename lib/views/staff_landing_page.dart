import 'package:flutter/material.dart';

import '../main.dart';
import '../controller/auth.dart';

class StaffLandingPage extends StatefulWidget {
  const StaffLandingPage({super.key});

  @override
  State<StaffLandingPage> createState() => _StaffLandingPageState();
}

class _StaffLandingPageState extends State<StaffLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/uitm-logo.png'),
            height: MediaQuery.of(context).size.width * 0.3,
          ),
          ElevatedButton(
            onPressed: () async {
              setState() {}
              await auth.signOut(context);
            },
            child: const Text('Log Out'),
          )
        ],
      ),
    ));
  }
}
