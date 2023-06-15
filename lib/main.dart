import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_api_task/controller/data/local/shared.dart';
import 'package:news_api_task/controller/data/remote/data_helper/dio_helper.dart';
import 'package:news_api_task/view/pages/news_page.dart';

import 'controller/bloc_observer.dart';
import 'controller/cubit/news_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataHelper.init();
  await MyCache.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit,NewsState>(
          listener: (BuildContext context, state) {  },
          builder: (context,state) {
            NewsCubit.get(context).getTheme();
            return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textTheme: const TextTheme(
                  bodyLarge: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Colors.black

                  ),
                bodyMedium:TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),

              ),

              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                elevation: 20.0
              )
          ),
          darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('333739'),
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  elevation: 20.0
              ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.white

              ),
              bodyMedium:TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            )
          ),
          themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
          home:  const NewsPage(),
        );}
      ),
    );
  }
}
