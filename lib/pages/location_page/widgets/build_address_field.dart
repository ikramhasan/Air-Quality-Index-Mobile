import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../tab_page/tab_page.dart';

buildAddressTextField({
  BuildContext context,
  TextEditingController controller,
  GlobalKey<ScaffoldState> scaffoldKey,
}) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
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
                  hintStyle: GoogleFonts.faunaOne()),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              if (controller.text.length < 2 ||
                  RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                      .hasMatch(controller.text)) {
                scaffoldKey.currentState.showSnackBar(
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
