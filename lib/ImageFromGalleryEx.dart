import 'dart:io';
import 'dart:convert';
import 'package:async/async.dart';
import 'dart:html' as html;
import 'package:flutter_outlook/models/Blog.dart';
import 'package:flutter_outlook/size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_outlook/screens/components/socal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'constants.dart';

class ImageFromGalleryEx extends StatefulWidget {
  const ImageFromGalleryEx({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<ImageFromGalleryEx> {
  List<Widget> itemPhotosWidgetList = <Widget>[];
  File? _image;
  final ImagePicker _picker = ImagePicker();
  File? file;
  List<int>? _selectedFile;
  Uint8List? _bytesData;
  // List<Widget> children = [];
  List<Uint8List>? _bytesDataList;
  List<XFile>? photo = <XFile>[];
  List<XFile> itemImagesList = <XFile>[];

  List<String> downloadUrl = <String>[];

  bool uploading = false;


  void startWebFilePicker() async{
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;

      for(int i = 0;i<files!.length;i++){
        final file = files[i];
        final reader = html.FileReader();
        reader.onLoadEnd.listen((event) {
          setState(() {
            _bytesData = Base64Decoder().convert(reader.result.toString().split(",").last);
            _bytesDataList!.add(Base64Decoder().convert(reader.result.toString().split(",").last));
            reader.readAsDataUrl(file);
          });
        });
      }
        // setState(() {
        //   _selectedFile = _bytesData!.cast();
        //   // print("hello:"+_bytesDataList.length.toString());
        // });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width,
        _screenheight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 480) {
            return displayPhoneUploadFormScreen(_screenwidth, _screenheight);
          } else {
            return displayWebUploadFormScreen(_screenwidth, _screenheight);
          }
        });
  }

  displayPhoneUploadFormScreen(_screenwidth, _screenheight) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          var source = ImageSource.gallery;
          XFile? image = await _picker.pickImage(
              source: source,
              imageQuality: 50,
              preferredCameraDevice: CameraDevice.front);
          setState(() {
            _image = File(image!.path);
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
    );
  }

  displayWebUploadFormScreen(_screenwidth, _screenheight) {
    return Column(
      children: <Widget>[
      SizedBox(
      height: 52,
    ),
    _bytesData != null ?
        GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:  4,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.693,
            ),
            itemBuilder: (context,index){
              return Image.memory(_bytesDataList![index],width: 200,height: 200,);
            })
     :
    Container(),
        Center(
          child: TextButton(
            onPressed: (){
              startWebFilePicker();
            },
            child: Text("select photo",style: TextStyle(
              color: Colors.green,
            ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: (){
              Blog b = Blog();
              b.setBlogName("Hello");
              b.setCategory("IOS");
              b.setImageUrl1("https://firebasestorage.googleapis.com/v0/b/blog-5f1d9.appspot.com/o/489efd03-b411-4b81-83c4-43248de9bc89.png?alt=media");
              b.setDescription("This is IOS teach.");
              uploadImage2(b);
            }, 
            child: const Text("Upload"),
        ),
    ]);
      // OKToast(
      //   child: Scaffold(
      //     body: Column(
      //       children: [
      //         const SizedBox(
      //           height: 100.0,
      //         ),
      //         Container(
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(12.0),
      //               color: Colors.white70,
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.grey.shade200,
      //                   offset: const Offset(0.0, 0.5),
      //                   blurRadius: 30.0,
      //                 )
      //               ]),
      //           width: _screenwidth * 0.7,
      //           height: 300.0,
      //           child: Center(
      //             child: itemPhotosWidgetList.isEmpty
      //                 ? Center(
      //               child: MaterialButton(
      //                 onPressed: pickPhotoFromGallery,
      //                 child: Container(
      //                   alignment: Alignment.bottomCenter,
      //                   child: Center(
      //                     child: Image.network(
      //                       "https://static.thenounproject.com/png/3322766-200.png",
      //                       height: 100.0,
      //                       width: 100.0,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             )
      //                 : SingleChildScrollView(
      //               scrollDirection: Axis.vertical,
      //               child:
      //               GridView.builder(
      //                   shrinkWrap: true,
      //                   itemCount: itemPhotosWidgetList.length,
      //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                     crossAxisCount: SizeConfig.orientation == Orientation.portrait ? 2 : 4,
      //                     mainAxisSpacing: 20,
      //                     crossAxisSpacing: 20,
      //                     childAspectRatio: 0.693,
      //                   ),
      //                   itemBuilder: (context,index){
      //                     return itemPhotosWidgetList[index];
      //                   }),
      //               // Wrap(
      //               //   spacing: 5.0,
      //               //   direction: Axis.horizontal,
      //               //   children: itemPhotosWidgetList,
      //               //   alignment: WrapAlignment.spaceEvenly,
      //               //   runSpacing: 10.0,
      //               // ),
      //             ),
      //           ),
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.only(
      //                 top: 50.0,
      //                 left: 100.0,
      //                 right: 100.0,
      //               ),
      //               child: ElevatedButton(
      //                   // shape: RoundedRectangleBorder(
      //                   //   borderRadius: BorderRadius.circular(10),
      //                   // ),
      //                   // padding: const EdgeInsets.symmetric(
      //                   //     horizontal: 20.0, vertical: 15.0),
      //                   // color: const Color.fromRGBO(0, 35, 102, 1),
      //                   onPressed: uploading ? null : () => upload(),
      //                   child: uploading
      //                       ? const SizedBox(
      //                     child: CircularProgressIndicator(),
      //                     height: 15.0,
      //                   )
      //                       : const Text(
      //                     "Add",
      //                     style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 20.0,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   )),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ));
  }

  addImage() {
    for (var bytes in photo!) {
      itemPhotosWidgetList.add(Padding(
        padding: const EdgeInsets.all(1.0),
        child:
        Container(
          height: 90.0,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              child: kIsWeb
                  ? Image.network(File(bytes.path).path)
                  : Image.file(
                File(bytes.path),
              ),
            ),
          ),
        ),
      ));
    }
  }

