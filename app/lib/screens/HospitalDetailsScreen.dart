import 'package:app/state/details_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HospitalDetailsScreen extends StatefulWidget {
  static const routeName = "/hospitalsDetails-screen";
  const HospitalDetailsScreen({Key? key}) : super(key: key);
  // final HospitalsDataModel hospitalsList;
  // const HospitalDetailsScreen(this.hospitalsList);
  @override
  _HospitalDetailsScreenState createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
  bool isReadMore = false;
  bool isLiked = false;

  @override
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments;
    final hospitalData = Provider.of<DetailsState>(context)
        .singleHospitalData(int.parse(id.toString()));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          hospitalData.hospitalName.toString(),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 180.0,
                  color: Colors.red,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 20.0),
                      Hero(
                        tag: 'image',
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(
                              side: BorderSide(width: 1, color: Colors.black),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              // image: AssetImage('assets/xd.jpg'),
                              image: NetworkImage(
                                  hospitalData.hospitalImage.toString()),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                FontAwesomeIcons.locationArrow,
                                color: Colors.white,
                                size: 15.0,
                              ),
                              const SizedBox(width: 10.0),
                              SizedBox(
                                width: 200.0,
                                height: 50.0,
                                child: Center(
                                  child: Text(
                                    hospitalData.hospitalName.toString(),
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                FontAwesomeIcons.locationArrow,
                                color: Colors.white,
                                size: 15.0,
                              ),
                              SizedBox(width: 10.0),
                              SizedBox(
                                width: 200.0,
                                height: 50.0,
                                child: Text(
                                  '99999999',
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                FontAwesomeIcons.locationArrow,
                                color: Colors.white,
                                size: 15.0,
                              ),
                              const SizedBox(width: 10.0),
                              SizedBox(
                                width: 200.0,
                                height: 50.0,
                                child: Center(
                                  child: Text(
                                    hospitalData.hospitalName.toString(),
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 150.0,
                  right: 20.0,
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(width: 1, color: Colors.red),
                      ),
                      color: Colors.white,
                    ),
                    child:

                        //  LikeButton(
                        //   // onTap: (isLiked) async {
                        //   //   Provider.of<DetailsState>(context, listen: false)
                        //   //       .addLike(hospitalData.id!);
                        //   //   return !isLiked;
                        //   // },
                        //   size: 40.0,
                        //   circleColor: const CircleColor(
                        //       start: Colors.white, end: Colors.red),
                        //   bubblesColor: const BubblesColor(
                        //     dotPrimaryColor: Colors.red,
                        //     dotSecondaryColor: Colors.red,
                        //   ),
                        //   likeBuilder: (bool isliked) {
                        //     return hospitalData.like == false
                        //         ? const Icon(
                        //             Icons.favorite_border,
                        //             color: Colors.green,
                        //             size: 40.0,
                        //           )
                        //         : const Icon(
                        //             Icons.favorite,
                        //             color: Colors.blue,
                        //             size: 40.0,
                        //           );
                        //   },
                        // ),
                        Center(
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<DetailsState>(context, listen: false)
                              .addLike(hospitalData.id!);
                        },
                        child: Icon(
                          hospitalData.favourite!
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10.0),
            const Text(
              "About",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Text(
                    hospitalData.hospitalDetail.toString(),
                    textAlign: TextAlign.justify,
                    maxLines: isReadMore ? null : 5,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isReadMore = !isReadMore;
                        });
                      },
                      child: isReadMore
                          ? const Icon(Icons.keyboard_arrow_up, size: 25.0)
                          : const Icon(Icons.keyboard_arrow_down, size: 25.0)),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 200.0,
              color: Colors.grey[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '19',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 150.0,
                        child: Text(
                          'Total Doctors Available',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        '50+',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 150.0,
                        child: Text(
                          'Major Operations Available',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    child: VerticalDivider(
                      color: Colors.black,
                      // height: 10,
                      thickness: 1.5,
                      indent: 10,
                      endIndent: 0,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '150+',
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 150.0,
                        child: Text(
                          'Emergency room Available',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        '5',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 150.0,
                        child: Text(
                          'International Medical Operations',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
          ),
          onPressed: () {
            // _loginNow();
          },
          child: const Text(
            'BOOK AN APPOINTMENT',
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
