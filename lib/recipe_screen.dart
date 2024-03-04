import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override 
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {

  List imageFilters = ['popular.png', 'healthy.png', 'breakfast.png', 'lunch.png', 'snack.png', 'dinner.png'];
  List filterText = ['Popular', 'Healthy', 'Breakfast', 'Lunch', 'Snack', 'Dinner'];

  List imageRecipes = ['burger.png', 'burrito.png', 'brocoli.png', 'french.png'];
  List recipeName = ['Smash Burger', 'Black Bean Burrito', 'Broccoli Salad', 'Baked French Toast'];
  List recipeDescription = ['1', '2', '3', '4'];

  @override 
  Widget build(BuildContext context) {
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
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                      }, 
                      child: Image.asset('assets/profile.png', height: 80, width: 80,),
                    )
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: SizedBox(
                height: 40.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorBuilder: 
                    (BuildContext context, int index)  {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                  itemCount: imageFilters.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0),
                      ), 
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          children: [
                            Image.asset('assets/${imageFilters[index]}', height: 30.0, width: 30.0,),
                            const SizedBox( width: 10.0,),
                            Text(filterText[index], style: TextStyle(color: Colors.white, fontSize: 16,),),
                          ]
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Available Recipes:', style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),),
                  Image.asset('assets/list.png', height: 35.0, width: 35.0),
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
                  itemCount: imageRecipes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        /*Navigator.push(context, MaterialPageRoute(builder: (context){
                          return RecipeDetailScreen(image: 'assets/${imageRecipes[index]}', name: recipeName[index],
                            about: about[index], ingredients: ingredients[index],
                            steps: steps[index],
                          );
                        }));*/
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
                              Image.asset('assets/${imageRecipes[index]}', height: 150.0, width: 150.0),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('650g', style: TextStyle(color: Colors.yellow.shade200, fontSize: 14.0)),
                                        SizedBox(width: 20,),
                                        Text('799cal', style: TextStyle(color: Colors.yellow.shade200, fontSize: 14.0)),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(recipeName[index], style: TextStyle(color: Colors.white, fontSize: 20), maxLines: 2,),
                                    const SizedBox(height: 5),
                                    Text(recipeDescription[index], style: TextStyle(color: Colors.blueGrey, fontSize: 13), maxLines: 2,)
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