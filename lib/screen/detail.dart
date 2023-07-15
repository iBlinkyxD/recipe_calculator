import 'package:flutter/material.dart';
import 'package:recipe_calculator/services/recipe.dart';
class DetailScreen extends StatefulWidget {
  final Recipe recipe;
  
  const DetailScreen({super.key, required this.recipe});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>{

  int _servingValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Spartan MB',
              ),
            ),
            Expanded(
              child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: widget.recipe.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Text('${ingredient.quantity * _servingValue} '
                      '${ingredient.measure} '
                      '${ingredient.name}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Spartan MB',
                      ),
                    );
                  },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '${_servingValue * widget.recipe.servings} servings',
              value: _servingValue.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _servingValue = newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}