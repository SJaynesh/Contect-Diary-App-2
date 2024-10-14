import 'dart:developer';

import 'package:contacts_diary/controllers/contact_contorller.dart';
import 'package:contacts_diary/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    ContactModel contact =
        ModalRoute.of(context)?.settings.arguments as ContactModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Provider.of<ContactController>(context, listen: false)
                  .removeContactData(contact: contact);

              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star_border),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.w,
                child: Text(
                  contact.name[0],
                  style: TextStyle(
                    fontSize: 100.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                contact.name,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton.filled(
                    onPressed: () async {
                      Uri url = Uri.parse("tel:+91-${contact.phoneNumber}");
                      await launchUrl(url);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xff5d3f41),
                      ),
                    ),
                    icon: const Icon(
                      Icons.call_outlined,
                      color: Colors.white,
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () async {
                      Uri url = Uri.parse("sms:${contact.phoneNumber}");
                      await launchUrl(url);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xff5d3f41),
                      ),
                    ),
                    icon: const Icon(
                      color: Colors.white,
                      Icons.sms_failed_outlined,
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xff5d3f41),
                      ),
                    ),
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 120.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff23191a),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Contact Info"),
                    ListTile(
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.call_outlined,
                        ),
                      ),
                      title: Text(contact.phoneNumber),
                      subtitle: Text("Mobile"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat_bubble_outline),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 115.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff23191a),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Gmail"),
                    ListTile(
                      leading: IconButton(
                        onPressed: () async {
                          Uri url = Uri.parse(
                              "mailto: ${contact.email}?subject=Leave Application&body=Hello Sir,");
                          await launchUrl(url);
                        },
                        icon: Icon(
                          Icons.mail_outline,
                        ),
                      ),
                      title: Text(contact.email),
                      subtitle: Text("email"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Uri url = Uri.parse(
                    "https://www.google.com/maps/place/Gujarat+car+point/@21.2118096,72.8962911,17z/data=!3m1!4b1!4m6!3m5!1s0x3be045002c74325b:0x1da46c9b1f91df4b!8m2!3d21.2118046!4d72.898866!16s%2Fg%2F11wbm8_7gk?authuser=0&entry=ttu&g_ep=EgoyMDI0MTAwOS4wIKXMDSoASAFQAw%3D%3D",
                  );
                  await launchUrl(
                    url,
                    mode: LaunchMode.inAppWebView,
                  );
                },
                child: const Text("URL"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
