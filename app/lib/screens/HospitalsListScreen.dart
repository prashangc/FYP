import 'package:app/widgets/AllHospitalsListOfEvenIndex.dart';
import 'package:app/widgets/AllHospitalsListOfOddIndex.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/details_state.dart';

class HospitalsListScreen extends StatefulWidget {
  static const routeName = "/hospitalsList-screen";
  const HospitalsListScreen({Key? key}) : super(key: key);

  @override
  _HospitalsListScreenState createState() => _HospitalsListScreenState();
}

class _HospitalsListScreenState extends State<HospitalsListScreen> {
  bool _init = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoading = await Provider.of<DetailsState>(context, listen: false)
          .getHospitalsDataByProvider();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  // DetailsState APIData = DetailsState();
  @override
  Widget build(BuildContext context) {
    final hospitalLists = Provider.of<DetailsState>(context).hospitalsList;

    // final hospitalsData =
    //     Provider.of<HospitalsDataModel>(context, listen: false);
    if (_isLoading == false || hospitalLists == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Hospitals'),
          elevation: 0.0,
          // backgroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: hospitalLists.length,
            itemBuilder: (ctx, i) {
              return i.isEven
                  ? AllHospitalsListOfEvenIndex(hospitalLists[i])
                  : AllHospitalsListOfOddIndex(hospitalLists[i]);
            }),
      );
    }
  }
}
