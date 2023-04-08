import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:uuid/uuid.dart';

import 'models/Blog.dart';

// class UploadPage extends StatefulWidget {
//   const UploadPage({Key? key}) : super(key: key);
//
//   @override
//   _UploadPageState createState() => _UploadPageState();
// }
//
// class _UploadPageState extends State<UploadPage> {
//   List<Widget> itemPhotosWidgetList = <Widget>[];
//
//   final ImagePicker _picker = ImagePicker();
//   File? file;
//   List<XFile>? photo = <XFile>[];
//   List<XFile> itemImagesList = <XFile>[];
//
//   List<String> downloadUrl = <String>[];
//
//   bool uploading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     double _screenwidth = MediaQuery.of(context).size.width,
//         _screenheight = MediaQuery.of(context).size.height;
//     return LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           if (constraints.maxWidth < 480) {
//             return displayPhoneUploadFormScreen(_screenwidth, _screenheight);
//           } else {
//             return displayWebUploadFormScreen(_screenwidth, _screenheight);
//           }
//         });
//   }
//
//   displayPhoneUploadFormScreen(_screenwidth, _screenheight) {
//     return Container();
//   }
//
//   displayWebUploadFormScreen(_screenwidth, _screenheight) {
//     return OKToast(
//         child: Scaffold(
//           body: Column(
//             children: [
//               const SizedBox(
//                 height: 100.0,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12.0),
//                     color: Colors.white70,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.shade200,
//                         offset: const Offset(0.0, 0.5),
//                         blurRadius: 30.0,
//                       )
//                     ]),
//                 width: _screenwidth * 0.7,
//                 height: 300.0,
//                 child: Center(
//                   child: itemPhotosWidgetList.isEmpty
//                       ? Center(
//                     child: MaterialButton(
//                       onPressed: pickPhotoFromGallery,
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: Center(
//                           child: Image.network(
//                             "https://static.thenounproject.com/png/3322766-200.png",
//                             height: 100.0,
//                             width: 100.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                       : SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: Wrap(
//                       spacing: 5.0,
//                       direction: Axis.horizontal,
//                       children: itemPhotosWidgetList,
//                       alignment: WrapAlignment.spaceEvenly,
//                       runSpacing: 10.0,
//                     ),
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 50.0,
//                       left: 100.0,
//                       right: 100.0,
//                     ),
//                     child: ElevatedButton(
//                         // shape: RoundedRectangleBorder(
//                         //   borderRadius: BorderRadius.circular(10),
//                         // ),
//                         // padding: const EdgeInsets.symmetric(
//                         //     horizontal: 20.0, vertical: 15.0),
//                         // color: const Color.fromRGBO(0, 35, 102, 1),
//                         onPressed: uploading ? null : () => upload(),
//                         child: uploading
//                             ? const SizedBox(
//                           child: CircularProgressIndicator(),
//                           height: 15.0,
//                         )
//                             : const Text(
//                           "Add",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         )),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
//
//   addImage() {
//     for (var bytes in photo!) {
//       itemPhotosWidgetList.add(Padding(
//         padding: const EdgeInsets.all(1.0),
//         child: Container(
//           height: 90.0,
//           child: AspectRatio(
//             aspectRatio: 16 / 9,
//             child: Container(
//               child: kIsWeb
//                   ? Image.network(File(bytes.path).path)
//                   : Image.file(
//                 File(bytes.path),
//               ),
//             ),
//           ),
//         ),
//       ));
//     }
//   }
//
//   pickPhotoFromGallery() async {
//     photo = await _picker.pickMultiImage();
//     if (photo != null) {
//       setState(() {
//         itemImagesList = itemImagesList + photo!;
//         addImage();
//         photo!.clear();
//       });
//     }
//   }
//
//   upload() async {
//     String productId = await uplaodImageAndSaveItemInfo();
//     setState(() {
//       uploading = false;
//     });
//     showToast("Image Uploaded Successfully");
//   }
//
//   Future<String> uplaodImageAndSaveItemInfo() async {
//     setState(() {
//       uploading = true;
//     });
//     PickedFile? pickedFile;
//     String? productId = const Uuid().v4();
//     for (int i = 0; i < itemImagesList.length; i++) {
//       file = File(itemImagesList[i].path);
//       pickedFile = PickedFile(file!.path);
//
//       await uploadImageToStorage(pickedFile, productId);
//     }
//     return productId;
//   }
//
//   Future uploadImage2(Blog blog,PickedFile pickedFile) async {
//     String image1 = "";
//     String image2 = "";
//     var url = Uri.parse("https://api2.spring-boot.link/upload");
//     var request = http.MultipartRequest("POST", url);
//     request.files.add(
//       await http.MultipartFile.fromBytes("file", pickedFile!,
//           filename: "Any_name.jpg"),
//     );
//     request.send().then((response) async {
//       if (response.statusCode == 200) {
//         response.stream.transform(utf8.decoder).listen((event) async {
//           image1 = event;
//           var url = Uri.parse("https://api2.spring-boot.link/upload");
//           var request1 = http.MultipartRequest("POST", url);
//           request1.files.add(
//             await http.MultipartFile.fromBytes("file", _selectedFile1!,
//                 filename: "Any_name.jpg"),
//           );
//           request1.send().then((value) {
//             if (value.statusCode == 200) {
//               value.stream.transform(utf8.decoder).listen((event) async {
//                 Map data = {
//                   'blogName': blog.getBlogName(),
//                   'category': blog.getCategory(),
//                   "imageUrl": image1,
//                   "imageUrl1": event.toString(),
//                   'description': blog.getDescription()
//                 };
//                 // String body = json.encode(data);
//
//                 var response1 = await http.post(
//                     Uri.parse("https://api2.spring-boot.link/blogs"),
//                     body: json.encode(data),
//                     headers: {"Content-Type": "application/json"},
//                     encoding: Encoding.getByName("utf-8"));
//
//                 print(event);
//               });
//             }
//           });
//         });
//       }
//     });
//   }
// }


// Future uploadImage2(Blog blog) async {
//   String image1 = "";
//   String image2 = "";
//   var url = Uri.parse("https://api2.spring-boot.link/upload");
//   var request = http.MultipartRequest("POST", url);
//   request.files.add(
//     await http.MultipartFile.fromBytes("file", _selectedFile1!,
//         filename: "Any_name.jpg"),
//   );
//   request.send().then((response) async {
//     if (response.statusCode == 200) {
//       response.stream.transform(utf8.decoder).listen((event) async {
//         image1 = event;
//         var url = Uri.parse("https://api2.spring-boot.link/upload");
//         var request1 = http.MultipartRequest("POST", url);
//         request1.files.add(
//           await http.MultipartFile.fromBytes("file", _selectedFile1!,
//               filename: "Any_name.jpg"),
//         );
//         request1.send().then((value) {
//           if (value.statusCode == 200) {
//             value.stream.transform(utf8.decoder).listen((event) async {
//               Map data = {
//                 'blogName': blog.getBlogName(),
//                 'category': blog.getCategory(),
//                 "imageUrl": image1,
//                 "imageUrl1": event.toString(),
//                 'description': blog.getDescription()
//               };
//               // String body = json.encode(data);
//
//               var response1 = await http.post(
//                   Uri.parse("https://api2.spring-boot.link/blogs"),
//                   body: json.encode(data),
//                   headers: {"Content-Type": "application/json"},
//                   encoding: Encoding.getByName("utf-8"));
//
//               print(event);
//             });
//           }
//         });
//       });
//     }
//   });
// }