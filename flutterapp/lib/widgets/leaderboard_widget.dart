import 'package:flutter/material.dart';
import 'package:flutterapp/models/player.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardWidget extends StatelessWidget {
  final Player player;
  const LeaderboardWidget({
    super.key,
    required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20), 
      ),
      margin: const EdgeInsets.only(left: 25.0),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          //image
        Image.asset(
          player.imagePath,
          height: 140,
        ),

        //needed icons in here but ok
        //rank
        Text(
          "Rank""${player.rank}",
          style: GoogleFonts.dmSerifDisplay(fontSize: 20),
        ),

        //name
        SizedBox(
          width: 160,
          child: Row(
            children: [

              //name of the player
              Text('${player.name}'),
            ]
          )
        ,)
        ]
      ),
    );
  }
}
