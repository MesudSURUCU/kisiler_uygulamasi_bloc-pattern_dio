import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/person_registration_cubit.dart';
import 'package:kisiler_uygulamasi/presantation/views/home_page.dart';

class PersonRegistrationPage extends StatefulWidget {
  const PersonRegistrationPage({Key? key}) : super(key: key);

  @override
  State<PersonRegistrationPage> createState() => _PersonRegistrationPageState();
}

class _PersonRegistrationPageState extends State<PersonRegistrationPage> {

  var tfPersonName = TextEditingController();
  var tfPersonNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kişi Kayıt"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfPersonName,decoration: const InputDecoration(hintText: "Kişi Ad"),),
              TextField(controller: tfPersonNumber,decoration: const InputDecoration(hintText: "Kişi Tel"),),
              ElevatedButton(onPressed: (){
                context.read<PersonRegistrationCubit>().registration(tfPersonName.text, tfPersonNumber.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomePage()));
              }, child: const Text("KAYDET"))
            ],
          ),
        ),
      ),
    );
  }
}