  pickPhotoFromGallery() async {
    photo = await _picker.pickMultiImage();
    if (photo != null) {
      setState(() {
        itemImagesList = itemImagesList + photo!;
        addImage();
        photo!.clear();
      });
    }
  }

  upload() async {
    String productId = await uplaodImageAndSaveItemInfo();
    setState(() {
      uploading = false;
    });
    showToast("Image Uploaded Successfully");
  }

  Future<String> uplaodImageAndSaveItemInfo() async {
    setState(() {
      uploading = true;
    });
    PickedFile? pickedFile;
    String? productId = const Uuid().v4();
    for (int i = 0; i < itemImagesList.length; i++) {
      file = File(itemImagesList[i].path);
      pickedFile = PickedFile(file!.path);
      Blog blog = Blog();
      blog.setBlogName("Hello");
      blog.setCategory("IOS");
      blog.setDescription("This is a Flutter PageView teach");
      blog.setImageUrl1("https://firebasestorage.googleapis.com/v0/b/blog-5f1d9.appspot.com/o/489efd03-b411-4b81-83c4-43248de9bc89.png?alt=media");
      await uploadImage2(blog);
    }
    return productId;
  }


  Future uploadImage2(Blog blog) async {
  String image1 = "";
  String image2 = "";
  // var stream  = new http.ByteStream(pickedFile.openRead());
  // var length = await pickedFile.length();
  // stream.cast();
  var url = Uri.parse("https://api2.spring-boot.link/upload");
  var request = http.MultipartRequest("POST", url);
  request.files.add(
    await http.MultipartFile.fromBytes("file", _selectedFile!,
        filename: "Any_name.jpg"),
  );
  request.send().then((response) async {
    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((event) async{
        Map data = {
                'blogName': blog.getBlogName(),
                'category': blog.getCategory(),
                "imageUrl": event.toString(),
                "imageUrl1": blog.getImageUrl1(),
                'description': blog.getDescription()
              };
              // String body = json.encode(data);

              var response1 = await http.post(
                  Uri.parse("https://api2.spring-boot.link/blogs"),
                  body: json.encode(data),
                  headers: {"Content-Type": "application/json"},
                  encoding: Encoding.getByName("utf-8"));
      });
    }
  });
}

}