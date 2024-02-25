import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class PostScanPage extends StatelessWidget {
  PostScanPage({Key? key, required this.picture, required this.imageUrl}) : super(key: key);

  final XFile picture;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Results')),
      body: Center(
        child: Column(
          children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
              Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
              const SizedBox(height: 24),
              Text(picture.name),

            //needs a button here to upload to firebase storage
            Text("The Obtained Url is: '${imageUrl}'"),
            
            //debug button
            ElevatedButton(onPressed: () {
              //YAssssssssss the splot worked!
              String parsedUrl = imageUrl.split('%2F')[1].toString();
              print("The split url is: ${parsedUrl}");

            }, child: const Text("Button for debug")),

            //http get request code here
            // ElevatedButton(onPressed: ()
            // async {
            //   String parsedUrl = imageUrl.split('%F').toString();

            //   var url = Uri.parse('127.0.0.1/5000');
            //   var response = await http.get(url);
            //   print('Response status: ${response.statusCode}');
            //   print('Response body: ${response.body}');
            // },
            // child: const Text("Load Results"),),
            ]),
          ],
        ),
      ),
    );
  }
}
