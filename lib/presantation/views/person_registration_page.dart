import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/presantation/components/registration_elevated_button.dart';
import 'package:kisiler_uygulamasi/presantation/components/text_field_name.dart';
import 'package:kisiler_uygulamasi/presantation/components/text_field_number.dart';


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
              TextFieldNameWidget(tfPersonName: tfPersonName),
              TextFieldNumberWidget(tfPersonNumber: tfPersonNumber),
              RegistrationElevatedButton(tfPersonName: tfPersonName, tfPersonNumber: tfPersonNumber)
            ],
          ),
        ),
      ),
    );
  }
}

