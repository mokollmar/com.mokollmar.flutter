import 'package:com_mokollmar/config/device.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool isContactHover = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeigth / 20,
      padding: EdgeInsets.symmetric(horizontal: Device.isSmartphone(context) ? screenWidth / 30 : screenWidth / 100, vertical: screenHeigth / 250),
      margin: EdgeInsets.all(Device.isSmartphone(context) ? screenWidth / 25 : screenWidth / 50),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.redAccent, width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: InkWell(
        onTap: () async {
          Uri link = Uri.parse("https://github.com/mokollmar");
          if (await canLaunchUrl(link)) {
            launchUrl(link);
          }
        },
        onHover: (value) => setState(() => isContactHover = value),
        child: const FittedBox(
          alignment: Alignment.center,
          child: Text(
            "Contact",
            style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
