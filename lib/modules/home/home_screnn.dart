import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/modules/home/cubit/people/cubit.dart';
import 'package:task/modules/home/cubit/people/states.dart';
import 'package:task/modules/home/cubit/popular_cubit/cubit.dart';

class HomeScreen extends StatelessWidget {
  int id = 64;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonsCubit()
        ..getPersons(
            id: PopularPersonsCubit.get(context)
                    .popularPersons
                    ?.results![id]
                    .id ??
                0),
      child: BlocConsumer<PersonsCubit, PersonStates>(
        listener: (context, state) {},
        builder: (context, state) {
          PersonsCubit cubit = PersonsCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      children: List.generate(
                        PopularPersonsCubit.get(context)
                                .popularPersons
                                ?.results
                                ?.length ??
                            0,
                        (index) {
                          id = index;
                          return Image.network(
                            'https://image.tmdb.org/t/p/original${cubit.persons?.profilePath}',
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
