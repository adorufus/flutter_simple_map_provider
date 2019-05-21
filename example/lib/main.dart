import 'package:flutter/material.dart';
import 'package:map_provider/map_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Container(
              height: 200,
              width: 200,
              child: MapProvider(
                google_api_key: '' , ///your_api_key_here, otherwise this won\'t work
                width: 200,
                height: 200,
                latitude: '15.79286',
                longitude: '27.94013',
                zoom: 1,
              )
          ),
        ),
      ),
    );
  }
}
