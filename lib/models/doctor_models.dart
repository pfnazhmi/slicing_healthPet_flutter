import 'package:pet_health/models/service_models.dart';

class DoctorModels {
  String name;
  String image;
  List<String> service;
  int distance;

  DoctorModels(
      {required this.name,
      required this.image,
      required this.service,
      required this.distance});
}

var doctorsList = [
  DoctorModels(
      name: "Dr. Stone ",
      image: "Dr. Stone.jpg",
      service: [Service.vaccine, Service.surgery],
      distance: 10),
  DoctorModels(
      name: "Dr. Stone ",
      image: "Dr. Stone.jpg",
      service: [Service.vaccine, Service.surgery],
      distance: 10),
  DoctorModels(
      name: "Dr. Stone ",
      image: "Dr. Stone.jpg",
      service: [Service.vaccine, Service.surgery],
      distance: 10)
];
