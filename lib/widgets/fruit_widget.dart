import 'package:flutter/material.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/models/fruit.dart';

class FruitWidget extends StatelessWidget {
  final Fruit fruit;
  final Function onChanged;

  const FruitWidget({Key key, this.fruit, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(fruit.name),
        Checkbox(
          value: fruit.selected,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
