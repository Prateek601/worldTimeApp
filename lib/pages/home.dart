import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Map data = {};

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgimage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo[800];

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
             image: AssetImage('assets/$bgimage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location' : result['location'],
                        'flag' : result['flag'],
                        'time' : result['time'],
                        'isDaytime' : result['isDaytime']
                      };
                    });

                  },
                  label: Text(
                      'edit location',
                       style: TextStyle(
                         color: Colors.grey[300]
                       )
                  ),
                  icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                  )
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      color: Colors.white
                    ),)
                  ],
                ),
                SizedBox(height: 10),
                Text(data['time'],
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white
                ),)
               ],
    ),
          ),
        ),
      ),
    );
  }
}
