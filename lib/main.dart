import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/counter.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
              //body1: TextStyle(color: kBodyTextColor),
              )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/maggots.JPG",
              textTop: "Pakan Ternak",
              textBottom: "MAGGOT",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text(
                  //   "Symptoms",
                  //   style: kTitleTextstyle,
                  // ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/catalog.png",
                          title: "Catalog",
                          isActive: true,
                        ),
                        SymptomCard(
                          image: "assets/images/qr code.jpg",
                          title: "Scan QR-Code", 
                        ),
                        SymptomCard(
                          image: "assets/images/history.png",
                          title: "History",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Description", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  PreventCard(
                    text:
                        "Maggot yang merupakan larva lalat Black Soldier Fly (BSF) memang sangat istimewa dibandingkan bahan baku pakan alternatif lainnya karena mengandung nutrien yang lengkap untuk ikan dan kualitas yang baik.",
                    image: "assets/images/info.jpg",
                    title: "Maggot",
                  ),
                  // PreventCard(
                  //   text:
                  //       "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                  //   image: "assets/images/wash_hands.png",
                  //   title: "Wash your hands",
                  // ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key? key,
    required this.image,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SingleChildScrollView(
  //       controller: controller,
  //       child: Column(
  //         children: <Widget>[
  //           MyHeader(
  //             image: "assets/icons/Drcorona.svg",
  //             textTop: "All you need",
  //             textBottom: "is stay at home.",
  //             offset: offset,
  //           ),
  //           Container(
  //             margin: EdgeInsets.symmetric(horizontal: 20),
  //             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //             height: 60,
  //             width: double.infinity,
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(25),
  //               border: Border.all(
  //                 color: Color(0xFFE5E5E5),
  //               ),
  //             ),
  //             child: Row(
  //               children: <Widget>[
  //                 SvgPicture.asset("assets/icons/maps-and-flags.svg"),
  //                 SizedBox(width: 20),
  //                 Expanded(
  //                   child: DropdownButton(
  //                     isExpanded: true,
  //                     underline: SizedBox(),
  //                     icon: SvgPicture.asset("assets/icons/dropdown.svg"),
  //                     value: "Indonesia",
  //                     items: [
  //                       'Indonesia',
  //                       'Bangladesh',
  //                       'United States',
  //                       'Japan'
  //                     ].map<DropdownMenuItem<String>>((String value) {
  //                       return DropdownMenuItem<String>(
  //                         value: value,
  //                         child: Text(value),
  //                       );
  //                     }).toList(),
  //                     onChanged: (value) {},
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SizedBox(height: 20),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 20),
  //             child: Column(
  //               children: <Widget>[
  //                 Row(
  //                   children: <Widget>[
  //                     RichText(
  //                       text: TextSpan(
  //                         children: [
  //                           TextSpan(
  //                             text: "Case Update\n",
  //                             style: kTitleTextstyle,
  //                           ),
  //                           TextSpan(
  //                             text: "Newest update March 28",
  //                             style: TextStyle(
  //                               color: kTextLightColor,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     Spacer(),
  //                     Text(
  //                       "See details",
  //                       style: TextStyle(
  //                         color: kPrimaryColor,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(height: 20),
  //                 Container(
  //                   padding: EdgeInsets.all(20),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(20),
  //                     color: Colors.white,
  //                     boxShadow: [
  //                       BoxShadow(
  //                         offset: Offset(0, 4),
  //                         blurRadius: 30,
  //                         color: kShadowColor,
  //                       ),
  //                     ],
  //                   ),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: <Widget>[
  //                       Counter(
  //                         color: kInfectedColor,
  //                         number: 1046,
  //                         title: "Infected",
  //                       ),
  //                       Counter(
  //                         color: kDeathColor,
  //                         number: 87,
  //                         title: "Deaths",
  //                       ),
  //                       Counter(
  //                         color: kRecovercolor,
  //                         number: 46,
  //                         title: "Recovered",
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 SizedBox(height: 20),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     Text(
  //                       "Spread of Virus",
  //                       style: kTitleTextstyle,
  //                     ),
  //                     Text(
  //                       "See details",
  //                       style: TextStyle(
  //                         color: kPrimaryColor,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Container(
  //                   margin: EdgeInsets.only(top: 20),
  //                   padding: EdgeInsets.all(20),
  //                   height: 178,
  //                   width: double.infinity,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(20),
  //                     color: Colors.white,
  //                     boxShadow: [
  //                       BoxShadow(
  //                         offset: Offset(0, 10),
  //                         blurRadius: 30,
  //                         color: kShadowColor,
  //                       ),
  //                     ],
  //                   ),
  //                   child: Image.asset(
  //                     "assets/images/map.png",
  //                     fit: BoxFit.contain,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
  // }
}
