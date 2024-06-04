import 'package:com_mokollmar/config/device.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Socials extends StatefulWidget {
  const Socials({super.key});

  @override
  State<Socials> createState() => _SocialsState();
}

class _SocialsState extends State<Socials> {
  final List<IconData> _icons = [FontAwesomeIcons.reddit, FontAwesomeIcons.github, FontAwesomeIcons.xTwitter, FontAwesomeIcons.mastodon];
  final List<bool> _isSocialHover = [false, false, false, false];
  final List<Uri> _urls = [
    Uri.parse("https://www.reddit.com/user/mokollmar/"),
    Uri.parse("https://github.com/mokollmar"),
    Uri.parse("https://twitter.com/mokollmar"),
    Uri.parse("https://mastodon.social/@mokollmar")
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(250)),
      child: Container(
        width: Device.isSmartphone(context) ? screenWidth / 1.25 : screenWidth / 3,
        height: screenHeigth / 18,
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.all(Radius.circular(250)),
        ),
        margin: EdgeInsets.symmetric(vertical: Device.isSmartphone(context) ? screenHeigth / 25 : screenHeigth / 50, horizontal: screenWidth / 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ListView.builder(
              itemCount: _icons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    if (await canLaunchUrl(_urls[index])) {
                      launchUrl(_urls[index]);
                    }
                  },
                  onHover: (value) => setState(() => _isSocialHover[index] = value),
                  child: Container(
                    width: Device.isSmartphone(context) ? (screenWidth / 1.25) / _icons.length : (screenWidth / 3) / _icons.length,
                    decoration: BoxDecoration(
                      color: !_isSocialHover[index] ? Colors.transparent : Colors.red[400],
                      borderRadius: index == 0
                          ? const BorderRadius.horizontal(left: Radius.circular(100))
                          : index == _icons.length-1
                              ? const BorderRadius.horizontal(right: Radius.circular(100))
                              : null,
                    ),
                    padding: EdgeInsets.symmetric(vertical: screenHeigth / 100, horizontal: Device.isSmartphone(context) ? screenWidth / 25 : screenWidth / 40),
                    child: FittedBox(
                      child: Icon(_icons[index], color: !_isSocialHover[index] ? Colors.black : Colors.amber),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
