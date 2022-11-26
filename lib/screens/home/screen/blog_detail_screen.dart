import 'package:flutter/material.dart';
import 'package:flutter_outlook/models/Blog.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/Product.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({Key? key, required this.blog}) : super(key: key);

  // final Blog blog;
  final Product blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            blog.getProductName(),
            // blog.getBlogName(),
            style: const TextStyle(
              color: Color(0xFF8b8b8b),
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                blog.getImageUrl(),
                fit: BoxFit.cover,
              ),
              Text(blog.getDescription(),),
              // Text(blog.getCreateDate(),),
            ],
          ),
        ),
      ),
    );
  }
}
