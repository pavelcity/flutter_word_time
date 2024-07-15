import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {



  void getData() async {

    String username = await Future.delayed(Duration(seconds: 2), () {
      return 'yoshi';
    });

    String bio = await Future.delayed(Duration(seconds: 3), () {
      return 'bio';
    });

    print('$username - $bio');
  }


  @override
  void initState() {
    super.initState();
    getData();
    print('hi guys');
  }


  @override
  Widget build(BuildContext context) {
    print('build state run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('ChooseLocation', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(),
    );
  }
}
