import 'package:flutter/material.dart';
import 'package:flutterapp/models/player.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardWidget extends StatelessWidget {
  final Player player;
  const LeaderboardWidget({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.all(25),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        //image
        ClipOval(
         child: Image.asset(
          player.imagePath,
          height: 140,
        ),
        ),

        const SizedBox(height: 5,),
        //needed icons in here but ok
        //rank
        Text(
          "Rank " "${player.rank}",
          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
        ),

        //name of the player
        Text('${player.name}',style: TextStyle(fontSize: 14),),
      ]),
    );
  }
}
