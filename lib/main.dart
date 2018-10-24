import 'package:flutter/material.dart';
import 'package:sampleapp/list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Form Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your first and last name',
                      labelText: 'Name',
                    ),
                    controller: _myController,
                  ),
                  new Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute<Null>(
                                  settings: const RouteSettings(name: "/list"),
                                  builder: (BuildContext context) =>
                                      new ItemList(_myController.text)));
                        },
                      )),
                ],
              ))),
    );
  }
}
