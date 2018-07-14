library currency_dropdown;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyDropDown extends StatefulWidget {
  final String currencyValue;
  final Function onChanged;
  final String title;
  final String loadingText;

  CurrencyDropDown(
      {@required this.currencyValue,
      @required this.onChanged,
      this.title = "Currency",
      this.loadingText = "Loading"});

  @override
  _CurrencyDropDownState createState() => _CurrencyDropDownState();
}


class _CurrencyDropDownState extends State<CurrencyDropDown> {
  List<dynamic> currencyList;
  var currencyValue;
  bool listLoading = true;

  getCurrencyList() async {
    String jsonRes = await rootBundle.loadString('data/currencies.json');
    var res = json.decode(jsonRes);

    setState(() {
      currencyList = res;
      listLoading = false;
      currencyValue = (currencyValue != null && currencyValue != '')
          ? currencyValue
          : res[0]['cc'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currencyList = [
      {'cc': widget.loadingText, 'name': widget.loadingText, 'symbol': ''}
    ];
    currencyValue = widget.currencyValue;
    getCurrencyList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(widget.title, textScaleFactor: 1.4,),
          new DropdownButton<String>(
            items: currencyList.map((value) {
              return new DropdownMenuItem<String>(
                value: value['cc'],
                child: Align(
                    child: new Text(value['name'] + " - " + value['symbol'])),
              );
            }).toList(),
            value: listLoading ? widget.loadingText : currencyValue,
            onChanged: (val) {
              setState(() {
                currencyValue = val;
                widget.onChanged(currencyValue);
              });
            },
          )
        ],
      ),
    );
  }
}
