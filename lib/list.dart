import 'package:flutter/material.dart';
import 'package:sampleapp/service/item_service.dart';

String aaa = '';

class ItemList extends StatelessWidget {

  ItemList(String searchWord) {
    aaa = searchWord;
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('ItemList'),
        ),
        body: new ItemListWidget(),
    );
  }
}

class ItemListWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _ItemListState();
  }
}

class _ItemListState extends State<ItemListWidget> {
  List<String> _items = [];

  Future<Null> _searchItems() async {
    ItemService service = new ItemService(aaa);
    service.getItems().then((List<String> items) {
      setState(() {
        _items = items;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _searchItems();

    return new Scaffold(
          body: new ListView(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              children: _items.map((itemName) {
                return new ListTile(
                  isThreeLine: false,
                  dense: false,
                  title: new Text(itemName),
                );
              }).toList()
          )
    );
  }
}
