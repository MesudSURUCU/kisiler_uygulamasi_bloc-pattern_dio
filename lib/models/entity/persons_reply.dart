import 'package:kisiler_uygulamasi/models/entity/persons.dart';

class PersonsReply {
  late List<Persons> persons;
  late int success;

  PersonsReply({required this.persons, required this.success});

  factory PersonsReply.fromJson(Map<String,dynamic> json){
    var jsonArray = json["kisiler"] as List;
    List<Persons> persons = jsonArray.map((jsonArrayNesnesi) => Persons.fromJson(jsonArrayNesnesi)).toList();
   return PersonsReply(persons: persons, success: json["success"] as int);
}
}