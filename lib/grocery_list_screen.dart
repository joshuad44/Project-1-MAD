import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  @override
  _GroceryListScreenState createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  final List<String> groceryItems = [];

  TextEditingController _textFieldController = TextEditingController();

  void _addItem(String item) {
    setState(() {
      groceryItems.add(item);
    });
  }

  void _editItem(int index, String newItem) {
    setState(() {
      groceryItems[index] = newItem;
    });
  }

  void _removeItem(int index) {
    setState(() {
      groceryItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: groceryItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(groceryItems[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeItem(index),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Edit Item'),
                          content: TextField(
                            controller: _textFieldController,
                            decoration: InputDecoration(hintText: "New item"),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Save'),
                              onPressed: () {
                                _editItem(index, _textFieldController.text);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Add Item'),
                      content: TextField(
                        controller: _textFieldController,
                        decoration: InputDecoration(hintText: "Enter item"),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Add'),
                          onPressed: () {
                            _addItem(_textFieldController.text);
                            _textFieldController.clear();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Add Item'),
            ),
          ),
        ],
      ),
    );
  }
}
