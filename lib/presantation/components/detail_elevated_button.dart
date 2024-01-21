
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/person_detail_cubit.dart';
import 'package:kisiler_uygulamasi/presantation/views/home_page.dart';
import 'package:kisiler_uygulamasi/presantation/views/person_detail_page.dart';

class DetailElevatedButton extends StatelessWidget {
  const DetailElevatedButton({
    super.key,
    required this.widget,
    required this.tfPersonName,
    required this.tfPersonNumber,
  });

  final PersonDetailPage widget;
  final TextEditingController tfPersonName;
  final TextEditingController tfPersonNumber;
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      context.read<PersonDetailCubit>().update(int.parse(widget.person.personId), tfPersonName.text, tfPersonNumber.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomePage()));
    }, child: const Text("GÜNCELLE"));
  }
}