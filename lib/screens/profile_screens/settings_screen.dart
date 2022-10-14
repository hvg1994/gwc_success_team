import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gwc_success_team/screens/auth/login_screen.dart';
import 'package:gwc_success_team/screens/profile_screens/terms_conditions_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../../utils/widgets.dart';
import 'faq_screen.dart';
import 'my_profile_details.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // final SharedPreferences _pref = AppConfig().preferences!;

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
                  "My Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'GothamRoundedBold_21016',
                      color: gPrimaryColor,
                      fontSize: 12.sp),
                ),
                ListTile(
                  leading: CircleAvatar(),
                  title: Text(
                    'Loreum Ipsum',
                    style: TextStyle(
                      color: kTextColor,
                      fontFamily: 'GothamBook',
                      fontSize: 11.sp,
                    ),
                  ),
                  subtitle: Text(
                    'Bangalore, India',
                    style: TextStyle(
                      color: kTextColor,
                      fontFamily: 'GothamMedium',
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                profileTile("assets/images/Group 2753.png", "My Profile", () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const MyProfileDetails(),
                  //   ),
                  // );
                }),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                profileTile("assets/images/Group 2747.png", "FAQ", () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FaqScreen(),
                    ),
                  );
                }),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                profileTile(
                    "assets/images/Group 2748.png", "Terms & Conditions", () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TermsConditionsScreen(),
                    ),
                  );
                }),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                profileTile("assets/images/Group 2744.png", "Logout", () {
                  // logOut();

                  // _pref.setBool(AppConfig.isLogin, false);
                  // _pref.remove(AppConfig().BEARER_TOKEN);
                  // Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(
                  //       builder: (context) => const ExistingUser(),
                  //     ));
                }),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  profileTile(String image, String title, func) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
      child: InkWell(
        onTap: func,
        child: Row(
          children: [
            Image(
              image: AssetImage(image),
              height: 4.h,
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              title,
              style: TextStyle(
                color: kTextColor,
                fontFamily: 'GothamBook',
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // final LoginOtpRepository repository = LoginOtpRepository(
  //   apiClient: ApiClient(
  //     httpClient: http.Client(),
  //   ),
  // );

  // void logOut() async{
  //   final res = await LoginWithOtpService(repository: repository).logoutService();
  //
  //   if(res.runtimeType == LogoutModel){
  //     _pref.setBool(AppConfig.isLogin, false);
  //     _pref.remove(AppConfig().BEARER_TOKEN);
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (context) => const ExistingUser(),
  //         ));
  //   }
  //   else{
  //     ErrorModel model = res as ErrorModel;
  //     AppConfig().showSnackbar(context, model.message!, isError:  true);
  //   }
  // }

  void logoutDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      barrierColor: gWhiteColor.withOpacity(0.8),
      context: context,
      builder: (context) => Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          decoration: BoxDecoration(
            color: gWhiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: gMainColor, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Log Out ?",
                style: TextStyle(
                  color: gTextColor,
                  fontFamily: "GothamMedium",
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(height: 2.h),
              Text('Are you sure you want to log out?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "GothamBook",
                    color: gTextColor,
                    fontSize: 11.sp,
                  )),
              SizedBox(height: 2.5.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(false),
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 9.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          color: gWhiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: gMainColor),
                        ),
                        child: Text("Cancel",
                            style: TextStyle(
                              color: gPrimaryColor,
                              fontFamily: "GothamMedium",
                              fontSize: 9.sp,
                            ))),
                  ),
                  SizedBox(width: 3.w),
                  GestureDetector(
                    onTap: () async {
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      Get.offAll(const LoginScreen());
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 9.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          color: gPrimaryColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: gMainColor),
                        ),
                        child: Text("Log Out",
                            style: TextStyle(
                              color: gMainColor,
                              fontFamily: "GothamMedium",
                              fontSize: 9.sp,
                            ))),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
