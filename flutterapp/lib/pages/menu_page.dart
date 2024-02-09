import 'package:flutter/material.dart';
import 'package:flutterapp/components/button.dart';
import 'package:flutterapp/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/widgets/bottom_nav_widget.dart';
import 'package:flutterapp/models/player.dart';
import 'package:flutterapp/widgets/leaderboard_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List top3 = [
    Player(
        name: "Pookie",
        imagePath: "lib/images/milk.png",
        rank: 1,
        score: 69.420),
    Player(
        name: "Ro", imagePath: "lib/images/mocha.png", rank: 2, score: 42.069),
    Player(
        name: "Bobo", imagePath: "lib/images/bobo.png", rank: 3, score: 920170)
  ];

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
        title: Text(
          'Main Menu',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Scan Food
            Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //message

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Scan Food',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),

                        //spacing
                        const SizedBox(height: 10),

                        //cta button
                        MyButton(
                            text: "Scan",
                            onTap: () {
                              Navigator.pushNamed(context, '/scanpage');
                            })
                      ],
                    ),

                    //image
                    Image.asset(
                      "lib/images/ScanFood.png",
                      height: 120,
                    ),
                  ]),
            ),

            //spacing between cards
            const SizedBox(height: 25),

            //Daily Record
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daily Record',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //spacing between cards
            const SizedBox(height: 25),

            //Your Streak
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Streak',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //spacing between cards
            const SizedBox(height: 25),

            //Leaderboard
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Leaderboard',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            //spacing between cards
            const SizedBox(height: 25),

            Container(
              height: 300,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: top3.length,
                  itemBuilder: ((context, index) => LeaderboardWidget(
                        player: top3[index],
                      )),
                ),
              ),
            ),

            //spacing between cards
            const SizedBox(height: 25),

            Container(
              height: 100,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            ),

            //spacing between cards
            const SizedBox(height: 25),

            Container(
              height: 100,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            ),

          ],
        ),
      ),
    );
  }
}
