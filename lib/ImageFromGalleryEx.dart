import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_outlook/screens/components/socal.dart';
import 'package:image_picker/image_picker.dart';

class ImageFromGalleryEx extends StatefulWidget {
  final type;
  ImageFromGalleryEx(this.type);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  File? _image;
  late List data;
  var imagePicker;
  var type;

  ImageFromGalleryExState(this.type);

  void uploadImage1() async {
    var stream = http.ByteStream(_image!.openRead());
    stream.cast();
    // get file length
    var length = await _image!.length(); //imageFile is your image file

    // string to uri
    var uri = Uri.parse("https://api2.spring-boot.link/upload");

    // create multipart request
    http.MultipartRequest request = http.MultipartRequest("POST", uri);

    // multipart that takes file
    http.MultipartFile multipartFileSign = http.MultipartFile(
        'file', stream, length,
        filename: basename(_image!.path));

    // add file to multipart
    request.files.add(multipartFileSign);

    //add headers
    // request.headers.addAll(headers);

    //adding params
    // request.fields['blogName'] = 'Flutter PageView';
    // request.fields['category'] = 'FLUTTER';
    // request.fields['description'] = 'This is a Flutter PageView teach';

    // send
    http.StreamedResponse response = await request.send();

    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) async {
      Map data = {
        'blogName': "Flutter PageView",
        'category': "FLUTTER",
        "imageUrl":value.toString(),
        'description': "This is a Flutter PageView teach"
      };
      // String body = json.encode(data);

      var response1 = await http.post(Uri.parse("https://api2.spring-boot.link/blogs"),
          body: json.encode(data),
          headers: {"Content-Type": "application/json"},
          encoding: Encoding.getByName("utf-8"));

      print(value);
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(type == ImageSourceType.camera
              ? "Image from 相机"
              : "Image from 相册")),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 52,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source,
                    imageQuality: 50,
                    preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image.path);
                });
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(color: Colors.red[200]),
                child: _image != null
                    ? Image.file(
                        _image!,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                      )
                    : Container(
                        decoration: BoxDecoration(color: Colors.red[200]),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              uploadImage1();
            },
            child: Container(
              height: 50.0,
              color: Colors.green,
              child: const Text("Upload"),
            ),
          ),
        ],
      ),
    );
  }
}
