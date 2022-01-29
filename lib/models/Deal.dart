class Deal {
  int id;
  String imageUrl;
  String name;
  Deal({this.id, this.imageUrl, this.name});
  Deal.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        imageUrl = parsedJson['image_url'],
        name = parsedJson['name'];
}
