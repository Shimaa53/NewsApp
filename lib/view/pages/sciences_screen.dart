import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit/news_cubit.dart';
import '../widgets/build_widgets.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return ConditionalBuilder(
            condition: NewsCubit.get(context).science.length >0,
            builder: (BuildContext context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder:(context, index) =>  buildItemNews(NewsCubit.get(context).science[index],context),
                separatorBuilder:(context,index)=> const Divider(),
                itemCount: NewsCubit.get(context).science.length),
            fallback: (BuildContext context) =>const Center(child: CircularProgressIndicator()),


          );}
    );
  }
}
