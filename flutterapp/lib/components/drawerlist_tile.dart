import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;

  const DrawerListTile({super.key,
   required this.icon, 
   required this.text,
   required this.onTap,
   });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left:40.0),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      onTap: onTap,
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
