import 'package:flutter/material.dart';
import 'package:flutterapp/components/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterapp/theme/colors.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 25),

              //app name
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "GamiFit",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),

              const SizedBox(height: 15),

              //icon
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('lib/images/onboardingimg_final.png'),
              ),

              const SizedBox(
                height: 25,
              ),

              //title
              Text(
                "YOUR DIET TRACKER FOR FITNESS",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 34,
                  color: Colors.white,
                ),
              ),

              //subtitle
              Text(
                "Keep accurate track of your food habits",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[300],
                  height: 2,
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //get started button
              MyButton(
                text: "Get Started",
                onTap:(){
                  //ontap go to the menu page
                  Navigator.pushNamed(context, '/widgettree');
                }
                ),
            ],
          ),
        ));
  }
}
