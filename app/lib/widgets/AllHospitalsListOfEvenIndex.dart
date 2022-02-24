import 'package:app/model/HospitalsDataModel.dart';
import 'package:flutter/material.dart';

import '../screens/HospitalDetailsScreen.dart';

class AllHospitalsListOfEvenIndex extends StatefulWidget {
  final HospitalDataModel hospitalsData;
  const AllHospitalsListOfEvenIndex(this.hospitalsData);
  @override
  _AllHospitalsListOfEvenIndexState createState() =>
      _AllHospitalsListOfEvenIndexState();
}

class _AllHospitalsListOfEvenIndexState
    extends State<AllHospitalsListOfEvenIndex> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        width: 70.0,
        child: Column(
          children: [
            const SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ExpansionPanelList.radio(
                dividerColor: Colors.green,
                expansionCallback: (panelIndex, isExpanded) {},
                // elevation: 1.0,
                animationDuration: const Duration(milliseconds: 500),
                children: [
                  ExpansionPanelRadio(
                    value: Null,
                    // isExpanded: _expanded,
                    canTapOnHeader: true,
                    // backgroundColor: Colors.red,
                    headerBuilder: (context, isExpanded) {
                      return SizedBox(
                        height: 100.0,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Hero(
                                tag: 'image',
                                child: Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      // image: AssetImage('assets/xd.jpg'),
                                      image: NetworkImage(widget
                                          .hospitalsData.hospitalImage
                                          .toString()),
                                      alignment: Alignment.center,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 18.0,
                            ),
                            SizedBox(
                              width: 160.0,
                              height: 100.0,
                              child: Center(
                                child: Text(
                                  widget.hospitalsData.hospitalName.toString(),
                                  // APIdata[i].hospitalName.toString(),
                                  // '${snapshot.data![index]['hospital_name'].substring(0, 12)}...',
                                  // snapshot.data![index]
                                  //     ['hospital_name'],
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    body: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 5, 5, 10),
                          child: Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment
                            //         .spaceBetween,
                            children: [
                              Text(
                                '${widget.hospitalsData.hospitalDetail.toString().substring(0, 200)}...',
                                // '${APIdata[i].hospitalDetail.toString().substring(0, 200)}...',
                                // '${snapshot.data![index]['hospital_detail'].substring(0, 200)}...',
                                style: const TextStyle(fontSize: 18.0),
                              ),
                              const SizedBox(height: 18.0),
                              SizedBox(
                                width: 150.0,
                                height: 40.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    padding: const EdgeInsets.all(8.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        HospitalDetailsScreen.routeName,
                                        arguments: widget.hospitalsData.id!);
                                  },
                                  child: const Text(
                                    'MORE',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
