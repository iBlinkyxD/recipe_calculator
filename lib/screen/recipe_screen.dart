import 'package:flutter/material.dart';
import 'package:recipe_calculator/screen/detail.dart';
import 'package:recipe_calculator/services/recipe.dart';
class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State <RecipeScreen> createState() =>  RecipeScreenState();
}

class RecipeScreenState extends State <RecipeScreen>{

  //final List<String> imgList = <String>['assets/2126711929_ef763de2b3_w.jpg', 'assets/27729023535_a57606c1be.jpg', 'assets/3187380632_5056654a19_b.jpg', 'assets/15992102771_b92f4cc00a_b.jpg', 'assets/8533381643_a31a99e8a6_c.jpg', 'assets/15452035777_294cefced5_c.jpg'];
  //final List<String> labelList = <String>['Spaghetti and Meatballs', 'Tomato Soup', 'Grilled Cheese', 'Chocolate Chip Cookies', 'Taco Salad', 'Hawaiian Pizza'];
  //final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Recipe Calculator'),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(recipe: Recipe.samples[index]);
                }));
              },
              child: buildRecipeCard(Recipe.samples[index])
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
    );
  }
}

Widget buildRecipeCard(Recipe recipe) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(recipe.imageUrl)),
          const SizedBox(
            height: 14.0,
          ),
          Text(
            recipe.label,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Spartan MB',
            ),
          )
        ],
      ),
    ),
  );
}
