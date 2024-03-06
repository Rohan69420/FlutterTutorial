import 'package:flutter/material.dart';
import 'package:flutterapp/components/drawerlist_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      // ignore: prefer_const_constructors
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          //header
          const DrawerHeader(
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 64,
            ),
          ),

          //home
          DrawerListTile(
            icon: Icons.home, 
            text: 'M A I N    P A G E',
            onTap: () => Navigator.pop(context),
            ),

          //profile
          DrawerListTile(
            icon: Icons.person, 
            text: 'P R O F I L E', 
            onTap: onProfileTap),

          //logout
          DrawerListTile(
            icon: Icons.person, 
            text: 'L O G  O U T ', 
            onTap: onSignOut),
        ],
      ),
    );
  }
}
