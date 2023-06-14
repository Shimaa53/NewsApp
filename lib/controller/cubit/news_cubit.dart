import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_api_task/controller/data/local/shared.dart';
import 'package:news_api_task/controller/data/remote/data_helper/end_point.dart';
import 'package:news_api_task/model/news_model.dart';
import 'package:news_api_task/view/pages/business_screen.dart';
import 'package:news_api_task/view/pages/sciences_screen.dart';
import 'package:news_api_task/view/pages/sports_screen.dart';
import 'package:news_api_task/controller/data/remote/data_helper/dio_helper.dart';
import 'package:news_api_task/view/utilities/enums.dart';


part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;

  List<BottomNavigationBarItem> bottomItems=const[
    BottomNavigationBarItem(icon:Icon(Icons.business),label: 'business'),
    BottomNavigationBarItem(icon:Icon(Icons.sports),label: 'sports'),
    BottomNavigationBarItem(icon:Icon(Icons.science),label: 'science'),

  ];

  List<Widget>screens=[
    const BusinessScreen(),
    SportsScreen(),
    ScienceScreen()
  ];

   void changeIndex(int index){
    currentIndex=index;
    if(index==1) {
      getSports();
    }
    if(index==2) {
      getScience();
    }
    emit(ChangeBottomNavigation());
  }
  List< NewsModel >business=[];
  Future getBusiness()async{
    emit(LoadingState());
    if(business.length==0){
      try{
        Response response =await DataHelper.getData(
            url: endPoint,
            queryParameters: {
              'country':'eg',
              'category':'business',
              'apiKey':'8f1ea90a219a4a70a05c2175e4dc0272'
            }
        );
        response.data['articles'].forEach((e){
          business.add(NewsModel.fromJson(e));
        });
        print(response.data['articles']);
        print(business.length);
        emit(GetBusinessDataSuccess());
      } catch(e){
        print(e);
        emit(GetBusinessDataError());
      }
    }else{
      emit(GetBusinessDataSuccess());
    }

  }
   List< NewsModel >sports=[];
  Future getSports()async{
    emit(LoadingState());
    if(sports.length==0){
      try{
        Response response =await DataHelper.getData(
            url: endPoint,
            queryParameters: {
              'country':'eg',
              'category':'sports',
              'apiKey':'8f1ea90a219a4a70a05c2175e4dc0272'
            }
        );
        response.data['articles'].forEach((e){
          sports.add(NewsModel.fromJson(e));
        });
        print(response.data['articles']);
        print(sports.length);
        GetSportsDataSuccess();
      } catch(e){
        print(e);
        emit(GetSportsDataError());
      }
    }
    else{
      GetSportsDataSuccess();
    }

  }
   List< NewsModel >science=[];
  Future getScience()async{
    emit(LoadingState());
    if(science.length==0){
      try{
        Response response =await DataHelper.getData(
            url: endPoint,
            queryParameters: {
              'country':'eg',
              'category':'science',
              'apiKey':'8f1ea90a219a4a70a05c2175e4dc0272'
            }
        );
        response.data['articles'].forEach((e){
          science.add(NewsModel.fromJson(e));
        });
        print(response.data['articles']);
        print(science.length);
        emit(GetScienceDataSuccess());
      } catch(e){
        print(e);
        emit(GetScienceDataError());
      }
    }
    else{
      emit(GetScienceDataSuccess());
    }
  }

bool isDark=false;

void changeTheme(){
  isDark= !isDark;
  MyCache.putBoolean(key: MyCacheKeys.theme, value: isDark);
  emit(ChangeTheme());
}

void getTheme(){
  isDark=MyCache.getBoolean(key: MyCacheKeys.theme);
  emit(GetTheme());
}

  List< dynamic >search=[];
  Future getSearch(String value)async{
    emit(LoadingState());
    search=[];
      try{
        Response response =await DataHelper.getData(
            url: endPointSearch,
            queryParameters: {
              'q':value,
              'apiKey':'8f1ea90a219a4a70a05c2175e4dc0272'
            }
        );
        search=response.data['articles'];
        print(response.data['articles']);
        print(search.length);
        emit(GetSearchDataSuccess());
      } catch(e){
        print(e);
        emit(GetSearchDataError());
      }

  }

}
