class ImagePath {
  ImagePath._();
  static const String _basePath = "assets/images";
  //! -------- Splash Images ------------
  static const String splashImage = "$_basePath/splash/splashImage.svg";
  static const String splashLogo = "$_basePath/splash/splashLogo.svg";

  //! ------- OnBoarding Images -----------
  static const String onBoardingPath = "$_basePath/onBoarding";
  static const adImage = "$onBoardingPath/adImage.png";
}

class IconsPath {
  IconsPath._();
  static const String _basePath = 'assets/icons';
  // ! -------- Selected Lang -------
  static const String kingdom = "$_basePath/kingdom.svg";
  static const String kuwait = "$_basePath/kuwait.svg";
// !  ------ shared ----------
  static const String cancelIcon = "$_basePath/cancel.svg";
  static const String arrowLeftIcon = "$_basePath/arrow_left.svg";
}
