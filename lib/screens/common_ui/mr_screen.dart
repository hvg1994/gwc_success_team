import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../utils/constants.dart';
import '../../utils/widgets.dart';


class MRScreen extends StatefulWidget {
  const MRScreen({Key? key}) : super(key: key);

  @override
  State<MRScreen> createState() => _MRScreenState();
}

class _MRScreenState extends State<MRScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppBar(() {
                  Navigator.pop(context);
                }),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "MR Report",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'GothamRoundedBold_21016',
                      color: gPrimaryColor,
                      fontSize: 12.sp),
                ),
                SfPdfViewer.network("src")
              ],
            ),
          ),
        ),
      ),
    );
  }

}
