//---- url class


class ApiUrls {
  static String baseUrl = "http://127.0.0.1:8000/";
  static String loginUrl = baseUrl + "auth/login/";
  static String registerUrl = baseUrl + "auth/register/";
  static String colourUrl = baseUrl + "core/color-list/";
  static String categoryUrl = baseUrl + "core/category-list/";
  static String productUrl = baseUrl + "core/product-list/";
  static String favoriteUrl = baseUrl + "core/fav-add/";
  static String favoriteRemoveUrl = baseUrl + "core/fav-remove/0/";
}