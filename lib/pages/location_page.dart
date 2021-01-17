import 'package:aqi/pages/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:aqi/repositories/location_service.dart';

class LocationPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  buildCurrentLocationButton(BuildContext context) {
    return InkWell(
      onTap: () async {
        LocationData location = await getCurrentLocation();
        if (location != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TabPage(
                location: location,
              ),
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.place),
              ),
              SizedBox(width: 30),
              Text(
                'Get Current Location',
                style: GoogleFonts.faunaOne(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAddressTextField(
      BuildContext context, TextEditingController controller) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 210,
              child: TextField(
                controller: controller,
                style: GoogleFonts.faunaOne(),
                decoration: InputDecoration(
                  hintText: 'Enter Address',
                  contentPadding: EdgeInsets.all(8),
                  hintStyle: GoogleFonts.faunaOne()
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                if (controller.text.length < 2 ||
                    RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                        .hasMatch(controller.text)) {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text('Enter proper location'),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TabPage(
                        placeName: controller.text,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).canvasColor,
                ),
                child: Center(
                  child: Text(
                    'GO',
                    style: GoogleFonts.faunaOne(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 34),
              child: Container(
                width: 310,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    Image.asset('assets/images/pollution.png'),
                    SizedBox(height: 60),
                    Text(
                      'Where are you? ',
                      style: GoogleFonts.faunaOne(
                          color: Colors.black, fontSize: 24),
                    ),
                    SizedBox(height: 16),
                    buildCurrentLocationButton(context),
                    SizedBox(height: 16),
                    buildAddressTextField(context, controller),
                    SizedBox(height: 16),
                    Text(
                      'To get the most accurate reading of your current air quality index, we recommend entering your exact location.',
                      style: GoogleFonts.faunaOne(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 50,
              height: 800,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Air Quality Index',
                      style: GoogleFonts.faunaOne(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
