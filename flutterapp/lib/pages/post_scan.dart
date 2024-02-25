import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

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
              Text(picture.name)
            ]),

            //needs a button here to upload to firebase storage
            Text("The Obtained Url is: '${imageUrl}'"),
          ],
        ),
      ),
    );
  }
}
