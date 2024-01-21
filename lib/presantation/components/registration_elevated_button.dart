
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/person_registration_cubit.dart';
import 'package:kisiler_uygulamasi/presantation/views/home_page.dart';

class RegistrationElevatedButton extends StatelessWidget {
  const RegistrationElevatedButton({
    super.key,
    required this.tfPersonName,
    required this.tfPersonNumber,
  });

  final TextEditingController tfPersonName;
  final TextEditingController tfPersonNumber;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      context.read<PersonRegistrationCubit>().registration(tfPersonName.text, tfPersonNumber.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomePage()));
    }, child: const Text("KAYDET"));
  }
}

