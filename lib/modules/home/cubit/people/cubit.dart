import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/models/persons/persons.dart';
import 'package:task/modules/home/cubit/people/states.dart';
import 'package:task/modules/home/cubit/popular_cubit/states.dart';
import 'package:task/shared/network/remote/dio_helper.dart';
import 'package:task/shared/network/remote/end_points.dart';

import '../../../../models/popular_people/popular_persons.dart';

class PersonsCubit extends Cubit<PersonStates> {
  PersonsCubit() : super(PersonInitialState());

  static PersonsCubit get(context) => BlocProvider.of(context);

  Persons? persons;

  void getPersons({required int id}) {
    DioHelper.getData(
      endPoint: PERSONS(
        id,
      ),
    ).then(
      (value) {
        persons = Persons.fromJson(value.data);
        debugPrint(value.data.toString());
        emit(PersonSuccessState());
      },
    ).catchError(
      (error) {
        debugPrint(error.toString());
        emit(PersonErrorState(error.toString()));
      },
    );
  }


}
