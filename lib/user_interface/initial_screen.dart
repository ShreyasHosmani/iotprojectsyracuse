import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/user_interface/initial_screen_2.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const InitialScreen2(),
            ),
          );
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
            padding: const EdgeInsets.only(top: 60, left: 20),
            child: Text("Make\nmore\nimpact\nthan\nyou'll\nknow.",
              textAlign: TextAlign.left,
              style: GoogleFonts.firaSans(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfffe5f2e),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text("Discover Meet & Network",
                textAlign: TextAlign.left,
                style: GoogleFonts.firaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
