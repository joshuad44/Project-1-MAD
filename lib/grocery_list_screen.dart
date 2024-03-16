import 'package:flutter/material.dart';

class GroceryListScreen extends StatelessWidget {
  final List<String> groceryItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Implement grocery list UI here
        ],
      ),
    );
  }
}//
