import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../model/dashboard_model/calendar_model.dart';
import '../../utils/constants.dart';
import '../../utils/widgets.dart';
import 'consultation_pending_screen.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  List doctorDetails = [
    {
      "title": "Consultations",
      "image": "assets/images/Group 3009.png",
      "id": "1",
    },
    {
      "title": "Meal Plans",
      "image": "assets/images/Group 3007.png",
      "id": "2",
    },
    {
      "title": "Active",
      "image": "assets/images/Group 3011.png",
      "id": "3",
    },
    {
      "title": "Post Programs",
      "image": "assets/images/Group 3013.png",
      "id": "4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
              child: const Image(
                image: AssetImage("assets/images/Gut wellness logo green.png"),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Text(
                "Hi, Welcome back Dr.Lorem Ipsum",
                style: TextStyle(
                    fontFamily: "GothamMedium",
                    color: gTextColor,
                    fontSize: 12.sp),
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(child: buildCalender()),
            buildDetails(),
            SizedBox(height: 1.h)
          ],
        ),
      ),
    );
  }

  buildCalender() {
    return SfCalendar(
      view: CalendarView.week,
      dataSource: MeetingDataSource(_getDataSource()),
      headerStyle: CalendarHeaderStyle(
        textAlign: TextAlign.center,
        textStyle: TextStyle(
          fontFamily: "GothamMedium",
          color: gTextColor,
          fontSize: 12.sp,
        ),
      ),
      viewHeaderStyle: ViewHeaderStyle(
        dayTextStyle: TextStyle(
          fontFamily: "GothamBold",
          color: gTextColor,
          fontSize: 10.sp,
        ),
        dateTextStyle: TextStyle(
          fontFamily: "GothamBook",
          color: gTextColor,
          fontSize: 10.sp,
        ),
      ),
      todayHighlightColor: gSecondaryColor,
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
   meetings.add(Meeting('conference', startTime, endTime, gPrimaryColor, false));
    return meetings;
  }

  buildDetails() {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          mainAxisExtent: 6.h,
        ),
        itemCount: doctorDetails.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (doctorDetails[index]["id"] == "1") {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ct) => const ConsultationPendingScreen(),
                  ),
                );
              } else if (doctorDetails[index]["id"] == "2") {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (ct) => const MealPlansScreen(),
                //   ),
                // );
              } else if (doctorDetails[index]["id"] == "3") {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (ct) => const ActiveScreen(),
                //   ),
                // );
              } else if (doctorDetails[index]["id"] == "4") {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (ct) => const PostProgramsScreen(),
                //   ),
                // );
              }
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: gPrimaryColor,
                  border: Border.all(color: gMainColor, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(2, 6),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 3.h,
                      image: AssetImage(doctorDetails[index]["image"]),
                      color: gMainColor,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      doctorDetails[index]["title"],
                      style: TextStyle(
                        fontFamily: "GothamMedium",
                        color: gMainColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
