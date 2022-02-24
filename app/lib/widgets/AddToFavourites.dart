import 'package:app/state/details_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/HospitalsDataModel.dart';

class AddToFavourites extends StatefulWidget {
  final HospitalDataModel hospitalsData;
  const AddToFavourites(this.hospitalsData);
  @override
  _AddToFavouritesState createState() => _AddToFavouritesState();
}

class _AddToFavouritesState extends State<AddToFavourites> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments;
    final hospitalData = Provider.of<DetailsState>(context)
        .singleHospitalData(int.parse(id.toString()));

    return const SingleChildScrollView(
      child: Icon(
        Icons.favorite,
        // hospitalData.like! ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}
