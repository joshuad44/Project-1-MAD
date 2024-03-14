import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MealPlanModel extends ChangeNotifier {
  List<List<dynamic>> mealPlan = [];

  Future<void> saveMealPlan() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> flattenedMealPlan = mealPlan.expand((entry) => entry.map((e) => e.toString())).toList();

    prefs.setStringList('mealPlan', flattenedMealPlan);
  }

  Future<void> loadMealPlan() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? flattenedMealPlan = prefs.getStringList('mealPlan');

    if (flattenedMealPlan != null) {
      mealPlan = [];
      for (int i = 0; i < flattenedMealPlan.length; i += 2) {
        String name = flattenedMealPlan[i];
        List<dynamic> macros = flattenedMealPlan[i + 1].split(',').map((e) {
          try {
            return num.parse(e);
          } catch (_) {
            return e;
          }
        }).toList();

        mealPlan.add([name, macros]);
      }
      notifyListeners();
    }
  }
  
  void removeMealPlanItem(int index) {
    if (index >= 0 && index < mealPlan.length) {
      mealPlan.removeAt(index);
      notifyListeners();
      saveMealPlan();
    }
  }

  void addToMealPlan(List<dynamic> macros, String name) {
    mealPlan.add([name, macros]);
    notifyListeners();
    saveMealPlan();
  }

  void clearMealPlan() {
    mealPlan.clear();
    notifyListeners();
    saveMealPlan();
  }
}
