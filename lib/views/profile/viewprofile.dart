import 'package:flutter/material.dart';
import 'package:lab2_app/widget/largelisttile.dart';
import 'package:provider/provider.dart';

import '../../controller/auth.dart';
import '../../provider/student_profile_provider.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the screen initializes
    Future.microtask(() =>
        Provider.of<StudentProfileProvider>(context, listen: false)
            .fetchProfileData());
  }

  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<StudentProfileProvider>(context);

    if (userProfileProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text("User Profile")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final profileData = userProfileProvider.profileData;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: profileData != null
              ? Column(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.people_alt),
                      radius: 40,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'General Information',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    LargeListTile(
                      title: Text('Student ID'),
                      subtitle: Text("${profileData['uid']}"),
                    ),
                    LargeListTile(
                      title: Text('Current Email'),
                      subtitle: Text("${profileData['email']}"),
                    ),
                    LargeListTile(
                      title: Text('Full Name'),
                      subtitle: Text("${profileData['full name']}"),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Academic Information',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    LargeListTile(
                      title: Text('Semester'),
                      subtitle: Text("${profileData['semester']}"),
                    ),
                    LargeListTile(
                      title: Text('Faculty Name'),
                      subtitle: Text("${profileData['faculty name']}"),
                    ),
                    LargeListTile(
                      title: Text('Course Name'),
                      subtitle: Text("${profileData['course name']}"),
                    ),
                    LargeListTile(
                      title: Text('Course Code'),
                      subtitle: Text("${profileData['course code']}"),
                    ),
                    LargeListTile(
                      title: Text('Enrollment Status'),
                      subtitle: Text("${profileData['enrollment status']}"),
                    ),
                  ],
                )
              : Center(
                  child: Text('No profile data available'),
                ),
        ),
      ),
    );
  }
}
