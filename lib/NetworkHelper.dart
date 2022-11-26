import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_outlook/models/Blog.dart';

  Future<List<Blog>> getData() async{
    List<Blog> blogList = [];
    const String apiUrl = "http://springbootblog-env.eba-i59x59qr.us-east-1.elasticbeanstalk.com/blogs";
    Utf8Decoder utf8decoder = new Utf8Decoder();
    http.Response response = await http.get(Uri.parse(apiUrl));
    if(response.statusCode == 200){
      String data = utf8decoder.convert(response.bodyBytes);
      for(int i = 0;i<3;i++){
        Blog blog = Blog();
        int blogId = jsonDecode(data)[i]['blogId'];
        String blogName = jsonDecode(data)[i]['blogName'];
        String category = jsonDecode(data)[i]['category'];
        String imageUrl = jsonDecode(data)[i]['imageUrl'];
        String description = jsonDecode(data)[i]['description'];
        String createDate = jsonDecode(data)[i]['createdDate'];
        String newCreateDate = createDate.substring(0,10);
        String lastModifiedDate = jsonDecode(data)[i]['lastModifiedDate'];
        blog.setBlogId(blogId);
        blog.setBlogName(blogName);
        blog.setCategory(category);
        blog.setImageUrl(imageUrl);
        blog.setDescription(description);
        blog.setCreateDate(newCreateDate);
        blog.setLastModifiedDate(lastModifiedDate);
        blogList.add(blog);
      }
      for(int i = 0;i<blogList.length;i++){
        print(blogList[i].getBlogName());
        print(blogList.length);
      }
      return blogList;
    }else{
      print(response.statusCode);
      throw Exception('');
    }
  }
