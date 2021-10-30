class Category {
  int id;
  String name;
  String imageUrl;
  String color;
  String textColor;
  Category(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.color,
      required this.textColor});
  Category.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = parsedJson['name'],
        imageUrl = parsedJson['image_url'],
        color = parsedJson['color'],
        textColor = parsedJson['text_color'];
}
