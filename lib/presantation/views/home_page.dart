import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/constants/constants.dart';
import 'package:kisiler_uygulamasi/cubit/home_page_cubit.dart';
import 'package:kisiler_uygulamasi/models/entity/persons.dart';
import 'package:kisiler_uygulamasi/presantation/views/person_detail_page.dart';
import 'package:kisiler_uygulamasi/presantation/views/person_registration_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    bool isSearching = false;

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().personsUpload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching ?
           TextField(decoration: const InputDecoration(hintText: Constant.appbarHintText),
             onChanged: (searchresult){
               context.read<HomePageCubit>().search(searchresult);
             },
           )
         : const Text(Constant.appbarText),
        actions: [
          isSearching ?
          IconButton(onPressed: (){
            setState((){ isSearching = false;  });
            context.read<HomePageCubit>().personsUpload();
          }, icon: const Icon(Icons.cancel)) :
          IconButton(onPressed: (){
            setState((){ isSearching = true;  });
          }, icon: const Icon(Icons.search))
        ],
      ),
      body:BlocBuilder<HomePageCubit,List<Persons>>(
        builder: (context,personsList){
          if(personsList.isNotEmpty){
            return ListView.builder(
              itemCount: personsList.length,
              itemBuilder: (context,indeks){
                var person = personsList[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonDetailPage(person: person)))
                    .then((value){  context.read<HomePageCubit>().personsUpload();  });
                  },
                  child: Card(
                    child: Padding(
                      padding: Constant.all8,
                      child: Row(
                        children: [
                          Text("${person.personName} - ${person.personNumber}"),
                          const Spacer(),
                          IconButton(onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${person.personName} silinsin mi?"),
                                  action: SnackBarAction(
                                    label: Constant.snacbarLabel,
                                    onPressed: (){
                                      context.read<HomePageCubit>().delete(int.parse(person.personId));
                                    },
                                  ),
                                ),
                              );
                          }, icon: const Icon(Icons.delete_outline,color: Constant.deleteIconColor))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonRegistrationPage()))
                .then((value){  context.read<HomePageCubit>().personsUpload();  });
          },
          child: const Icon(Icons.add),
      ),
    );
  }
}
