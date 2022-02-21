import 'package:flutter/material.dart';

import '../model/HospitalsDataModel.dart';
import '../screens/HospitalDetailsScreen.dart';

class AllHospitalsCircularList extends StatefulWidget {
  final HospitalsDataModel hospitalsData;
  const AllHospitalsCircularList(this.hospitalsData);

  @override
  _AllHospitalsCircularListState createState() =>
      _AllHospitalsCircularListState();
}

class _AllHospitalsCircularListState extends State<AllHospitalsCircularList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      // color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 20.0, 12.0),
        child: SizedBox(
          width: 70.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                      HospitalDetailsScreen.routeName,
                      arguments: widget.hospitalsData.id!);
                },
                child: Hero(
                  tag: 'image',
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                        widget.hospitalsData.hospitalImage.toString()),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        HospitalDetailsScreen.routeName,
                        arguments: widget.hospitalsData.id!);
                  },
                  child: Text(
                    "${widget.hospitalsData.hospitalName.toString().substring(0, 6)}...",
                    // "${snapshot.data![index]['hospital_name'].substring(0, 6)}...",
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
