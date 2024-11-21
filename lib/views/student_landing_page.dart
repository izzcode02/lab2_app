import 'package:flutter/material.dart';
import 'package:lab2_app/views/profile/profile.dart';
import 'package:lab2_app/views/profile/viewprofile.dart';
import 'package:lab2_app/widget/yes_no_dialog.dart';

import '../main.dart';
import '../controller/auth.dart';
import '../widget/balancedgridmenu.dart';

class StudentLandingPage extends StatefulWidget {
  const StudentLandingPage({super.key});

  @override
  State<StudentLandingPage> createState() => _StudentLandingPageState();
}

class _StudentLandingPageState extends State<StudentLandingPage> {
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
          BalancedGridView(columnCount: 2, children: [
            MenuCardSmallTile(
              imageLink: 'assets/icons/profile.png',
              label: 'Profile',
              nextScreen: (context) => const ProfilePage(),
            ),
            MenuCardSmallTile(
              imageLink: 'assets/icons/logout.png',
              label: 'Logout',
              nextScreen: (context) => Container(),
              logout: true,
            ),
          ]),
        ],
      ),
    ));
  }
}

class MenuCardSmallTile extends StatelessWidget {
  const MenuCardSmallTile({
    Key? key,
    required this.imageLink,
    required this.label,
    required this.nextScreen,
    this.logout = false,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  final String imageLink;
  final String label;
  final WidgetBuilder nextScreen;
  final Color? backgroundColor;
  final bool? logout;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: backgroundColor,
      child: InkWell(
        onTap: () async {
          if (logout == true) {
            final continueLogout = await showYesNoDialog(
              context: context,
              title: 'Log out',
              message: 'Are you sure you want to logout?',
            );
            if (continueLogout == true) {
              await auth.signOut(context);
            }
          } else {
            Navigator.push(context, MaterialPageRoute(builder: nextScreen));
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(imageLink),
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: textTheme.labelMedium!.copyWith(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
