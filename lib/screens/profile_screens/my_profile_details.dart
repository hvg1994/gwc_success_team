import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import '../../utils/widgets.dart';

class MyProfileDetails extends StatefulWidget {
  const MyProfileDetails({Key? key}) : super(key: key);

  @override
  State<MyProfileDetails> createState() => _MyProfileDetailsState();
}

class _MyProfileDetailsState extends State<MyProfileDetails> {

  bool photoError = false;
  String profile = '';


  Future? getProfileDetails;

  bool isEdit = false;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if(mounted){
      super.setState(fn);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getProfileData();
  }


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
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
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

  profileTile(String heading, String title, {TextEditingController? controller}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: gTextColor,
              fontFamily: 'GothamBold',
              fontSize: 11.sp,
            ),
          ),
          (isEdit && controller!= null) ? Expanded(
            child: TextField(
              controller: controller,
              readOnly: !isEdit,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                isDense: true,
                // border: InputBorde,
              ),
              minLines: 1,
              maxLines: 1,
              // onSaved: (String value) {
              //   // This optional block of code can be used to run
              //   // code when the user saves the form.
              // },
              // validator: (value) {
              //   if(value!.isEmpty){
              //     return 'Name filed can\'t be empty';
              //   }
              // },
            ),
          ) :
          Text(
            title,
            style: TextStyle(
              color: gTextColor,
              fontFamily: 'GothamMedium',
              fontSize: 10.sp,
            ),
          ),

        ],
      ),
    );
  }


  // final UserProfileRepository repository = UserProfileRepository(
  //   apiClient: ApiClient(
  //     httpClient: http.Client(),
  //   ),
  // );

}
