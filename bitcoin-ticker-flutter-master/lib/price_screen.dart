import 'dart:io';
import 'coin_data.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = 'USD';
  int btcPrice = 0;
  int ethPrice = 0;
  int ltcPrice = 0;
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
          btcPrice =
              jsonDecode(contents.toString())['BTC$value']['last'].toInt();
          ltcPrice =
              jsonDecode(contents.toString())['LTC$value']['last'].toInt();
          ethPrice =
              jsonDecode(contents.toString())['ETH$value']['last'].toInt();
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

  Widget getCryptoList() {
    List<Card> widgets = [];

    for (String crypto in cryptoList) {
      int price = 0;

      switch (crypto) {
        case 'LTC':
          price = ltcPrice;
          break;

        case 'ETH':
          price = ethPrice;
          break;

        default:
          price = btcPrice;
          break;
      }

      widgets.add(
        Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: Text(
              '1 $crypto = $price $currency',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widgets,
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
            padding: EdgeInsets.all(20),
            child: getCryptoList(),
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
