import 'package:flutter/material.dart';
import 'package:project_1/model/change_notifier.dart';
import 'package:project_1/model/pie_chart.dart';
import 'package:project_1/model/pie_chart_2.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MealPlanningScreen extends StatefulWidget {
  const MealPlanningScreen({Key? key}) : super(key: key);

  @override
  State<MealPlanningScreen> createState() => _MealPlanningScreenState();
}

class _MealPlanningScreenState extends State<MealPlanningScreen> {

  num goalCal = 0;
  num goalFat = 0;
  num goalCarb = 0;
  num goalProtein = 0;

  num totalCal = 0;
  num totalFat = 0;
  num totalCarb = 0;
  num totalProtein = 0;

  @override
  void initState() {
    _loadGoalsFromPrefs();
    _loadTotalsFromPrefs();
    _loadMealPlanFromPrefs(); 
    super.initState();
    // Calculate initial totalCal

    _updateTotals();
  }
  
  void _updateTotals() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var mealPlanModel = Provider.of<MealPlanModel>(context, listen: false);
      setState(() {
        totalCal = 0;
        totalFat = 0;
        totalCarb = 0;
        totalProtein = 0;
        for (var item in mealPlanModel.mealPlan) {
          totalCal += item[1][1];
          totalFat += item[1][2];
          totalCarb += item[1][3];
          totalProtein += item[1][4];
        }
        _saveTotalsToPrefs();
        _saveGoalsToPrefs();
      });
    });
  }

  void addItemToMealPlan(String recipeName, List<dynamic> macronutrients) {
    var mealPlanModel = Provider.of<MealPlanModel>(context, listen: false);
    
    mealPlanModel.addToMealPlan(macronutrients, recipeName);

    _updateTotals();
    _saveMealPlanToPrefs();
  }

  Future _loadMealPlanFromPrefs() async {
    var mealPlanModel = Provider.of<MealPlanModel>(context, listen: false);
    await mealPlanModel.loadMealPlan();
    _updateTotals(); 
  }

  Future _saveMealPlanToPrefs() async {
    var mealPlanModel = Provider.of<MealPlanModel>(context, listen: false);
    await mealPlanModel.saveMealPlan();
  }
  

  Future _loadGoalsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      goalCal = prefs.getDouble('goalCal') ?? 0;
      goalFat = prefs.getDouble('goalFat') ?? 0;
      goalCarb = prefs.getDouble('goalCarb') ?? 0;
      goalProtein = prefs.getDouble('goalProtein') ?? 0;
    });
  }

  Future _loadTotalsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      totalCal = prefs.getDouble('totalCal') ?? 0;
      totalFat = prefs.getDouble('totalFat') ?? 0;
      totalCarb = prefs.getDouble('totalCarb') ?? 0;
      totalProtein = prefs.getDouble('totalProtein') ?? 0;
    });
  }

  Future _saveGoalsToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('goalCal', goalCal.toDouble());
    prefs.setDouble('goalFat', goalFat.toDouble());
    prefs.setDouble('goalCarb', goalCarb.toDouble());
    prefs.setDouble('goalProtein', goalProtein.toDouble());
  }

  Future _saveTotalsToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('totalCal', totalCal.toDouble());
    prefs.setDouble('totalFat', totalFat.toDouble());
    prefs.setDouble('totalCarb', totalCarb.toDouble());
    prefs.setDouble('totalProtein', totalProtein.toDouble());
  }


  Future _clearGoalsPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('goalCal');
    prefs.remove('goalFat');
    prefs.remove('goalCarb');
    prefs.remove('goalProtein');

    setState(() {
      goalCal = 0;
      goalFat = 0;
      goalCarb = 0;
      goalProtein = 0;
    });
  }

  Future _clearTotalsPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('totalCal');
    prefs.remove('totalFat');
    prefs.remove('totalCarb');
    prefs.remove('totalProtein');

    setState(() {
      totalCal = 0;
      totalFat = 0;
      totalCarb = 0;
      totalProtein = 0;
    });
  }

  void _clearMealPlan() {
    var mealPlanModel = Provider.of<MealPlanModel>(context, listen: false);
    mealPlanModel.clearMealPlan(); 

    setState(() {
      totalCal = 0;
      totalFat = 0;
      totalCarb = 0;
      totalProtein = 0;
    });

    _updateTotals();
    _clearTotalsPrefs();

  }

  Future _showNutrientGoalsDialog() {
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
                    SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Goal Calories (g)',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow.shade200, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow.shade200, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: TextStyle(color: Colors.yellow.shade200),
                      ),
                      onChanged: (value) {
                        setState(() {
                          goalCal = num.tryParse(value) ?? 0;
                          _saveGoalsToPrefs();
                        });
                      },
                      cursorColor: Colors.yellow.shade200,
                      style: TextStyle(color: Colors.yellow.shade200),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Goal Fats (g)',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow.shade200, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow.shade200, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: TextStyle(color: Colors.yellow.shade200),
                      ),
                      onChanged: (value) {
                        setState(() {
                          goalFat = num.tryParse(value) ?? 0;
                          _saveGoalsToPrefs();
                        });
                      },
                      cursorColor: Colors.yellow.shade200,
                      style: TextStyle(color: Colors.yellow.shade200),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Goal Carbs (g)',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow.shade200, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow.shade200, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: TextStyle(color: Colors.yellow.shade200),
                      ),
                      onChanged: (value) {
                        setState(() {
                          goalCarb = num.tryParse(value) ?? 0;
                          _saveGoalsToPrefs();
                        });
                      },
                      cursorColor: Colors.yellow.shade200,
                      style: TextStyle(color: Colors.yellow.shade200),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Goal Protein (g)',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow.shade200, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow.shade200, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: TextStyle(color: Colors.yellow.shade200),
                      ),
                      onChanged: (value) {
                        setState(() { 
                          goalProtein = num.tryParse(value) ?? 0;
                          _saveGoalsToPrefs();
                        });
                      },
                      cursorColor: Colors.yellow.shade200,
                      style: TextStyle(color: Colors.yellow.shade200),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel', style: TextStyle(color: Colors.yellow.shade200,fontWeight: FontWeight.bold,fontSize: 16)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _saveGoalsToPrefs();
                            },
                            child: Text('Apply', style: TextStyle(color: Colors.yellow.shade200,fontWeight: FontWeight.bold,fontSize: 16)),
                          ),
                        ],
                      )
                    )
                  ],
                ),
              ),
            ),
          )
        );
      }
    );
  }

  Future _showNewFoodDialog() {
      String foodName = "";
      List foodMacros = ["",0,0,0,0,""];
      bool valid = true;
      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

      return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.text, // Use TextInputType.text for text input
                        decoration: InputDecoration(
                          labelText: 'Food Name',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow.shade200, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow.shade200, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(color: Colors.yellow.shade200),
                        ),
                        onChanged: (value) {
                          setState(() {
                            foodName = value;
                          });
                        },
                        cursorColor: Colors.yellow.shade200,
                        style: TextStyle(color: Colors.yellow.shade200),
                        validator: (value) {
                          valid = value != null && value.isNotEmpty;
                          return valid ? null : 'Food name is required';
                        },
                      ),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Food Calories',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow.shade200, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow.shade200, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(color: Colors.yellow.shade200),
                        ),
                        onChanged: (value) {
                          setState(() {
                            foodMacros[1] = num.tryParse(value) ?? 0;
                          });
                        },
                        cursorColor: Colors.yellow.shade200,
                        style: TextStyle(color: Colors.yellow.shade200),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Food Fats (g)',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow.shade200, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow.shade200, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(color: Colors.yellow.shade200),
                        ),
                        onChanged: (value) {
                          setState(() {
                            foodMacros[2] = num.tryParse(value) ?? 0;
                          });
                        },
                        cursorColor: Colors.yellow.shade200,
                        style: TextStyle(color: Colors.yellow.shade200),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Food Carbs (g)',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow.shade200, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow.shade200, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(color: Colors.yellow.shade200),
                        ),
                        onChanged: (value) {
                          setState(() {
                            foodMacros[3] = num.tryParse(value) ?? 0;
                          });
                        },
                        cursorColor: Colors.yellow.shade200,
                        style: TextStyle(color: Colors.yellow.shade200),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Food Protein (g)',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow.shade200, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow.shade200, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(color: Colors.yellow.shade200),
                        ),
                        onChanged: (value) {
                          setState(() { 
                            foodMacros[4] = num.tryParse(value) ?? 0;
                          });
                        },
                        cursorColor: Colors.yellow.shade200,
                        style: TextStyle(color: Colors.yellow.shade200),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel', style: TextStyle(color: Colors.yellow.shade200,fontWeight: FontWeight.bold,fontSize: 16)),
                            ),
                            TextButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() == true) {
                                  addItemToMealPlan(foodName, foodMacros);
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text('Apply', style: TextStyle(color: Colors.yellow.shade200,fontWeight: FontWeight.bold,fontSize: 16)),
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        );
      },
    );
  }

   @override
  Widget build(BuildContext context) {
    var mealPlanModel = Provider.of<MealPlanModel>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Meal Planning",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: 
                  Container(
                    child: Text('Goal', style: TextStyle(color: Colors.yellow.shade200,fontWeight: FontWeight.bold,fontSize: 22), textAlign: TextAlign.center,),
                  ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 40),
                child: 
                  Container(
                    child: Text('Today', style: TextStyle(color: Colors.yellow.shade50,fontWeight: FontWeight.bold,fontSize: 22), textAlign: TextAlign.center,),
                  ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
                child: MyPieChart2(value1: goalFat,value2: goalCarb,value3: goalProtein),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
                child: MyPieChart(value1: totalFat,value2: totalCarb,value3: totalProtein),
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              minWidth: MediaQuery.of(context).size.width,
              height: 40.0,
              color: Colors.yellow.shade200,
              onPressed: () {
                // change nutrient goals
                setState(() {
                  _showNutrientGoalsDialog();
                });
              },
              child: Center(
                child: Text(
                  'Set Nutrient Goals',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border(
                  left: BorderSide(width: 1.5, color: Colors.white),
                  top: BorderSide(width: 1.5, color: Colors.white),
                  right: BorderSide(width: 1.5, color: Colors.white),
                  bottom: BorderSide(width: 1.5, color: Colors.white),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${goalCal}',
                                  style: TextStyle(
                                    color: Colors.yellow.shade200,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  '${totalCal}',
                                  style: TextStyle(
                                    color: Colors.yellow.shade50,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text('kcal', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${goalFat}',
                                  style: TextStyle(
                                    color: Colors.yellow.shade200,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  '${totalFat}',
                                  style: TextStyle(
                                    color: Colors.yellow.shade50,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text('fats (g)', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${goalCarb}',
                                  style: TextStyle(
                                    color: Colors.yellow.shade200,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  '${totalCarb}',
                                  style: TextStyle(
                                    color: Colors.yellow.shade50,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text('carbs (g)', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${goalProtein.toString()}',
                                  style: TextStyle(
                                    color: Colors.yellow.shade200,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  '${totalProtein.toString()}',
                                  style: TextStyle(
                                    color: Colors.yellow.shade50,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text('protein (g)', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              minWidth: MediaQuery.of(context).size.width,
              height: 30.0,
              color: Colors.yellow.shade200,
              onPressed: () {
                // Add Custom Food
                _showNewFoodDialog();
              },
              child: Center(
                child: Text(
                  'Add Custom Food',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              minWidth: MediaQuery.of(context).size.width,
              height: 30.0,
              color: Colors.yellow.shade200,
              onPressed: () {
                // Clear
                _clearMealPlan();
                setState(() {
                  _clearGoalsPrefs();
                });
              },
              child: Center(
                child: Text(
                  'Clear for the Day',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              'Foods:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: 
                (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10.0,
                );
              },
              itemCount: mealPlanModel.mealPlan.length,
              itemBuilder: (context, index) {
                var item = mealPlanModel.mealPlan[index];
                _updateTotals();
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: ListTile(
                    tileColor: Color(0xff18181A),
                    
                    title: Text(item[0], style: TextStyle(color: Colors.yellow.shade200, fontWeight: FontWeight.bold),), // Recipe name
                    subtitle: Text('Macros: ${item[1][1].toString()} cals ${item[1][2].toString()} fats ${item[1][3].toString()} carbs ${item[1][4].toString()} protein', style: TextStyle(color: Colors.yellow.shade50, fontWeight: FontWeight.bold)), // Macros
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.grey), // You can change the icon as needed
                      onPressed: () {
                        setState(() {
                          mealPlanModel.removeMealPlanItem(index);
                          _updateTotals();
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
