
// pages/loading.dart
import 'package:flutter/material.dart';
import 'package:word_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // String? time = 'loading';


  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    // print(instance.time); /
    // setState(() {
    //   time = instance.time ?? 'Failed to get time';
    // });

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime': instance.isDayTime,
    });

    // After getting the time, you can navigate to the home screen or do other tasks
    // For example:
    // Navigator.pushReplacementNamed(context, '/home', arguments: {
    //   'location': instance.location,
    //   'flag': instance.flag,
    //   'time': instance.time,
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRipple(
          color: Colors.blue,
          size: 120.0,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Loading(),
  ));
}