import 'dart:io';

class ContactModel {
  File? image;
  String name;
  String email;
  String phoneNumber;
  List<ContactModel>? contactList;

  ContactModel({
    required this.image,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.contactList,
  });
}
