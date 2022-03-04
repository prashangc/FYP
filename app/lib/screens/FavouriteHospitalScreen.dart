import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/details_state.dart';
import '../widgets/AllFavHospitalsList.dart';

class FavouriteHospitals extends StatefulWidget {
  // final HospitalDataModel hospitalsData;
  // const FavouriteHospitals(this.hospitalsData);
  static const routeName = "/favouriteHospitals-screen";
  const FavouriteHospitals({Key? key}) : super(key: key);

  @override
  _FavouriteHospitalsState createState() => _FavouriteHospitalsState();
}

class _FavouriteHospitalsState extends State<FavouriteHospitals> {
  bool _init = true;
  bool _isLoading = false;

  int? i;
  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoading = await Provider.of<DetailsState>(context, listen: false)
          .addLike(i!.toInt());
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final hospitalLists = Provider.of<DetailsState>(context).hospitalsList;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Favourite Hospitals',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,

        // backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: hospitalLists!.length,
          itemBuilder: (ctx, i) {
            return AllFavHospitalsList(hospitalLists[i]);
          }),
    );
  }
}
