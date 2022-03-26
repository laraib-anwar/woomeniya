class Subcategory {
  int id;
  String name;
  String imageUrl;
  Subcategory({ this.id,  this.name,  this.imageUrl});
  Subcategory.fromJson(Map<String, dynamic >parsedJson)
      : id = parsedJson['id'],
        name = parsedJson['name'],
        imageUrl = parsedJson['image_url'];
}