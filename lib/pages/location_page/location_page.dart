import 'package:aqi/pages/location_page/widgets/build_address_field.dart';
import 'package:aqi/pages/location_page/widgets/build_current_location_button.dart';
import 'package:aqi/pages/location_page/widgets/build_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
                    buildAddressTextField(
                      context: context,
                      controller: controller,
                      scaffoldKey: _scaffoldKey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'To get the most accurate reading of your current air quality index, we recommend entering your exact location.',
                      style: GoogleFonts.faunaOne(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            buildSideBar(),
          ],
        ),
      ),
    );
  }
}
