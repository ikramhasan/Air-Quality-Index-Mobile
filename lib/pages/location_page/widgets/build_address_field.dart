import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../tab_page/tab_page.dart';
import 'package:get/get.dart';

buildAddressTextField({
  BuildContext context,
  TextEditingController controller,
  GlobalKey<ScaffoldState> scaffoldKey,
}) {
  return Container(
    height: 60.h,
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: EdgeInsets.all(8.h),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              child: TextField(
                controller: controller,
                style: GoogleFonts.faunaOne(),
                decoration: InputDecoration(
                  hintText: 'Enter Address',
                  contentPadding: EdgeInsets.all(8.h),
                  hintStyle: GoogleFonts.faunaOne(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Flexible(
            flex: 2,
            child: InkWell(
              onTap: () {
                if (controller.text.length < 2 ||
                    RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                        .hasMatch(controller.text)) {
                  Get.snackbar(
                    'Error',
                    'Enter a proper address',
                    snackPosition: SnackPosition.BOTTOM,
                    titleText: Text(
                      'Error',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    messageText: Text(
                      'Enter a proper address',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    margin: EdgeInsets.all(8),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.h),
                  color: Theme.of(context).canvasColor,
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
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
            ),
          ),
        ],
      ),
    ),
  );
}
