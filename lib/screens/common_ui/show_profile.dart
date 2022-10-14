import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants.dart';
import '../../utils/widgets.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({Key? key}) : super(key: key);

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                SizedBox(height: 3.h),
                Text(
                  "My Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "GothamRoundedBold_21016",
                      color: gPrimaryColor,
                      fontSize: 12.sp),
                ),
                SingleChildScrollView(
                    child: Container(
                      height: 85.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)
                          )
                      ),
                      child: Column(
                        children: [
                          Image.asset("name",
                            height: 20.h,
                            width: double.maxFinite,
                          ),
                          Container(
                            height: 66.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)
                                ),
                                border: Border.all(
                                    width: 1,
                                    color: gMainColor
                                )
                            ),
                            child: Column(
                              children: [
                                profileTile("Name: ", "Gut-wellness Club"),

                                profileTile("Age: ", "34"),
                                Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                profileTile("Gender: ", "Female"),
                                Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                profileTile("Email: ", "gutwellnessclub.com"),
                                Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                profileTile("Mobile Number: ", "1234567890"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  profileTile(String heading, String title, {bool showViewText = false, String? viewText}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: gMainColor,
              fontFamily: 'GothamBold',
              fontSize: 11.sp,
            ),
          ),
          (!showViewText) ?
          Text(
            title,
            style: TextStyle(
              color: gPrimaryColor,
              fontFamily: 'GothamMedium',
              fontSize: 10.5.sp,
            ),
          ) : RichText(
            text: TextSpan(
                text: title,
                style: TextStyle(
                    fontFamily: "GothamBold",
                    color: gMainColor,
                    fontSize: 10.sp
                ),
                children: [
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      fontFamily: "GothamBold",
                    ),
                  ),
                  TextSpan(
                    text: viewText,
                    style: TextStyle(
                      fontFamily: "GothamBold",
                      color: gMainColor,
                      fontSize: 10.sp,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      print('Tap Here onTap');
                    },

                  )
                ]
            ),
          ),

        ],
      ),
    );
  }


}
