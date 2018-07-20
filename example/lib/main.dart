import 'package:currency_dropdown/currency_dropdown.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(title: 'Flutter Currency Drop down'),
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
  String currencyValue = 'INR';

  _onCurrencyChanged(val) {
    setState(() {
      currencyValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(10.0),
              child: CurrencyDropDown(
                  currencyValue: currencyValue, onChanged: _onCurrencyChanged)),
        ],
      ),
    );
  }
}
