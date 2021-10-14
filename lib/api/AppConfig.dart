class AppConfig {
  static const String BaseUrl = "http://207.244.243.120:9031/api";
  static const String ImageBase = '$BaseUrl/';

 static  String getAppBaseUrl() {
    return BaseUrl;
  }

  static String displayImage(String imageUrl) {

    return ImageBase + imageUrl;
  }
}
