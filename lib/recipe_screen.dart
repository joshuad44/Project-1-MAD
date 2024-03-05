import 'package:flutter/material.dart';
import 'package:project_1/main.dart';
import 'package:project_1/model/recipe.dart';
import 'package:project_1/recipe_screen_details.dart';


class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override 
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {

  final List<String> filterText = ['Popular', 'Healthy', 'Breakfast', 'Lunch', 'Snack', 'Dinner'];
  List<String> selectedFilter = [];

  @override 
  Widget build(BuildContext context) {
    final filterRecipe = recipeList.where((recipe) {
      return selectedFilter.isEmpty || selectedFilter.contains(recipe.filter);
    }).toList();

    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 5.0,),
                      Text('Joshua', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('assets/logo.png', height: 100, width: 80),
                      Text('Recipe Browse', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Recipe App")));
                      }, 
                      //actually i think i want to change this to home button image which takes you back to main page.
                      child: Image.asset('assets/house-64.png', height: 100, width: 100,),
                    )
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: filterText.map((filter) => Row(
                      children: [
                        FilterChip(
                          selected: selectedFilter.contains(filter),
                          label: Text(filter, style: TextStyle(color: Colors.white)),
                          checkmarkColor: Colors.white,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedFilter.add(filter);
                              } else {
                                selectedFilter.remove(filter);
                              }
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                              color: selectedFilter.contains(filter) ? Colors.yellow.shade200 : Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          backgroundColor: Color(0xff18181A),
                          selectedColor: Color(0xff18181A),
                        ),
                        SizedBox(width: 10.0), // Adjust the width as needed for separation
                      ],
                    )).toList(),
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //potential search bar
                  Text('Available Recipes:', style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),),
                ]
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: 
                    (BuildContext context, int index) {
                    return const SizedBox(
                        height: 10.0,
                    );
                  },
                  itemCount: filterRecipe.length,
                  itemBuilder: (context, index) {
                    final recipe = filterRecipe[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return RecipeDetailScreen(image: 'assets/${recipe.recipeImage}', name: recipe.name,
                            about: recipe.recipeInfo, ingredients: recipe.recipeIngredients,
                            steps: recipe.recipeSteps, macros: recipe.recipeMacros,
                          );
                        }));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Color(0xff18181A),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                          child: Row(
                            children: [
                              Image.asset('assets/${recipe.recipeImage}', height: 150.0, width: 150.0),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(recipe.recipeMacros[0] + ' mins', style: TextStyle(color: Colors.yellow.shade200, fontSize: 14.0)),
                                        SizedBox(width: 20,),
                                        Text(recipe.recipeMacros[1] + 'cals', style: TextStyle(color: Colors.yellow.shade200, fontSize: 14.0)),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(recipe.name, style: TextStyle(color: Colors.white, fontSize: 20), maxLines: 2,),
                                    const SizedBox(height: 5),
                                    Text(recipe.recipeDesc, style: TextStyle(color: Colors.blueGrey, fontSize: 13), maxLines: 2,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}