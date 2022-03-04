import 'package:app/screens/EnterSymptomsScreen.dart';
import 'package:app/screens/HospitalsListScreen.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../state/details_state.dart';
import '../widgets/AllHospitalsCircularList.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  int activeIndex = 0;
  DetailsState APIData = DetailsState();

  @override
  Widget build(BuildContext context) {
    final hospitalLists = Provider.of<DetailsState>(context).hospitalsList;
    if (_isLoading == false || hospitalLists == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(FontAwesomeIcons.solidBell),
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 30.0,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Container(
              width: 250.0,
              height: 80.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/digital_doctor.png'),
                  // image: NetworkImage(snapshot.data![index]['hospital_image']),
                  alignment: Alignment.center,
                ),
              ),

              // child: Image.asset(
              //   'assets/logo.jpg',
              //   width: double.infinity,
              //   height: 140.0,
              // ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 20.0),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnterSymptomsScreen())),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.infinity,
                  height: 60.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.7,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Search by Symptoms",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Color.fromARGB(255, 124, 123, 123),
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.search,
                        color: Color.fromARGB(255, 124, 123, 123),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 190.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.7,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 0.0),
                          child: Text(
                            'Hospitals',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                letterSpacing: 0.5,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0.0),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: hospitalLists.length,
                                itemBuilder: (ctx, i) {
                                  return AllHospitalsCircularList(
                                      hospitalLists[i]);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 73.0,
                    top: 165.0,
                    child: SizedBox(
                      width: 220.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HospitalsListScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'VIEW MORE',
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Icon(FontAwesomeIcons.arrowRight),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              child: FutureBuilder<List>(
                future: APIData.getMedicalNewsImages(),
                builder: (context, snapshot) {
                  // print(snapshot.data);
                  var actualImages = snapshot.data!;
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                              height: 200.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              viewportFraction: 0.8,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeIndex = index;
                                });
                              }),
                          itemCount: actualImages.length,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    actualImages[index]['pictures'].toString(),
                                  ),
                                  fit: BoxFit.fill,

                                  // width: double.infinity,
                                  // height: double.infinity,
                                  // fit: BoxFit.fill,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedSmoothIndicator(
                              activeIndex: activeIndex,
                              count: snapshot.data!.length,
                              effect: const ExpandingDotsEffect(
                                activeDotColor: Colors.indigo,
                                dotColor: Colors.grey,
                                dotWidth: 8.0,
                                dotHeight: 8.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'No Images found for image slider',
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // currentIndex: _currentIndex,
        // onTap: (index) => setState(() {
        //   _currentIndex = index;
        // }),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.red,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 35.0,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(FontAwesomeIcons.phoneAlt),
          ),
          BottomNavigationBarItem(
            label: 'Programs',
            icon: Icon(FontAwesomeIcons.searchLocation),
          ),
          BottomNavigationBarItem(
            label: 'Blog-Feeds',
            icon: Icon(FontAwesomeIcons.mailBulk),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            label: 'Notifications',
            icon: Icon(FontAwesomeIcons.bell),
          )
        ],
      ),
    );
  }
}
