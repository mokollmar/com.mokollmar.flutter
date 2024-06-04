import 'dart:async';
import 'package:com_mokollmar/config/device.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  final _animationDuration = const Duration(seconds: 3);
  bool _animateBool = true;

  @override
  void initState() {
    super.initState();
    changeColorPeriodic();
  }

  void changeColorPeriodic() {
    int limit = 500;
    Timer.periodic(const Duration(seconds: 3), (timer) {
      // Change boolean:
      setState(() => _animateBool = !_animateBool);

      limit--;
      if (limit == 0) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;

    return Center(
      child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.1, end: 1.0),
          duration: const Duration(seconds: 10),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Device.isSmartphone(context) ? screenWidth / 1.2 : screenWidth / 2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            // Username:
                            AnimatedContainer(
                              duration: _animationDuration,
                              padding: EdgeInsets.symmetric(horizontal: screenWidth / 30),
                              height: Device.isSmartphone(context) ? screenHeigth / 10 : screenHeigth / 7.5,
                              color: Colors.white,
                              child: FittedBox(
                                child: Text("@mokollmar", style: GoogleFonts.tiltNeon(color: Colors.redAccent, fontWeight: FontWeight.w900)),
                              ),
                            ),
                            SizedBox(height: screenHeigth / 50),

                            // Image Puffer:
                            SizedBox(height: screenHeigth / 25),
                            SizedBox(height: screenHeigth / 3.5)
                          ],
                        ),

                        // Image:
                        Positioned(
                          bottom: 0,
                          child: AnimatedContainer(
                            duration: _animationDuration,
                            margin: EdgeInsets.only(top: screenHeigth / 25),
                            padding: _animateBool ? const EdgeInsets.all(10) : const EdgeInsets.all(15),
                            decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                            child: ClipOval(
                              child: Container(
                                width: screenHeigth / 3.5,
                                height: screenHeigth / 3.5,
                                decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                                child: FittedBox(child: Image.asset("assets/images/logo.webp")),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
