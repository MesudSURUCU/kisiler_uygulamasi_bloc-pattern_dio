import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/constants/constants.dart';
import 'package:kisiler_uygulamasi/models/entity/persons.dart';
import 'package:kisiler_uygulamasi/presantation/components/detail_elevated_button.dart';
import 'package:kisiler_uygulamasi/presantation/components/text_field_name.dart';
import 'package:kisiler_uygulamasi/presantation/components/text_field_number.dart';

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
      appBar: AppBar(title: const Text(Constant.detailAppBarText),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFieldNameWidget(tfPersonName: tfPersonName),
              TextFieldNumberWidget(tfPersonNumber: tfPersonNumber),
              DetailElevatedButton(widget: widget, tfPersonName: tfPersonName, tfPersonNumber: tfPersonNumber),
            ],
          ),
        ),
      ),
    );
  }
}

