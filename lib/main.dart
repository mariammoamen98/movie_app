import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/modules/home/cubit/popular_cubit/cubit.dart';
import 'package:task/modules/home/home_screen_without_api.dart';
import 'package:task/shared/network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PopularPersonsCubit()..getPopularPersons(),
          lazy: false,
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreenWithoutApi(),
      ),
    );
  }
}
