// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

var fcmtoken = "";

String? _bearerToken;
  // Rachna (rachna.g@catenate.io) token
  // = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJtaXJhbWlyYS1sYWN4diIsImlhdCI6IjE2ODI5MjM5ODkiLCJzdWIiOiI2NDM3ZDFiODY1MjZiNTkzZTU0YzRkOTcifQ.JqsNWhVsaTvRb-o6Nsdi2uqHvIPSpyz_W_pXlClNcek";

String? get bearerToken => _bearerToken;

set bearerToken(String? newValue) {
  _bearerToken = newValue;
}

String? _userId;
  // = "rachgupta24@gmail.com";

String? get userId => _userId;

set userId(String? newValue) {
  _userId = newValue;
}

BuildContext? _globalBuildContext;

BuildContext? get globalBuildContext => _globalBuildContext;

set globalBuildContext(BuildContext? newValue) {
  _globalBuildContext = newValue;
}

void log(dynamic data) {
    print(data.toString());
  // print("${DateTime.now()}: ${data.toString()}");
  // dev.log("${DateTime.now()}: ${data.toString()}", time: DateTime.now());
  // dev.log(data.toString(), time: DateTime.now());
}

double kDefaultChildAspectRatio(BuildContext context) => MediaQuery.of(context).size.width * 0.0017;

bool isMobileView(BuildContext context) {
  return MediaQuery.of(context).size.width < 1100;
}

bool isCenterView(BuildContext context) {
  return MediaQuery.of(context).size.width > 680;
}

bool isDesktopWeb(BuildContext context) {
  // return kIsWeb && defaultTargetPlatform != TargetPlatform.android && defaultTargetPlatform != TargetPlatform.iOS;
  return kIsWeb && MediaQuery.of(context).size.width > 1100;
}

bool get isMobileWeb {
  return kIsWeb && (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS);
}

int getColorCode(String color){
 return  int.parse(color.replaceAll("#", "0xff"));
}

pushReplacement(BuildContext context, Widget destination) {
  Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => destination,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ));
}

push(BuildContext context, Widget destination) {
  Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => destination,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ));
}

pop(BuildContext context) {
  Navigator.pop(context);
}

void commonToast(BuildContext context, String msg) {
  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //   content: Text(msg, style: TextStyle(color: Colors.white),),
  //   backgroundColor: primary.withOpacity(0.6),
  // ));
  Fluttertoast.showToast(toastLength: Toast.LENGTH_LONG,
      msg: msg, backgroundColor: Colors.black, textColor: Colors.white);
}

void commonToastWithoutContext(String msg) {
  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //   content: Text(msg, style: TextStyle(color: Colors.white),),
  //   backgroundColor: primary.withOpacity(0.6),
  // ));
  Fluttertoast.showToast(toastLength: Toast.LENGTH_LONG,
      msg: msg, backgroundColor: Colors.black, textColor: Colors.white);
}

String formatDateFromString(String dateTime) {
  final _formattedDate = (dateTime.substring(0,2) +
    (dateTime.substring(3,5) == "01" ? " Jan " :
    dateTime.substring(3,5) == "02" ? " Feb " :
    dateTime.substring(3,5) == "03" ? " Mar " :
    dateTime.substring(3,5) == "04" ? " Apr " :
    dateTime.substring(3,5) == "05" ? " May " :
    dateTime.substring(3,5) == "06" ? " Jun " :
    dateTime.substring(3,5) == "07" ? " Jul " :
    dateTime.substring(3,5) == "08" ? " Aug " :
    dateTime.substring(3,5) == "09" ? " Sep " :
    dateTime.substring(3,5) == "10" ? " Oct " :
    dateTime.substring(3,5) == "11" ? " Nov " :
    " Dec ")
    + dateTime.substring(6,10)+", "+
    //DateFormat('hh:mm a').parse(provider.skillCardList[index].resultdateTime.substring(10)).toString(),
    (dateTime.substring(10,13).contains("01")
        || dateTime.substring(10,13).contains("02")
        || dateTime.substring(10,13).contains("03")
        || dateTime.substring(10,13).contains("04")
        || dateTime.substring(10,13).contains("05")
        || dateTime.substring(10,13).contains("06")
        || dateTime.substring(10,13).contains("07")
        || dateTime.substring(10,13).contains("08")
        || dateTime.substring(10,13).contains("09")
        || dateTime.substring(10,13).contains("10")
        || dateTime.substring(10,13).contains("11")
        || dateTime.substring(10,13).contains("12")
        ? (dateTime.substring(10)+" AM")
        :
    (
        dateTime.substring(10,13).contains("13") ?
        ("01:"+(dateTime.substring(14)+" PM")) :
        dateTime.substring(10,13).contains("14") ?
        ("02:"+(dateTime.substring(14)+" PM")) :
        dateTime.substring(10,13).contains("15") ?
        ("03:"+(dateTime.substring(14)+" PM")) :
        dateTime.substring(10,13).contains("16") ?
        ("04:"+(dateTime.substring(14)+" PM")) :
        dateTime.substring(10,13).contains("17") ?
        ("05:"+(dateTime.substring(14)+" PM")) :
        dateTime.substring(10,13).contains("18") ?
        ("06:"+(dateTime.substring(14)+" PM")) :
        dateTime.substring(10,13).contains("19") ?
        ("07:"+(dateTime.substring(14)+" PM")) :
        dateTime.substring(10,13).contains("20") ?
        ("08:"+(dateTime.substring(14)+" PM")) :
        dateTime.substring(10,13).contains("21") ?
        ("09:"+(dateTime.substring(14)+" PM")) :
        dateTime.substring(10,13).contains("22") ?
        ("10:"+(dateTime.substring(14)+" PM")) :
        dateTime.substring(10,13).contains("23") ?
        ("11:"+(dateTime.substring(14)+" PM")) :
        ("12:"+(dateTime.substring(14)+" PM"))
    ))).toString();

  return _formattedDate;
}

void logLongString(String s) {
  if (s == null || s.length <= 0) return;
  const int n = 1000;
  int startIndex = 0;
  int endIndex = n;
  while (startIndex < s.length) {
    if (endIndex > s.length) endIndex = s.length;
    print(s.substring(startIndex, endIndex));
    startIndex += n;
    endIndex = startIndex + n;
  }
}

bool isEmailValid(String email) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

//this is used for age scrolling issue in Web.
class MMCustomScrollBehavior extends MaterialScrollBehavior {

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}