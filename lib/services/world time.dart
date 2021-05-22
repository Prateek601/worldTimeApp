import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {

  String location;
  String time;
  String url;
  String flag;
  bool isDaytime;

  WorldTime({this.location,this.url,this.flag});

  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get the properties
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(0, 3);
      String offset2 = data['utc_offset'].substring(4,6);
      print(datetime);
      print(offset1);
      print(offset2);

      DateTime now = DateTime.parse(datetime);
      print(now);
      now = now.add(Duration(hours: int.parse(offset1),minutes: int.parse(offset2)));
      print(now);

      isDaytime = now.hour>6 && now.hour<18 ? true : false;

      time = DateFormat.jm().format(now);
      print(time);
    }


    catch (e) {
      print('this is error: $e');
      time = '00:00:00';
    }
  }


}