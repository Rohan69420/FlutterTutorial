import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/pages/post_scan.dart';

class PreviewPage extends StatelessWidget {
  PreviewPage({Key? key, required this.picture}) : super(key: key);

  final XFile picture;
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview Page')),
      body: Center(
        child: Column(
          children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
              Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
              const SizedBox(height: 24),
              Text(picture.name)
            ]),

            //needs a button here to upload to firebase storage
            IconButton(
              onPressed: () async {
                print('Image path is here:' '${picture.path}');

                if (picture == null) {
                  print("null!");
                  return;
                }

                String uniqueFileName =
                    DateTime.now().microsecondsSinceEpoch.toString();

                Reference referenceRoot = FirebaseStorage.instance.ref();
                Reference referenceDirImages = referenceRoot.child('images');

                //create a reference for the image to be stored
                Reference referenceImageToUpload =
                    referenceDirImages.child(uniqueFileName);

                //handle error/success
                try {
                  //store the file with settable metadata
                  await referenceImageToUpload.putFile(File(picture.path), SettableMetadata(contentType: 'image/jpeg'));
                  //success by getting download url
                  imageUrl = await referenceImageToUpload.getDownloadURL();
                } catch (error) {
                  //some error has occured
                }

                //push the necessary detail and transition to the results page
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostScanPage(picture: picture,imageUrl: imageUrl,),
                      ));
                
              },
              icon: const Icon(Icons.upload_file),
            ),
          ],
        ),
      ),
    );
  }
}
