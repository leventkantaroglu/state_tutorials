import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/redux/actions.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';
import 'package:smtutorial/widgets/fruit_widget.dart';

import '../constants.dart';
import 'app_state.dart';

// Widget
class ReduxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail Order"),
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: kWhiteBackground,
              child: StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (context, state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Drinks",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              ...state.drinks
                                  .map(
                                    (drink) => DrinksWidget(
                                      drink: drink,
                                      onChanged: (value) {
                                        drink.selected = !drink.selected;
                                        StoreProvider.of<AppState>(context)
                                            .dispatch(
                                          UpdateDrinkAction(drink),
                                        );
                                      },
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Fruits",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              ...state.fruits
                                  .map(
                                    (fruit) => FruitWidget(
                                      fruit: fruit,
                                      onChanged: (value) {
                                        fruit.selected = !fruit.selected;
                                        StoreProvider.of<AppState>(context)
                                            .dispatch(
                                          UpdateFruitAction(fruit),
                                        );
                                      },
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "The order is: ",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            state.drinks
                                .where((element) => element.selected)
                                .toList()[index]
                                .name,
                          ),
                        ),
                        itemCount: state.drinks
                            .where((element) => element.selected)
                            .length,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            state.fruits
                                .where((element) => element.selected)
                                .toList()[index]
                                .name,
                          ),
                        ),
                        itemCount: state.fruits
                            .where((element) => element.selected)
                            .length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
