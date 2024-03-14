import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_1/model/change_notifier.dart';

class RecipeDetailScreen extends StatefulWidget{
  RecipeDetailScreen(
    {Key? key,
    required this.image,
    required this.name,
    required this.about,
    required this.ingredients,
    required this.steps,
    required this.macros})
     : super(key: key);

  String image;
  String name;
  String about;
  String ingredients;
  String steps;
  List macros;  

  @override 
  State<RecipeDetailScreen> createState() => _RecipeDetailScreen();
}

class _RecipeDetailScreen extends State<RecipeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var mealPlanModel = Provider.of<MealPlanModel>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar:  AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(widget.name, style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox( height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  widget.image,
                  height: 300,
                  width: 300,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox( height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 10.0
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border(
                      left: BorderSide(width: 1.5, color: Colors.white),
                      top: BorderSide(width: 1.5, color: Colors.white),
                      right: BorderSide(width: 1.5, color: Colors.white),
                      bottom: BorderSide(width: 1.5, color: Colors.white),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.macros[1].toString(),
                              style: TextStyle(
                                color: Colors.yellow.shade200,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('kcal', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              widget.macros[2].toString(),
                              style: TextStyle(
                                color: Colors.yellow.shade200,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('fats', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              widget.macros[3].toString(),
                              style: TextStyle(
                                color: Colors.yellow.shade200,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('carbs', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              widget.macros[4].toString(),
                              style: TextStyle(
                                color: Colors.yellow.shade200,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('protein', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              widget.macros[5],
                              style: TextStyle(
                                color: Colors.yellow.shade200,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('serve', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  minWidth: MediaQuery.of(context).size.width,
                  height: 60.0,
                  color: Colors.yellow.shade200,
                  onPressed: () {
                    cookingSteps();
                  },
                  child: Center(
                    child: Text(
                      'Cooking Steps',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Text(
                'About This Recipe',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  widget.about,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,top: 10, bottom: 5),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  minWidth: MediaQuery.of(context).size.width,
                  height: 30.0,
                  color: Colors.yellow.shade200,
                  onPressed: () {
                    //add to grocery list
                  },
                  child: Center(
                    child: Text(
                      'Add to Grocery List',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,top: 5),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  minWidth: MediaQuery.of(context).size.width,
                  height: 30.0,
                  color: Colors.yellow.shade200,
                  onPressed: () {
                    //add to meal plan
                    mealPlanModel.addToMealPlan(widget.macros, widget.name);
                  },
                  child: Center(
                    child: Text(
                      'Add to Meal Plan',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future cookingSteps() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              color: Color(0xff18181A),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Steps',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.steps,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      textAlign: TextAlign.justify,
                    ), 
                  ],
                ),
              ),
            ),
          )
        );
      }
    );
  }
}