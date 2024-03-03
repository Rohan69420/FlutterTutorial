import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutterapp/pages/camera_page.dart';
import 'package:flutterapp/pages/preview_page.dart';
import 'package:image_picker/image_picker.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose Method")),
      body: SafeArea(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await availableCameras().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CameraPage(cameras: value))));
              },
              child: const Text("Take a Picture"),
            ),

            const SizedBox(height:20,),
            
            ElevatedButton(
              onPressed: () async {
                ImagePicker imagePicker = ImagePicker();
                XFile? picture =
                    await imagePicker.pickImage(source: ImageSource.gallery);

                if (picture != null) {
                  //forwarding this to the preview page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PreviewPage(
                                picture: picture,
                              )));
                }
              },
              child: const Text("Select From Gallery"),
            ),
          ],
        )
        ),
      ),
    );
  }
}
