import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kisiler_uygulamasi/models/entity/persons.dart';
import 'package:kisiler_uygulamasi/models/entity/persons_reply.dart';

class PersonsDaoRepository {
  List<Persons> parsePersonsReply(String reply){
    return PersonsReply.fromJson(json.decode(reply)).persons;
  }
  Future<void> personRegistration(String personName,String personNumber) async {
    var url = 'http://kasimadalan.pe.hu/kisiler/insert_kisiler.php';
   var data = {"kisi_ad":personName, "kisi_tel": personNumber};
    var reply = await Dio().post(url,data: FormData.fromMap(data));
    print("Kişi ekle : ${reply.data.toString()}");
  }

  Future<void> personUpdate(int personId,String personName,String personNumber) async {
    var url = 'http://kasimadalan.pe.hu/kisiler/update_kisiler.php';
   var data = {"kisi_id":personId,"kisi_ad": personName, "kisi_tel": personNumber};
    var reply = await Dio().post(url,data: FormData.fromMap(data));
    print("Kişi güncelle : ${reply.data.toString()}");
  }

  Future<List<Persons>> getAllPersons() async {
    var url = 'http://kasimadalan.pe.hu/kisiler/tum_kisiler.php';
    var reply = await Dio().get(url);
    return parsePersonsReply(reply.data.toString());
  }

  Future<List<Persons>> personSearch(String searchWord) async {
   var url = 'http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php';
   var data = {"kisi_ad":searchWord};
    var reply = await Dio().post(url,data: FormData.fromMap(data));
    return parsePersonsReply(reply.data.toString());
  }

  Future<void> personDelete(int personId) async {
    var url = 'http://kasimadalan.pe.hu/kisiler/delete_kisiler.php';
   var data = {"kisi_id": personId};
    var reply = await Dio().post(url,data: FormData.fromMap(data));
    print("Kişi sil : ${reply.data.toString()}");
  }

}