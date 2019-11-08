import 'dart:io';

import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = 'USD';
  int lastPrice = 0;
  CoinData coinData = CoinData();

  @override
  void initState() {
    super.initState();
    onPickCurrency(currency);
  }

  Widget getPicker() {
    List<DropdownMenuItem<String>> androidWidgets = [];
    List<Text> iOSWidgets = [];

    var isIOS = Platform.isIOS;

    for (String currency in currenciesList) {
      if (isIOS) {
        iOSWidgets.add(
          Text(currency),
        );
      } else {
        androidWidgets.add(
          DropdownMenuItem(
            child: Text(currency),
            value: currency,
          ),
        );
      }
    }

    return isIOS ? iOSPicker(iOSWidgets) : androidPicker(androidWidgets);
  }

  void onPickCurrency(value) {
    coinData.getCoinData(value).then((HttpClientResponse resp) {
      resp.transform(utf8.decoder).listen((contents) {
        setState(() {
          currency = value;
          lastPrice = jsonDecode(contents.toString())['last'].toInt();
        });
      });
    });
  }

  Widget iOSPicker(child) {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 40, // Height of each item
      onSelectedItemChanged: (index) {
        onPickCurrency(currenciesList[index]);
      },
      children: child,
    );
  }

  Widget androidPicker(child) {
    return DropdownButton(
      value: currency,
      underline: Container(
        height: 1,
        color: Colors.white,
      ),
      elevation: 16,
      items: child,
      onChanged: (value) {
        onPickCurrency(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $lastPrice $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
