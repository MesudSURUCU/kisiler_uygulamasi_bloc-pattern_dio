import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/repo/personsdao_repository.dart';

class PersonRegistrationCubit extends Cubit<void> {
  PersonRegistrationCubit() : super(0);

  var prepo = PersonsDaoRepository();

  Future<void> registration(String personName,String personNumber) async {
    await prepo.personRegistration(personName, personNumber);
  }
}