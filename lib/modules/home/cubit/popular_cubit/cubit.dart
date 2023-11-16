import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/models/persons/persons.dart';
import 'package:task/modules/home/cubit/popular_cubit/states.dart';
import 'package:task/shared/network/remote/dio_helper.dart';
import 'package:task/shared/network/remote/end_points.dart';

import '../../../../models/popular_people/popular_persons.dart';

class PopularPersonsCubit extends Cubit<PopularPersonStates> {
  PopularPersonsCubit() : super(PopularPersonInitialState());

  static PopularPersonsCubit get(context) => BlocProvider.of(context);

  PopularPersons? popularPersons;

  void getPopularPersons() {
    emit(PopularPersonLoadingState());
    DioHelper.getData(
      endPoint: POPULAR_PERSON,
    ).then(
          (value) {
        popularPersons = PopularPersons.fromJson(value.data);
        emit(PopularPersonSuccessState());
      },
    ).catchError(
          (error) {
        debugPrint(error.toString());
        emit(
          PopularPersonErrorState(error),
        );
      },
    );
  }
}

