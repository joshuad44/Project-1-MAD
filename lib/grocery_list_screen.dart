import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  @override
  _GroceryListScreenState createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  final List<Map<String, dynamic>> groceryItems = [];

  TextEditingController _itemController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  void _addItem(String item, String quantity) {
    setState(() {
      groceryItems.add({'item': item, 'quantity': quantity});
    });
  }

  void _editItem(int index, String newItem, String newQuantity) {
    setState(() {
      groceryItems[index]['item'] = newItem;
      groceryItems[index]['quantity'] = newQuantity;
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Grocery List',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.separated(
                itemCount: groceryItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '${groceryItems[index]['item']}',
                      style: TextStyle(fontSize: 22.0, color: Colors.yellow[200]),
                    ),
                    tileColor: Color(0xff18181A),
                    trailing: 
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('x${groceryItems[index]['quantity']}', style: TextStyle(fontSize: 22.0, color: Colors.yellow[200])),
                            SizedBox(width: 8,),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => _removeItem(index),
                            ),
                          ]
                        ),
                      ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Edit Item',
                              style: TextStyle(fontSize: 22.0, color: Colors.yellow[200]),
                            ),
                            backgroundColor: Color(0xff18181A),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: _itemController..text = groceryItems[index]['item'],
                                  decoration: InputDecoration(
                                    hintText: "New item",
                                    hintStyle: TextStyle(fontSize: 16.0, color: Colors.yellow[200]),
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
                                  cursorColor: Colors.yellow.shade200,
                                  style: TextStyle(color: Colors.yellow.shade200),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: _quantityController..text = groceryItems[index]['quantity'],
                                  decoration: InputDecoration(
                                    hintText: "Quantity",
                                    hintStyle: TextStyle(fontSize: 16.0, color: Colors.yellow[200]),
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
                                  cursorColor: Colors.yellow.shade200,
                                  style: TextStyle(color: Colors.yellow.shade200),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancel', style: TextStyle(fontSize: 16.0, color: Colors.yellow[200])),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Save', style: TextStyle(fontSize: 16.0, color: Colors.yellow[200])),
                                onPressed: () {
                                  _editItem(index, _itemController.text, _quantityController.text);
                                  _itemController.clear();
                                  _quantityController.clear();
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
                separatorBuilder: (context, index) => SizedBox(height: 1.0),
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Add Item',
                        style: TextStyle(fontSize: 22.0, color: Colors.yellow[200]),
                      ),
                      backgroundColor: Color(0xff18181A),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: _itemController,
                            decoration: InputDecoration(
                              hintText: "Enter item",
                              hintStyle: TextStyle(fontSize: 16.0, color: Colors.yellow[200]),
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
                            cursorColor: Colors.yellow.shade200,
                            style: TextStyle(color: Colors.yellow.shade200),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _quantityController,
                            decoration: InputDecoration(
                              hintText: "Enter quantity",
                              hintStyle: TextStyle(fontSize: 16.0, color: Colors.yellow[200]),
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
                            cursorColor: Colors.yellow.shade200,
                            style: TextStyle(color: Colors.yellow.shade200),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel', style: TextStyle(fontSize: 16.0, color: Colors.yellow[200])),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Add', style: TextStyle(fontSize: 16.0, color: Colors.yellow[200])),
                          onPressed: () {
                            _addItem(_itemController.text, _quantityController.text);
                            _itemController.clear();
                            _quantityController.clear();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Add Item',
                style: TextStyle(fontSize: 22.0, color: Colors.yellow[200]),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff18181A)), // Button text style
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.all(16.0),
                ), // Button padding
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

