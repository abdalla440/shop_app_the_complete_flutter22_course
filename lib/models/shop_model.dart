class HomeModel {
  bool? status;
  HomeData? data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeData.fromJson(json['data']);
  }
}

class HomeData {
  List<BannerData> banners = [];
  List<ProductsData> products = [];
  HomeData.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(BannerData.fromJson(element));
    });
    json['products'].forEach((element) {
      products.add(ProductsData.fromJson(element));
    });
  }
}

class BannerData {
  int? id;
  String? image;
  BannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductsData {
  int? id;
  dynamic  price;
  dynamic  oldPrice;
  dynamic    discount;
  String? image;
  String? name;
  String? description;
  List? images;
  bool? inFavorites;
  bool? inCart;
  ProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
