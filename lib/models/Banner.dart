
class DisplayBanner {
  int category_id;
  String imageUrl;
  String to;
  String argument;
  int displayLocation;
  int data;
  int bannerRoute;
  DisplayBanner({required this.category_id, required this.imageUrl, required this.to, required this.argument,
      required this.displayLocation,
      required this.data,
      required this.bannerRoute});
  DisplayBanner.fromJson(Map<String, dynamic> parsedJson)
    : category_id = parsedJson['category'] != null ? parsedJson['category']['id'] : null,
      imageUrl = parsedJson['image_url'],
      to = parsedJson['to'],
      argument = parsedJson['argument'],
      displayLocation = parsedJson['display_location'],
      data = parsedJson['data'],
      bannerRoute = parsedJson['banner_route'];
}