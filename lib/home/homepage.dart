import 'package:com_mokollmar/home/components/contact.dart';
import 'package:com_mokollmar/home/components/main_content.dart';
import 'package:com_mokollmar/home/components/socials.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.1, end: 1.0),
            duration: const Duration(seconds: 5),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: const Stack(
                  alignment: Alignment.center,
                  children: [
                    // Center (main) Content:
                    MainContent(),

                    // Contact Button:
                    Positioned(top: 0, right: 0, child: Contact()),

                    // Social Banner:
                    Positioned(bottom: 0, child: Socials())
                  ],
                ),
              );
            }),
      ),
    );
  }
}
