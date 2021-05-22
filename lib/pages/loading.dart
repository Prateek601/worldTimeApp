import 'package:flutter/material.dart';
import 'package:world_time/services/world%20time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', url: 'Europe/Berlin',flag: 'germany.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, 'home',arguments:{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SpinKitWanderingCubes(
            color: Colors.white,
            size: 50.0,
          ),
        ),
    );
  }
}