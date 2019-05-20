import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/services.dart';

class MapProvider extends StatefulWidget{

  final String google_api_key;
  final String latitude;
  final String longitude;
  final int width;
  final int height;
  final int zoom;

  const MapProvider({Key key, @required this.google_api_key, this.latitude, this.longitude, this.width, this.height, this.zoom}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MapProviderState();
  }
}

class _MapProviderState extends State<MapProvider>{
  @override
  Widget build(BuildContext context) {
    //First thing first, we need to initialize the URL For the static map and the GoogleMap
    String mapURI = 'https://maps.googleapis.com/maps/api/staticmap?center=${widget.latitude}%2C${widget.longitude}&zoom=${widget.zoom}&size=${widget.width}x${widget.height}&maptype=roadmap&markers=color:green%7C${widget.latitude},${widget.longitude}&key=${widget.google_api_key}';
    String googleMap = 'https://www.google.com/maps/search/?api=1&query=${widget.latitude},${widget.longitude}';

    return GestureDetector(
      onTap: (){
        openMap(googleMap, context); ///here we call the method for navigating to Google Map application
      }, /// We need to use GestureDetector, so we can click on the map image later
      child: Image.network(mapURI, fit: BoxFit.fill,), ///Show the image from the staticMap url.
    );
  }

  ///create method
  static openMap(String googleMapUrl, BuildContext context) async {
    String url = googleMapUrl; //initialize url
    if(await canLaunch(url)){ ///check if we can launch the url
      await launch(url); ///then launch the url
    }
    else{
      ///otherwise show snackbar error message for 3 seconds
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text('Couldn\'t open map'),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
