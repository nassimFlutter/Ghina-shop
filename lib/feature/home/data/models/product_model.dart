class Product {
  String? title;
  String? mainImage;
  double? price;
  double? offerPrice;
  String? brandName;
  String? companyName;

  Product(
      {this.title,
      this.mainImage,
      this.price,
      this.offerPrice,
      this.brandName,
      this.companyName});
  double? calculateOfferPercentage() {
    if (offerPrice == null || price == null || price == 0) {
      return 0.0;
    }
    return ((1 - (offerPrice! / price!)) * 100).roundToDouble();
  }
}
