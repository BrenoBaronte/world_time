import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseRegion extends StatefulWidget {
  @override
  _ChooseRegionState createState() => _ChooseRegionState();
}

class _ChooseRegionState extends State<ChooseRegion> {
  List<String> regions = [
    'America',
    'Asia',
    'Africa',
    'Atlantic',
    'Australia',
    'Europe',
    'Indian',
    'Pacific',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Region'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: regions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () async {
                  var locationsRegions =
                      await WorldTime().getLocationsRegions(regions[index]);
                  print(locationsRegions);
                  Navigator.pushReplacementNamed(context, '/location',
                      arguments: {
                        'locations': locationsRegions,
                      });
                },
                title: Text(regions[index]),
//                leading: CircleAvatar(
//                  backgroundColor: Colors.blueGrey,
//                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
