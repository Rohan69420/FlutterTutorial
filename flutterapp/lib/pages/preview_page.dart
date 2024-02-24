import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

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

                if (picture == null) return;

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
                  await referenceImageToUpload.putFile(File(picture!.path), SettableMetadata(contentType: 'image/jpeg'));
                  //success by getting download url
                  //referenceImageToUpload.getDownloadURL();
                } catch (error) {
                  //some error has occured
                }
              },
              icon: const Icon(Icons.upload_file),
            ),
          ],
        ),
      ),
    );
  }
}
