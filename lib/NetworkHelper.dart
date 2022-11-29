import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_outlook/models/Blog.dart';
import 'models/Product.dart';

  Future<List<Blog>> getData() async{
    List<Blog> blogList = [];
    const String apiUrl = "https://api2.spring-boot.link/blogs";
    // const String apiUrl = "https://api.spring-boot.link/products";
    Utf8Decoder utf8decoder = new Utf8Decoder();
    http.Response response = await http.get(Uri.parse(apiUrl));
    if(response.statusCode == 200){
      String data = utf8decoder.convert(response.bodyBytes);
      int limit = jsonDecode(data)['limit'];
      for(int i = 0;i<limit;i++){
        Blog blog = Blog();
        int blogId = jsonDecode(data)['results'][i]['blogId'];
        String blogName = jsonDecode(data)['results'][i]['blogName'];
        String category = jsonDecode(data)['results'][i]['category'];
        String imageUrl = jsonDecode(data)['results'][i]['imageUrl'];
        String imageUrl1 = jsonDecode(data)['results'][i]['imageUrl1'];
        String description = jsonDecode(data)['results'][i]['description'];
        String createDate = jsonDecode(data)['results'][i]['createdDate'];
        String newCreateDate = createDate.substring(0,10);
        String lastModifiedDate = jsonDecode(data)['results'][i]['lastModifiedDate'];
        blog.setBlogId(blogId);
        blog.setBlogName(blogName);
        blog.setCategory(category);
        blog.setImageUrl(imageUrl);
        blog.setImageUrl1(imageUrl1);
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

Future<List<Product>> getData1() async{
  const String apiUrl = "https://api.spring-boot.link/products";
  List<Product> productList = [];
  Utf8Decoder utf8decoder = new Utf8Decoder();
  http.Response response = await http.get(Uri.parse(apiUrl));
  if(response.statusCode == 200){
    String data = utf8decoder.convert(response.bodyBytes);
    // print(data);
    int limit = jsonDecode(data)['limit'];
    for(int i = 0;i<limit;i++){
      Product product = new Product();
      int productId = jsonDecode(data)['results'][i]['productId'];
      String productName = jsonDecode(data)['results'][i]['productName'];
      String category = jsonDecode(data)['results'][i]['category'];
      String imageUrl = jsonDecode(data)['results'][i]['imageUrl'];
      int price = jsonDecode(data)['results'][i]['price'];
      int stock = jsonDecode(data)['results'][i]['stock'];
      String description = '';
      if(jsonDecode(data)['results'][i]['description'] != null){
        description = jsonDecode(data)['results'][i]['description'];
      }else{
        description = '';
      }
      product.setProductId(productId);
      product.setProductName(productName);
      product.setCategory(category);
      product.setImageUrl(imageUrl);
      product.setPrice(price);
      product.setStock(stock);
      product.setDescription(description);
      productList.add(product);
    }
    // print(limit);
    return productList;
  }else{
    print(response.statusCode);
    throw Exception('');
  }
}
