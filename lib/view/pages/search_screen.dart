
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit/news_cubit.dart';

class SearchScreen extends StatelessWidget {
   const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) {
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                      validator: (String? value){
                        if(value!.isEmpty){
                          return 'search must not be empty';
                        }
                        return null;
                      },
              decoration: InputDecoration(
                          labelText: 'search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                          )
                        ),
                        onChanged: (value){
                        NewsCubit.get(context).getSearch(value);
                      },

              ),
            ),
            Expanded(
                child: ConditionalBuilder(
                  condition: NewsCubit.get(context).search.length >0,
                  builder: (BuildContext context) {
                  return ListView.builder(itemBuilder: (context,index){
                    NewsCubit.get(context).search;
                  });},
                  fallback: (BuildContext context) =>const Center(child: CircularProgressIndicator()),
                ),)
          ],
        ),
      );}
    );
  }
}
