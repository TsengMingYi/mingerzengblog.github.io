import 'package:flutter/material.dart';
import 'package:flutter_outlook/models/Product.dart';
import 'package:flutter_outlook/responsive.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../models/Blog.dart';

class BlogPostCard extends StatelessWidget {

  // final Blog blog;
  final VoidCallback press;
  final Product blog;

  const BlogPostCard({Key? key, required this.blog, required this.press}) : super(key: key);

  String readMore(String description){
    if(description.length > 40){
      return "${description.substring(0,35)}...";
    }else{
      return description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.78,
            // child: Image.asset("assets/images/0.png"),
            child: Image.network(blog.getImageUrl(),fit: BoxFit.cover,),
          ),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      blog.getCategory(),
                      // "Design".toUpperCase(),
                      style: const TextStyle(
                        color: kDarkBlackColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text(
                      blog.getStock().toString(),
                      // blog.getCreateDate(),
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    blog.getDescription(),
                    // blog.getBlogName(),
                    style: TextStyle(
                      fontSize: Responsive.isDesktop(context) ? 32.0 : 24.0,
                      fontFamily: "Raleway",
                      color: kDarkBlackColor,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  readMore(blog.getDescription()),
                  maxLines: 4,
                  style: const TextStyle(
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: press,
                      child: Container(
                        padding: const EdgeInsets.only(
                            bottom: kDefaultPadding / 4),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom:
                            BorderSide(color: kPrimaryColor, width: 3),
                          ),
                        ),
                        child: const Text(
                          "Read More",
                          style: TextStyle(
                            color: kDarkBlackColor,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          "assets/icons/feather_thumbs-up.svg"),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          "assets/icons/feather_message-square.svg"),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          "assets/icons/feather_share-2.svg"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

