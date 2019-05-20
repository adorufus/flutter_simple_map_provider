# map_provider

A plugin for showing static map and calling Google Map application when clicked

## Getting Started

Add into your pubspec.yml
``` dart
dependencies:
  map_provider: ^1.0.0
```
Then install
``` dart
$ flutter packages get
```
Add to your project
``` dart
import 'package:map_provider/map_provider.dart';
```

### Simple HOW-TO
``` dart
(...)
import 'package:map_provider/map_provider.dart;

class MyMapView extends StatefulWidget{
  (...)
}

class _MyMapViewState extends State<MyMapView>{
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
```
