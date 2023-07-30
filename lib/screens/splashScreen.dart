import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_health/screens/homeScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false);
    });

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Center(
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 42,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  height: 24,
                ),
                const SizedBox(
                  height: 73,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Helping you\nto keep ",
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: const Color(0xFFDEE1FE),
                            letterSpacing: 3.5 / 100,
                            height: 152 / 100),
                        children: [
                          const TextSpan(
                              text: "your bestie\n",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800)),
                          TextSpan(text: "stay healthy!")
                        ]))
              ],
            )),
          )
        ],
      ),
    );
  }
}
