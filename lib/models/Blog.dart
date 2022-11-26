class Blog {
  late final String _createDate;
  late final String _lastModifiedDate;
  late final String _category;
  late final String _blogName;
  late final String _description;
  late final String _imageUrl;
  late final int _blogId;
  // Blog({required int blogId,required String blogName,required String category,required String description,required String imageUrl,required String createDate,required String lastModifiedDate}){
  //   this.blogId = blogId;
  //   this.blogName = blogName;
  //   this.category = category;
  //   this.description = description;
  //   this.imageUrl = imageUrl;
  //   this.createDate = createDate;
  //   this.lastModifiedDate = lastModifiedDate;
  // }

  void setBlogId(int blogId) {
    _blogId = blogId;
  }

  int getBlogId() {
    return _blogId;
  }
  void setBlogName(String blogName) {
    _blogName = blogName;
  }

  String getBlogName() {
    return _blogName;
  }
  void setCategory(String category) {
    _category = category;
  }

  String getCategory() {
    return _category;
  }
  void setDescription(String description) {
    _description = description;
  }

  String getDescription() {
    return _description;
  }
  void setImageUrl(String imageUrl) {
    _imageUrl = imageUrl;
  }

  String getImageUrl() {
    return _imageUrl;
  }
  void setCreateDate(String createDate) {
    _createDate = createDate;
  }

  String getCreateDate() {
    return _createDate;
  }
  void setLastModifiedDate(String lastModifiedDate) {
    _lastModifiedDate = lastModifiedDate;
  }

  String getLastModifiedDate() {
    return _lastModifiedDate;
  }
}

// List<Blog> blogPosts = [
//   Blog(
//     date: "23 September 2020",
//     image: "assets/images/0.png",
//     title: "How Ireland’s biggest bank executed a comp lete security redesign",
//     description:
//     "Mobile banking has seen a huge increase since Coronavirus. In fact, CX platform Lightico found that 63 percent of people surveyed said they were more willing to try a new digital banking app than before the pandemic.So while you may be more inclined to bank remotely these days, cybercrime—especially targeting banks—is on the rise.",
//   ),
//   Blog(
//     date: "21 August  2020",
//     image: "assets/images/1.png",
//     title: "5 Examples of Web Motion Design That Really Catch Your Eye",
//     description:
//     "Web animation has become one of the most exciting web design trends in 2020. It breathes more life into a website and makes user interactions even more appealing and intriguing. Animation for websites allows introducing a brand in an exceptionally creative way in modern digital space. It helps create a lasting impression, make a company",
//   ),
//   Blog(
//     date: "23 September 2020",
//     image: "assets/images/2.png",
//     title: "The Principles of Dark UI Design",
//     description:
//     "Mobile banking has seen a huge increase since Coronavirus. In fact, CX platform Lightico found that 63 percent of people surveyed said they were more willing to try a new digital banking app than before the pandemic.So while you may be more inclined to bank remotely these days, cybercrime—especially targeting banks—is on the rise.",
//   ),
// ];
