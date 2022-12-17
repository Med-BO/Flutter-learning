import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = "61CF3807-85B6-46C9-8039-96CC9B067AB8";

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'USD';
  List<DropdownMenuItem<String>>? currenciesWidgetList = [];
  dynamic bitcoinValue;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    for (var currency in currenciesList) {
      currenciesWidgetList!.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }
    getBitcoinValue();
  }

  Future getBitcoinValue() async {
    var url =
        "https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=$apiKey";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map;
      setState(() {
        bitcoinValue = jsonResponse['rate'].toInt();
        isLoading = false;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
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
                child: isLoading
                    ? Text(
                        'Loading...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        '1 BTC = $bitcoinValue $selectedCurrency',
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
            child: DropdownButton<String>(
              value: selectedCurrency,
              items: currenciesWidgetList,
              onChanged: (value) => {
                setState(() {
                  selectedCurrency = value;
                  isLoading = true;
                  getBitcoinValue();
                })
              },
            ),
          ),
        ],
      ),
    );
  }
}
