import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_health/models/doctor_models.dart';
import 'package:pet_health/models/service_models.dart';

var selectedService = 0;

var menus = [
  FeatherIcons.home,
  FeatherIcons.heart,
  FeatherIcons.messageCircle,
  FeatherIcons.user
];

var selectedMenus = 0;

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      bottomNavigationBar: _bottomNavbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              _greetings(),
              const SizedBox(
                height: 20,
              ),
              Card(),
              const SizedBox(
                height: 20,
              ),
              search(),
              const SizedBox(
                height: 20,
              ),
              serviceHorizontal(),
              const SizedBox(
                height: 27,
              ),
              doctors(),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar _bottomNavbar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF818AF9),
        unselectedItemColor: const Color(0xFFBFBFBF),
        items: menus
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e), label: e.toString()))
            .toList(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      );

  ListView doctors() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => doctor(doctorsList[index]),
        separatorBuilder: (context, index) => const SizedBox(
              height: 11,
            ),
        itemCount: doctorsList.length);
  }

  Container doctor(DoctorModels doctorModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF35385A).withOpacity(.12),
                blurRadius: 30,
                offset: const Offset(0, 2))
          ]),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              'assets/images/${doctorModel.image}',
              width: 88,
              height: 103,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorModel.name,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3F3E3F)),
              ),
              const SizedBox(
                height: 7,
              ),
              RichText(
                  text: TextSpan(
                      text: "Service: ${doctorModel.service.join(', ')}",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          color: Colors.black))),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  const Icon(
                    FeatherIcons.mapPin,
                    size: 14,
                    color: Color(0xFFACA3A3),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    "${doctorModel.distance}km",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFFACA3A3)),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Text(
                    "Available for",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF50CC98),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  SvgPicture.asset("assets/svgs/cat.svg"),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset("assets/svgs/cat.svg"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  SizedBox serviceHorizontal() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: selectedService == index
                        ? const Color(0xFF818AF9)
                        : const Color(0xFFF6F6F6),
                    border: selectedService == index
                        ? Border.all(
                            color: const Color(0xFFF1E5E5).withOpacity(.22),
                            width: 2)
                        : null,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  Service.all()[index],
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: selectedService == index
                          ? Colors.white
                          : const Color(0xFF3F3E3F).withOpacity(.3)),
                )),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: Service.all().length),
    );
  }

  Widget search() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(
                FeatherIcons.search,
                color: Color(0xFFADACAD),
              ),
              hintText: "Find best vaccinate, treatment...",
              hintStyle: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFCACACA),
                  height: 150 / 100))),
    );
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
                        const TextSpan(
                            text: "Catrine",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                        const TextSpan(text: " will get\nvaccination "),
                        const TextSpan(
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
                    color: const Color(0xFFEF6497),
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
