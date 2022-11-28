import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  final ImagePicker _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async{
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery,imageQuality: 80);

    if(pickedFile != null){
      image = File(pickedFile.path);
      setState(() {

      });
    }else{
      print("no image selected");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Image"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: image == null
                ? const Center(
                    child: Text("Pick Image"),
                  )
                : Container(
              child: Center(
                child: Image.file(
                  File(image!.path).absolute,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
