abstract class PopularPersonStates {}

class PopularPersonInitialState extends PopularPersonStates {}

class PopularPersonLoadingState extends PopularPersonStates {}

class PopularPersonSuccessState extends PopularPersonStates {}

class PopularPersonErrorState extends PopularPersonStates {
  final String error;

  PopularPersonErrorState(this.error);
}

class PersonLoadingState extends PopularPersonStates {
}


