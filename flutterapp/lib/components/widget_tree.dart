import "package:flutter/material.dart";
import "package:flutterapp/components/auth.dart";
import "package:flutterapp/pages/menu_page.dart";
import "package:flutterapp/pages/login_page.dart";

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MenuPage();
          } else {
            return const LoginPage();
          }
        });
  }
}
