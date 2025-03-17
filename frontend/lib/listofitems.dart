import 'package:flutter/material.dart';

class ListOfItemsPage extends StatefulWidget {
  @override
  _ListOfItemsPageState createState() => _ListOfItemsPageState();
}

class _ListOfItemsPageState extends State<ListOfItemsPage> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  final List<String> shoppingBasket = [];

  void addItemToBasket(String item) {
    setState(() {
      shoppingBasket.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {
              // Navigate to shopping basket page or show a dialog with the basket items
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Shopping Basket'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: shoppingBasket.map((item) => Text(item)).toList(),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () => addItemToBasket(items[index]),
            ),
          );
        },
      ),
    );
  }
}