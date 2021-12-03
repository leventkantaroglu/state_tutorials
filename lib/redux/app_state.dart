import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/models/fruit.dart';

class AppState {
  List<Drink> drinks;
  List<Fruit> fruits;

  AppState({
    this.drinks = const [],
    this.fruits = const [],
  });
}
