// Reducer: Actions describe the fact that something happened,
// but don't specify how the application's state changes in response.
// This is the job of reducers.

import 'actions.dart';
import 'app_state.dart';

AppState updateReducer(AppState state, dynamic action) {
  if (action is UpdateDrinkAction) {
    return AppState(
        drinks: state.drinks
            .map((drink) => drink.name == action.updatedDrink.name
                ? action.updatedDrink
                : drink)
            .toList(),
        fruits: state.fruits);
  } else if (action is UpdateFruitAction) {
    return AppState(
        fruits: state.fruits
            .map((fruit) => fruit.name == action.updatedFruit.name
                ? action.updatedFruit
                : fruit)
            .toList(),
        drinks: state.drinks);
  }
  return state;
}

AppState updateFruitsReducer(AppState state, dynamic action) {
  if (action is UpdateFruitAction) {
    return AppState(
        fruits: state.fruits
            .map((fruit) => fruit.name == action.updatedFruit.name
                ? action.updatedFruit
                : fruit)
            .toList());
  }
  return state;
}
