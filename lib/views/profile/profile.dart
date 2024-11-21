import 'package:flutter/material.dart';
import 'package:lab2_app/views/profile/update_profile.dart';
import 'package:lab2_app/views/profile/viewprofile.dart';
import 'package:lab2_app/widget/largelisttile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/uitm-logo.png'),
              height: MediaQuery.of(context).size.width * 0.3,
            ),
            SizedBox(height: 20),
            LargeListTile(
              title: Text('View Profile'),
              subtitle: Text('View user profile information'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewProfile()));
              },
            ),
            LargeListTile(
              title: Text('Update Profile'),
              subtitle: Text('Update user profile information'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateProfile()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
