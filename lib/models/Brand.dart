class Brand {
  int id;
  String name;
  String brandLogoUrl;
  Brand({this.id, this.name, this.brandLogoUrl});
  Brand.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = parsedJson['name'],
        brandLogoUrl = parsedJson['brand_logo_url'];
}
