import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

// services/world_time.dart
class WorldTime {
  String location; // Location name for the UI
  String? time; // The time in that location
  String flag; // URL to an asset flag icon
  String url; // Location URL for API endpoint

  bool isDayTime = false;

  WorldTime({required this.location, this.time, required this.flag, required this.url, });

  Future<void> getTime() async {
    try {
      Uri apiUrl = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(apiUrl);

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        // Проверка на наличие и тип полей
        if (data.containsKey('datetime') && data['datetime'] is String &&
            data.containsKey('utc_offset') && data['utc_offset'] is String) {
          String datetime = data['datetime'];
          String offset = data['utc_offset'].substring(1, 3);

          DateTime now = DateTime.parse(datetime);
          now = now.add(Duration(hours: int.parse(offset)));

          // time = now.toString();

          isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
          time = DateFormat.jm().format(now);



        } else {
          print('Unexpected data format');
        }
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}