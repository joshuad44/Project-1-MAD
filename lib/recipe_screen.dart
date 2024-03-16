import 'package:flutter/material.dart';
import 'package:project_1/home_screen.dart';
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

  final TextEditingController _searchController = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    List<Recipe> filteredRecipeList = [];
    
    recipeList.shuffle();
    final filterRecipe = recipeList.where((recipe) {
      return selectedFilter.isEmpty || selectedFilter.contains(recipe.filter);
    }).toList();

    if (_searchController.text.isNotEmpty) {
      filteredRecipeList = filterRecipe.where((recipe) {
        return recipe.name.toLowerCase().contains(_searchController.text.toLowerCase());
      }).toList();
    } else {
      filteredRecipeList = List.from(filterRecipe);
    }

    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            'Recipe Browse',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: [
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
                  Text('Available Recipes:', style: TextStyle(color: Colors.white, fontSize: 22.0),),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        setState(() {}); 
                      },
                      decoration: InputDecoration(
                        hintText: 'Search recipes...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.yellow.shade200),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                    ),
                  ), 
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
                  itemCount: filteredRecipeList.length,
                  itemBuilder: (context, index) {
                    final recipe = filteredRecipeList[index];
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
                                        Text(recipe.recipeMacros[0].toString() + ' mins', style: TextStyle(color: Colors.yellow.shade200, fontSize: 14.0)),
                                        SizedBox(width: 20,),
                                        Text(recipe.recipeMacros[1].toString() + 'cals', style: TextStyle(color: Colors.yellow.shade200, fontSize: 14.0)),
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