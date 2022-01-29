class Address {
  int id;
  String firstName;
  String lastName;
  String address;
  String address2;
  String city;
  String landmark;
  String pincode;
  String contact;
  int type;
  Address(
      {this.id,
        this.firstName,
      this.lastName,
      this.address,
      this.address2,
      this.city,
      this.landmark,
      this.contact,
      this.pincode,
      this.type});
  Address.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        firstName = parsedJson['first_name'],
        lastName = parsedJson['last_name'],
        address = parsedJson['address'],
        address2 = parsedJson['address2'],
        city = parsedJson['city'],
        landmark = parsedJson['landmark'],
        type = parsedJson['type'],
        pincode = parsedJson['pincode'],
        contact = parsedJson['contact_no'];
}

