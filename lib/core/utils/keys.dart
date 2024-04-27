class Keys {
  static const String kUserName = 'user_name';
  static const String kUserEmail = 'user_email';
  static const String kUserMobile = 'user_mobile';
  static const String kUserToken = 'user_token';
  static const String kIsFirstTime =
      'first_time'; // ! this is to know if user enter to app first time ..
  static const String kIsLogin =
      'first_time'; // ! this is to know if user login or register  ..
}

class UrlKeys {
  static const categoryEndPoint = "getCategories";
  static const productCategoryEndPoint = "getBrandById";
  static const brandsEndPoint = "getBrands";
  //! this is the CartUrls ..
  static const getMyCartEndPoint = "getMyCart";
  static const deleteFromCartEndPoint =
      "getMyCart"; //?  this need id in end ex:{{mainURL}}deleteProductCart/1
  //! global
  static const getAreaEndPoint = 'getAreas';
  //! Address
  static const getMyAddressEndPoint = 'getMyAddresses';
  //! MyWish
  static const getMyWishEndPoint = 'getMyFavorites';
  //!  change password
  static const changePassEndPoint = 'getMyFavorites';
  
}
