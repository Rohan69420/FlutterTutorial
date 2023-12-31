import 'package:flutter/material.dart';
import 'package:flutterapp/components/button.dart';
import 'package:flutterapp/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          ),
          title: Text('Main Menu', style: TextStyle(color: Colors.grey[900]),),
          ),
      body: Column(
        children: [
          //Scan Food
          Container(
            decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25), 
            padding: const EdgeInsets.all(25),
            child: Row(children: [
              //message
              Column(
                children: [
                  Text('Scan Food',style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20,
                    color: Colors.white,
                  ),),
              
              //spacing
              const SizedBox(height:20),

              //cta button
              MyButton(
                text: "Scan", 
              onTap: () {
                  Navigator.pushNamed(context, '/scanpage');
              }
              )
                ],
              ),


              //image
            ]),
          ),

          //Daily Record

          //Your Streak

          //Leaderboard
        ],


      ),
    );
  }
}