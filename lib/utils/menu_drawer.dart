import 'package:flutter/material.dart';
import 'package:hystero/auth/logout.dart';
import 'package:hystero/screens/landing_pg.dart';
import 'package:hystero/screens/loading_screen.dart';
import 'package:hystero/screens/profile.dart';
import 'package:hystero/utils/size_configs.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(255, 221, 210, 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(45),
        ),
        const Center(
          child: Text(
            'Hsytero-Vision',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
      ],
    );
  }

  buildMenuItems(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(LandingPage.routeName);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'Testing Module',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(LoadingScreen.routeName);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'Logout',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Logout.routeName);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
