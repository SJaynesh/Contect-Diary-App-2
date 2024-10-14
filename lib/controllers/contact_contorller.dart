import 'dart:io';

import 'package:contacts_diary/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactController extends ChangeNotifier {
  ContactModel contactModel = ContactModel(
    image: null,
    name: "",
    email: "",
    phoneNumber: "",
    contactList: [],
  );

  void pickImageGallery() async {
    ImagePicker imagePicker = ImagePicker();

    XFile? xFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (xFile != null) {
      contactModel.image = File(xFile.path);
    }
    notifyListeners();
  }

  void addContactData({
    required String name,
    required String email,
    required String phone,
  }) {
    ContactModel c1 = ContactModel(
      image: contactModel.image,
      name: name,
      email: email,
      phoneNumber: phone,
    );

    contactModel.contactList?.add(c1);

    notifyListeners();
  }

  void removeContactData({required ContactModel contact}) {
    contactModel.contactList?.remove(contact);

    notifyListeners();
  }
}
