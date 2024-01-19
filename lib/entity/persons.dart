class Persons {
  String personId;
  String personName;
  String personNumber;

  Persons({required this.personId,required this.personName,required this.personNumber});

  factory Persons.fromJson(Map<String,dynamic> json){

return Persons(
  personId: json["kisi_id"] as String, 
  personName: json["kisi_ad"] as String, 
  personNumber: json["kisi_tel"] as String);
  }
}