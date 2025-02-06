import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StationScheduleTimeSlotsCtrl extends GetxController{


  TextEditingController editScheduleDate = TextEditingController(text: '25/09/2025');
  TextEditingController scheduleDate = TextEditingController();

List<ScheduleTimeSlot> timeScheduleList = [
  ScheduleTimeSlot(day: 'Sunday',startTime: '18:50',endTime: '6:32'),
  ScheduleTimeSlot(day: 'Sunday',startTime: '04:32',endTime: '20:00'),
  ScheduleTimeSlot(day: 'Sunday',startTime: '10:00',endTime: '22:00'),
];



  String convertTo12HourFormat(String time) {
    // Parse the time string into a DateTime object
    DateTime dateTime = DateFormat("HH:mm").parse(time);
    // Format it into a 12-hour format with AM/PM
    return DateFormat.jm().format(dateTime);
  }


  // get hours and minute


}

class ScheduleTimeSlot{
  String? day;
  String? startTime;
  String? endTime;

  ScheduleTimeSlot({this.day,this.startTime,this.endTime});
}