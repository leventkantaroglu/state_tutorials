// Actions: Actions are payloads of information that send data from your
// application to your store. They are the only source of information
// for the store. You send them to the store using store.dispatch().

import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/models/fruit.dart';

class UpdateDrinkAction {
  final Drink updatedDrink;
  UpdateDrinkAction(this.updatedDrink);
}

class UpdateFruitAction {
  final Fruit updatedFruit;
  UpdateFruitAction(this.updatedFruit);
}
