import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/user_interface/event_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/user_interface/set_avatar.dart';

TextEditingController checkInCodeController = TextEditingController();

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {

  Future<void> eventCheckIn() async {
    print("fullName : "+fullName.toString());
    var response;
    if(checkInCodeController.text.toString() == 'SYR2024IOT'){
      try {
         response = await http.post(
          Uri.parse('https://01hhm9wsi9.execute-api.us-east-1.amazonaws.com/user'),
          body: jsonEncode({
            "email_id": emailId.toString(),
            "firstName": fullName.toString(),
            "lastName": "",
            "linkedIn_link": linkedInLink.toString(),
            "about": aboutText.toString(),
            "education": "",
            "experience": "",
          }),
        ).then((value){
          print(jsonDecode(value.body.toString()));
          var msg = value.body;
          if(msg.toString().contains('successfully')){
            Fluttertoast.showToast(msg: 'Event check-in successful!',
                backgroundColor: Colors.green, textColor: Colors.white
            );
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const EventDetails(),
              ),
            );
          }else{
            Fluttertoast.showToast(msg: 'This event has not yet started',
                backgroundColor: Colors.red, textColor: Colors.white
            );
          }
        });
      } catch (e) {
        print(e);
      }
    }else if(checkInCodeController.text.isEmpty){
      Fluttertoast.showToast(msg: 'Please enter a valid Event Code!',
          backgroundColor: Colors.red, textColor: Colors.white
      );
    }else{
      Fluttertoast.showToast(msg: 'This event has not yet started',
          backgroundColor: Colors.red, textColor: Colors.white
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInCodeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          eventCheckIn();
        },
        backgroundColor: Color(0xfffe5f2e),
        child: Center(
          child: Icon(Icons.arrow_forward,color: Colors.white,),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 20),
            child: Text("Event CheckIn",
              textAlign: TextAlign.left,
              style: GoogleFonts.firaSans(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xfffe5f2e),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 30),
              child: Text("Enter the code received on your mail at the time you registered for the event.",
                textAlign: TextAlign.left,
                style: GoogleFonts.firaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 30),
            child: Center(
              child: TextFormField(
                controller: checkInCodeController,
                style: GoogleFonts.firaSans(
                  color: Colors.black,fontSize: 40, letterSpacing: 5,
                ),
                decoration: InputDecoration(
                  hintText: 'ECX67YU23',
                  hintStyle: GoogleFonts.firaSans(
                      color: Colors.black,fontSize: 40, letterSpacing: 5,
                  ),
                ),
              ),
            ),
          ),
          /*Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 80, left: 20, right: 40),
              child: Text("Or simply scan the QR at the event 15 minutes prior to the event starts.",
                textAlign: TextAlign.left,
                style: GoogleFonts.firaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xfffe5f2e),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 40),
              child: Image.asset("assets/images/qr.png", scale: 3,)
            ),
          ),*/
        ],
      ),
    );
  }
}
