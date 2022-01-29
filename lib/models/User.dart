// import 'Address.dart';
class User {
  String name;
  String email;
  String phone;
  String profilePic;
  String referralCode;
  User({this.name, this.email, this.profilePic, this.referralCode, this.phone});
  User.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        email = parsedJson['email'],
        phone = parsedJson['phone'],
        profilePic = parsedJson['profile_pic_url'],
        referralCode = parsedJson['referral_code'];
  // addresses = (parsedJson['address'] as List).reversed
  //     .map((address) => Address.fromJson(address))
  //     .toList();
}
