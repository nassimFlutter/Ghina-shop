class Keys {
  static const String kLang = "lang";

  static const String kUserName = 'user_name';
  static const String kUserEmail = 'user_email';
  static const String kUserMobile = 'user_mobile';
  static const String kUserToken = 'user_token';
  static const String kIsGuest = 'is_guest';
  static const String kIsFirstTime =
      'first_time'; // ! this is to know if user enter to app first time ..
  static const String kIsLogin =
      'first_time'; // ! this is to know if user login or register  ..
}

class UrlKeys {
//!
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
  static const deleteMyAddressEndPoint = 'deleteMyAddress';
  static const addMyAddressEndPoint = 'addAddress';
  //! MyWish
  static const getMyWishEndPoint = 'getMyFavorites';
  static const addRemoveFromFavEndPoint =
      'addAndRemoveFromFavorite'; //! this need Id  ex:{{mainURL}}addAndRemoveFromFavorite/4 -> (4 is product id you want add it or remove it from the wish)
  //!  change password
  static const changePassEndPoint = 'changePassword';
  //! UserAccounts
  static const editAccountEndPoint = 'editUserProfile';
  static const logoutEndPoint = 'logout';
  //! order
  static const getOrdersEndPoint = 'getMyOrders';
  static const getOrdersByIdEndPoint =
      'getMyOrderById'; //! need id ex:endpoint/id
  //! search
  static const searchEndPoint =
      'searchProduct?name='; //? here write name of product
  //!account
  static const terminateEndPoint = 'terminate'; //! this is to termite account
}
