class Product{
  int? _productId;
  String? _productName;
  String? _category;
  String? _imageUrl;
  int? _price;
  int? _stock;
  String? _description;

  int getProductId(){
    return _productId!;
  }
  void setProductId(int productId){
    _productId = productId;
  }
  String getProductName(){
    return _productName!;
  }
  void setProductName(String productName){
    _productName = productName;
  }
  String getCategory(){
    return _category!;
  }
  void setCategory(String category){
    _category = category;
  }
  String getImageUrl(){
    return _imageUrl!;
  }
  void setImageUrl(String imageUrl){
    _imageUrl = imageUrl;
  }
  int getPrice(){
    return _price!;
  }
  void setPrice(int price){
    _price = price;
  }
  int getStock(){
    return _stock!;
  }
  void setStock(int stock){
    _stock = stock;
  }
  String getDescription(){
    return _description!;
  }
  void setDescription(String description){
    _description = description;
  }
}