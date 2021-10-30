class Brand {
  int id;
  String name;
  String brandLogoUrl;
  Brand({required this.id, required this.name, required this.brandLogoUrl});
  Brand.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = parsedJson['name'],
        brandLogoUrl = parsedJson['brand_logo_url'];
}
