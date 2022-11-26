import 'package:flutter/material.dart';
import 'package:flutter_outlook/NetworkHelper.dart';
import 'package:flutter_outlook/constants.dart';
import 'package:flutter_outlook/models/Blog.dart';
import 'package:flutter_outlook/models/Product.dart';
import 'package:flutter_outlook/responsive.dart';
import 'package:flutter_outlook/screens/home/components/categories.dart';
import 'package:flutter_outlook/screens/home/screen/blog_detail_screen.dart';
import '../../keep_alive_wrapper.dart';
import 'components/blog_post.dart';
import 'components/recent_posts.dart';
import 'components/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Blogs(
                      blogs: snapshot.data!,
                      // blogs: snapshot.data!,
                    )
                  : Center(child: Image.asset("assets/ripple.gif"));
            },
          ),
        ),
        if (!Responsive.isMobile(context))
          const SizedBox(
            width: kDefaultPadding,
          ),
        if (!Responsive.isMobile(context))
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  Search(),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Categories(),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  RecentPosts(),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class Blogs extends StatelessWidget {
  const Blogs({Key? key, required this.blogs}) : super(key: key);

  final List<Blog> blogs;
  // final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              return BlogPostCard(
                blog: blogs[index],
                press: (){
                  // print("blogs length"+blogs.length.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return BlogDetailScreen(blog: blogs[index]);
                  }));
                },
              );
            },
          ),
        ],
        // children: List.generate(
        //   blogs.length,
        //   (index) => BlogPostCard(
        //     blog: blogs[index],
        //   ),
        // ),
      ),
    );
  }
}
