import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/person_detail_cubit.dart';
import 'package:kisiler_uygulamasi/models/entity/persons.dart';
import 'package:kisiler_uygulamasi/presantation/views/home_page.dart';

class PersonDetailPage extends StatefulWidget {
  final Persons person;

  const PersonDetailPage({super.key,required this.person});
  
  @override
  State<PersonDetailPage> createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {


  var tfPersonName = TextEditingController();
  var tfPersonNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    var person = widget.person;
    tfPersonName.text = person.personName;
    tfPersonNumber.text = person.personNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kişi Detay"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfPersonName,decoration: const InputDecoration(hintText: "Kişi Ad"),),
              TextField(controller: tfPersonNumber,decoration: const InputDecoration(hintText: "Kişi Tel"),),
              ElevatedButton(onPressed: (){
                context.read<PersonDetailCubit>().update(int.parse(widget.person.personId), tfPersonName.text, tfPersonNumber.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomePage()));
              }, child: const Text("GÜNCELLE"))
            ],
          ),
        ),
      ),
    );
  }
}
