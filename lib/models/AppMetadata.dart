import 'package:intl/intl.dart';

class AppMetadata {
  String phone;
  String email;
  String facebook;
  String instagram;
  String twitter;
  int deliveryCharge;
  int minimunOrderValue;
  DateTime morningSlotFrom;
  DateTime morningSlotTo;
  DateTime eveningSlotFrom;
  DateTime eveningSlotTo;
  DateTime morningSlotClose;
  DateTime eveningSlotClose;
  AppMetadata(
      {this.phone,
      this.email,
      this.facebook,
      this.instagram,
      this.twitter,
      this.deliveryCharge,
      this.minimunOrderValue,
      this.morningSlotFrom,
      this.morningSlotTo,
      this.eveningSlotFrom,
      this.eveningSlotTo,
      this.morningSlotClose,
      this.eveningSlotClose});

  AppMetadata.fromJson(Map<String, dynamic> parsedJson)
      : phone = parsedJson['phone'],
        email = parsedJson['email'],
        facebook = parsedJson['facebook'],
        instagram = parsedJson['instagram'],
        twitter = parsedJson['twitter'],
        deliveryCharge = parsedJson['delivery_charge'],
        minimunOrderValue = parsedJson['minimum_order_value'],
        morningSlotFrom =
            DateFormat('hh:mm:ss').parse(parsedJson["morning_slot_from"]),
        morningSlotTo =
            DateFormat('hh:mm:ss').parse(parsedJson["morning_slot_to"]),
        eveningSlotFrom =
            DateFormat('hh:mm:ss').parse(parsedJson["evening_slot_from"]),
        eveningSlotTo =
            DateFormat('hh:mm:ss').parse(parsedJson["evening_slot_to"]),
        morningSlotClose =
            DateFormat('hh:mm:ss').parse(parsedJson["morning_slot_close"]),
        eveningSlotClose =
            DateFormat('hh:mm:ss').parse(parsedJson["evening_slot_close"]);
}
