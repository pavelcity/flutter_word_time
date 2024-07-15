import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    // data = ModalRoute.of(context).settings.arguments;
    final routeData = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments;

    if (routeData != null && routeData is Map) {
      data = routeData;
    } else {
      data = {}; // или можно установить значение по умолчанию
    }
    print(data);

    String mainImg = data['isDayTime'] ? 'assets/img/sun.jpg' : 'assets/img/02.jpg';
    String bgImage = data['isDayTime'] ? 'assets/img/blueday.jpg' : 'assets/img/night.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.grey[100] : Colors.indigo[900];


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,

            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset(
                    mainImg,
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton.icon(
                label: Text(
                  'Location',
                  style: TextStyle(
                      fontSize: 24, color:
                  Colors.blue),
                ),
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDayTime' : result['isDayTime'],
                        'flag' : result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    size: 29,
                    color: Colors.grey[600],
                  ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 32, color: Colors.grey[200]),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      data['time'],
                      style: TextStyle(fontSize: 52, fontWeight: FontWeight.w700, color: Colors.grey[100]),
                    ),
                  ],
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
