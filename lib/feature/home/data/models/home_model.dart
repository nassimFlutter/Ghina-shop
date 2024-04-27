class HomeApiResponse {
  bool? status;
  int? code;
  String? message;
  Item? item;

  HomeApiResponse({this.status, this.code, this.message, this.item});

  HomeApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
  }
}

class Item {
  List<Category>? categories;
  List<Brand>? brands;
  List<HomeBanner>? banners;
  List<Product>? lastProducts;
  List<Product>? offers;
  List<Product>? newstProducts;
  List<Product>? featuredProducts;
  List<Product>? bestSellerProducts;
  int? countCarts;
  List<dynamic>? carts;

  Item(
      {this.categories,
      this.brands,
      this.banners,
      this.lastProducts,
      this.offers,
      this.newstProducts,
      this.featuredProducts,
      this.bestSellerProducts,
      this.countCarts,
      this.carts});

  Item.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Category.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = [];
      json['brands'].forEach((v) {
        brands?.add(Brand.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners?.add(HomeBanner.fromJson(v));
      });
    }
    if (json['last_products'] != null) {
      lastProducts = [];
      json['last_products'].forEach((v) {
        lastProducts?.add(Product.fromJson(v));
      });
    }
    if (json['offers'] != null) {
      offers = [];
      json['offers'].forEach((v) {
        offers?.add(Product.fromJson(v));
      });
    }
    if (json['newstProducts'] != null) {
      newstProducts = [];
      json['newstProducts'].forEach((v) {
        newstProducts?.add(Product.fromJson(v));
      });
    }
    if (json['featuredProducts'] != null) {
      featuredProducts = [];
      json['featuredProducts'].forEach((v) {
        featuredProducts?.add(Product.fromJson(v));
      });
    }
    if (json['bestSellerProducts'] != null) {
      bestSellerProducts = [];
      json['bestSellerProducts'].forEach((v) {
        bestSellerProducts?.add(Product.fromJson(v));
      });
    }
    countCarts = json['count_carts'];
    carts = json['carts'];
  }
}

class Category {
  int? id;
  String? image;
  int? featured;
  String? status;
  String? createdAt;
  String? name;

  Category(
      {this.id,
      this.image,
      this.featured,
      this.status,
      this.createdAt,
      this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    featured = json['featured'];
    status = json['status'];
    createdAt = json['created_at'];
    name = json['name'];
  }
}

class Brand {
  int? id;
  String? image;
  int? featured;
  String? status;
  String? createdAt;
  String? name;

  Brand(
      {this.id,
      this.image,
      this.featured,
      this.status,
      this.createdAt,
      this.name});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    featured = json['featured'];
    status = json['status'];
    createdAt = json['created_at'];
    name = json['name'];
  }
}

class HomeBanner {
  int? id;
  int? type;
  int? itemId;
  String? status;
  String? image;
  String? createdAt;
  String? categoryName;
  String? details;
  String? title;

  HomeBanner(
      {this.id,
      this.type,
      this.itemId,
      this.status,
      this.image,
      this.createdAt,
      this.categoryName,
      this.details,
      this.title});

  HomeBanner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    itemId = json['item_id'];
    status = json['status'];
    image = json['image'];
    createdAt = json['created_at'];
    categoryName = json['category_name'];
    details = json['details'];
    title = json['title'];
  }
}

class Product {
  int? id;
  int? categoryId;
  String? image;
  int? price;
  dynamic discountPrice;
  int? featured;
  dynamic offerEndDate;
  int? quantity;
  String? isHasVariant;
  String? status;
  int? markLabel;
  int? isBestSeller;
  String? createdAt;
  int? brandId;
  int? isCart;
  int? isOutStock;
  String? isFavorite;
  String? urlLink;
  String? description;
  String? name;
  dynamic brandName;
  String? companyName;
  String? title;

  Product(
      {this.id,
      this.categoryId,
      this.image,
      this.price,
      this.discountPrice,
      this.featured,
      this.offerEndDate,
      this.quantity,
      this.isHasVariant,
      this.status,
      this.markLabel,
      this.isBestSeller,
      this.createdAt,
      this.brandId,
      this.isCart,
      this.isOutStock,
      this.isFavorite,
      this.urlLink,
      this.description,
      this.name,
      this.brandName,
      this.companyName,
      this.title});
  num? calculateOfferPercentage() {
    if (discountPrice == null || price == null || price == 0) {
      return 0.0;
    }
    return ((1 - (discountPrice! / price!)) * 100).roundToDouble();
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    image = json['image'];
    price = json['price'];
    discountPrice = json['discount_price'];
    featured = json['featured'];
    offerEndDate = json['offer_end_date'];
    quantity = json['quantity'];
    isHasVariant = json['is_has_variant'];
    status = json['status'];
    markLabel = json['mark_label'];
    isBestSeller = json['is_best_seller'];
    createdAt = json['created_at'];
    brandId = json['brand_id'];
    isCart = json['is_cart'];
    isOutStock = json['is_out_stock'];
    isFavorite = json['is_fevorite'];
    urlLink = json['url_link'];
    description = json['description'];
    name = json['name'];
    brandName = json['brand_name'];
    companyName = json['company_name'];
    title = json['title'];
  }
}
