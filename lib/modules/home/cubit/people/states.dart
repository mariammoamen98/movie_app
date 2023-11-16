abstract class PersonStates {}

class PersonInitialState extends PersonStates {}


class PersonSuccessState extends PersonStates {}
class PersonLoadingState extends PersonStates {}

class PersonErrorState extends PersonStates {
  final String error;

  PersonErrorState(this.error);
}
