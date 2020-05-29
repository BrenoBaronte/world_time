import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation2 extends StatefulWidget {
  @override
  _ChooseLocation2State createState() => _ChooseLocation2State();
}

class _ChooseLocation2State extends State<ChooseLocation2>{

  Map data = {};

  @override
  Widget build(BuildContext context){

    print('ssssssssssssssssssssssssssssssss');

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    List<String> locations = data['locations'];

    print('locations:');
    print(locations);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  //updateTime(index);
                },
                title: Text(locations[index]),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}