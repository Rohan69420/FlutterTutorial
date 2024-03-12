import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/components/button.dart';
import 'package:flutterapp/pages/profile_page.dart';
import 'package:flutterapp/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/models/player.dart';
import 'package:flutterapp/widgets/leaderboard_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/widgets/drawer.dart';
import 'package:flutterapp/components/auth.dart';
import 'package:flutterapp/components/widget_tree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final userData = FirebaseFirestore.instance.collection("Users");
  late QuerySnapshot querySnapshot;

  List top3 = [
    Player(
        name: "Rohan",
        imagePath: "lib/images/roimage.png",
        rank: 1,
        score: 69.420),
    Player(
        name: "Roshni", imagePath: "lib/images/roshni.png", rank: 2, score: 42.069),
    Player(
        name: "Player0", imagePath: "lib/images/user.png", rank: 3, score: 920170)
  ];


  void goToProfilePage() {
    //pop menu drawer
    //Navigator.pop(context);

    //go to profile page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfilePage()));
  }

  Future<void> onSignOut() async {
    await Auth().signOut();
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WidgetTree()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: Icon(
        //   Icons.menu,
        // ),
        title: Text(
          'Main Menu',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: onSignOut,
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
                      const SizedBox(height: 10),
                      MyButton(
                          text: "History",
                          onTap: () {
                            Navigator.pushNamed(context, '/calendarpage');
                          }),
                    ],
                  ),

                  //image
                  Image.asset(
                    "lib/images/checkIcon.png",
                    height: 120,
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
                mainAxisAlignment: MainAxisAlignment.start,
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
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    '0',
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 42,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    CupertinoIcons.flame,
                    size: 50,
                    color: Colors.redAccent,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Leaderboard',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 250,
                      // margin: const EdgeInsets.symmetric(horizontal: 25),
                      // padding: const EdgeInsets.symmetric(
                      //     vertical: 25, horizontal: 0),
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
                  ],
                )),

            //spacing between cards
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
