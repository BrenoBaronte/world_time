import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  static const String baseUrl = 'https://worldtimeapi.org/api';

  String location; // location name for the UI
  String time; // time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDayTime; // true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<List<String>> getLocationsRegions(String region) async {

    try {
      List<String> result = [];

      // make the request
      Response response = await get('$baseUrl/timezone/$region');

      List<dynamic> data = jsonDecode(response.body);

      for (var i = 0; i < data.length; i++) {
        result.add(data[i]);
      }

      return result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> getTime() async {
    try {
      // make the request
      Response response = await get('$baseUrl/timezone/$url');
      _mapTimeResponse(response);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }

  Future<void> getCurrentTime() async {
    try {
      // make the request
      Response response = await get('$baseUrl/ip');
      _mapTimeResponse(response);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }

  void _mapTimeResponse(Response response) {
    Map data = jsonDecode(response.body);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(0, 3);
    String timezone = data['timezone'];

    var index = timezone.indexOf('/') + 1;
    location = timezone
        .substring(index)
        .replaceAll('_', ' ')
        .replaceAll('/', ' - ');
    

    // create datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    // set the time property
    isDayTime = now.hour > 6
        && now.hour < 19
        ? true
        : false;

    time = DateFormat.jm().format(now);
  }
}