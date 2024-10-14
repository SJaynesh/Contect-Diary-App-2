import 'dart:developer';
import 'dart:io';

import 'package:contacts_diary/controllers/contact_contorller.dart';
import 'package:contacts_diary/controllers/stepper_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();

class AddToContactPage extends StatelessWidget {
  const AddToContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Add Page"),
      ),
      body: Consumer<StepperController>(
        builder: (context, provider, _) => Consumer<ContactController>(
          builder: (context, provider2, _) => Stepper(
            currentStep: provider.stepperModel.stepperIndex,
            onStepContinue: () {
              provider.stepContinue();
            },
            onStepCancel: () {
              provider.stepCancel();
            },
            controlsBuilder: (context, details) {
              if (provider.stepperModel.stepperIndex == 0) {
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        details.onStepContinue!();
                      },
                      child: const Text("Continue"),
                    )
                  ],
                );
              } else if (provider.stepperModel.stepperIndex == 1 ||
                  provider.stepperModel.stepperIndex == 2) {
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        details.onStepContinue!();
                      },
                      child: const Text("Continue"),
                    ),
                    TextButton(
                      onPressed: () {
                        details.onStepCancel!();
                      },
                      child: const Text("Cancel"),
                    ),
                  ],
                );
              }
              return Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String name = nameController.text;
                      String email = emailController.text;
                      String phone = phoneController.text;

                      provider2.addContactData(
                        name: name,
                        email: email,
                        phone: phone,
                      );

                      log("Contact Data : ${provider2.contactModel.contactList}");
                      Navigator.pop(context);

                      nameController.clear();
                      emailController.clear();
                      phoneController.clear();

                      provider2.contactModel.image = null;
                      provider.stepperModel.stepperIndex = 0;
                    },
                    child: const Text("Submit"),
                  ),
                  TextButton(
                    onPressed: () {
                      details.onStepCancel!();
                    },
                    child: const Text("Cancel"),
                  ),
                ],
              );
            },
            steps: [
              Step(
                title: const Text("Image"),
                content: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 55.w,
                      backgroundImage: (provider2.contactModel.image != null)
                          ? FileImage(provider2.contactModel.image as File)
                          : const NetworkImage(
                              "https://thumb.ac-illust.com/be/bee98c70d1cfc02d0f387d2852464bf5_t.jpeg"),
                    ),
                    GestureDetector(
                      onTap: () {
                        provider2.pickImageGallery();
                      },
                      child: CircleAvatar(
                        radius: 18.w,
                        backgroundColor: Colors.deepPurple.shade300,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Step(
                title: const Text("Name"),
                content: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Enter your name...",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Step(
                title: const Text("Email"),
                content: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter your email...",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Step(
                title: const Text("Phone Number"),
                content: TextField(
                  controller: phoneController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter your number...",
                    prefixText: "+91 ",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
