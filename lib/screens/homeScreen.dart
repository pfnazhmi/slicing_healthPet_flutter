import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const SizedBox(
          height: 22,
        ),
        _greetings(),
        const SizedBox(
          height: 17,
        ),
        Card()
      ],
    )));
  }

  AspectRatio Card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xFF818AF9)),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/background_card.png",
              height: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Your ",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFFDEE1FE),
                              letterSpacing: 3.5 / 100,
                              height: 150 / 100),
                          children: [
                        TextSpan(
                            text: "Catrine",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                        TextSpan(text: " will get\nvaccination "),
                        TextSpan(
                            text: "tomorrow\nat 07.00 am!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                      ])),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.4),
                        border: Border.all(
                            color: Colors.white.withOpacity(.12), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "See details",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _greetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello, Human!",
            style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF3F3E3F)),
          ),
          Stack(children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.shoppingBag,
                  color: Color(0xFF818AF9),
                )),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: Color(0xFFEF6497),
                    borderRadius: BorderRadius.circular(15 / 2)),
                child: Center(
                    child: Text(
                  "2",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w800),
                )),
              ),
            )
          ])
        ],
      ),
    );
  }
}
