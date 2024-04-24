import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/user_interface/set_avatar.dart';

class InitialScreen2 extends StatefulWidget {
  const InitialScreen2({Key? key}) : super(key: key);

  @override
  _InitialScreen2State createState() => _InitialScreen2State();
}

class _InitialScreen2State extends State<InitialScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const SetAvatar(),
            ),
          );
        },
        backgroundColor: Colors.white,
        child: Center(
          child: Icon(Icons.arrow_forward,color: Color(0xfffe5f2e),),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, right: 20),
            child: Text("Find\nexactly\nwho\nyou're\nlooking\nfor!",
              textAlign: TextAlign.right,
              style: GoogleFonts.firaSans(
                fontSize: 65,
                fontWeight: FontWeight.bold,
                color: Color(0xfffe5f2e),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 20),
              child: Text("Save 90% of searching time",
                textAlign: TextAlign.left,
                style: GoogleFonts.firaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Spacer(),
          Align(
              alignment: Alignment.centerLeft,
              child: Image.asset("assets/images/network.png",
                height: 170, width: double.infinity,
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}
