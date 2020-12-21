import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'component.dart';
import 'package:google_fonts/google_fonts.dart';

class Mobile extends StatefulWidget {
  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  ScrollController controller = ScrollController();
  bool changeCard = true;
  Variables variables = new Variables();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      print(controller.offset);

      if (controller.offset > 400) {
        changeCard = false;
      } else
        changeCard = true;

      print(changeCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //final double categoryHeight = size.height;
    final double categoryWidth = size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    ListTile list(String text) {
      return ListTile(
          title: Card(
            child: Text(
              '$text',
              textAlign: TextAlign.center,
              style: GoogleFonts.oswald(fontSize: 30, color: Colors.white),
            ),
            color: Colors.black,
          ),
          onTap: () {
            // Update the state of the app.
            Navigator.pop(context);
          });
    }

    return MaterialApp(
      home: Scaffold(
        drawer: new Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Image(
                  height: 300,
                  image: AssetImage('images/circle-cropped.png'),
                ),
              ),
              list("LifeStyle"),
              list("Cafe"),
              list("Contact"),
              list("Team"),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.call),
                    Icon(Icons.alternate_email_outlined),
                    Icon(Icons.message_outlined)
                  ],
                ),
              )
            ],
          ),
        ),
        key: _scaffoldKey,
        body: NestedScrollView(
          controller: controller,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: new IconButton(
                  padding: EdgeInsets.only(top: 0, left: 7),
                  color: Colors.black,
                  icon: new Icon(
                    Icons.menu,
                    size: 40,
                  ),
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                ),
                backgroundColor: Colors.white,
                expandedHeight: 500.0,
                floating: false,
                pinned: true,
                //responsive flexible spaceBar
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(bottom: changeCard? 7:2),
                  centerTitle: false,
                  title:
                      //changeCard?
                      Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: changeCard
                          ? categoryWidth / 2.3
                          : categoryWidth / 3.2,
                      child: variables.cards(
                          changeCard ? categoryWidth / 13 : categoryWidth / 19,
                          Colors.white,
                          "Krala Murnau",
                          Colors.black),
                    ),
                  ),
                  // : Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Container(
                  //       child: variables.cards(categoryWidth / 19,
                  //           Colors.white, "Krala Murnau", Colors.black),
                  //     ),
                  //   ),
                  background: CarouselSlider(
                      items: Variables().item,
                      options: CarouselOptions(
                        height: categoryWidth,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.911,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.easeInOutSine,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
              ),
            ];
          },
          body: Text("Hello"),
        ),
      ),
    );
  }
}
