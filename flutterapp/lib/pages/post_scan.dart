import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PostScanPage extends StatefulWidget {
  PostScanPage({Key? key, required this.picture, required this.imageUrl})
      : super(key: key);

  final XFile picture;
  final String imageUrl;

  @override
  State<PostScanPage> createState() => _PostScanPageState();
}

class _PostScanPageState extends State<PostScanPage> {
  String NutritionDetails = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Results')),
      body: Center(
        child: Column(
          children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
              Image.file(File(widget.picture.path),
                  fit: BoxFit.cover, width: 250),
              const SizedBox(height: 24),
              Text(widget.picture.name),

              //needs a button here to upload to firebase storage
              Text("The Obtained Url is: '${widget.imageUrl}'"),

              const SizedBox(
                height: 20,
              ),

              Text(" '${NutritionDetails}'"),

              const SizedBox(
                height: 20,
              ),

              //http get request code here
              ElevatedButton(
                onPressed: () async {
                  //YAssssssssss the splot worked!
                  String forwardedUrl = 'http://10.0.2.2:5000/imgUrl?url=' +
                      widget.imageUrl.split('%2F')[1].toString();
                  print("The split url is: ${forwardedUrl}");
                  var url = Uri.parse(forwardedUrl);
                  var response = await http.get(url);
                  setState(() {
                    NutritionDetails = response.body;
                  });
                  print('Response status: ${response.statusCode}');
                  print('Response body: ${response.body}');
                },
                child: const Text("Load Results"),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
