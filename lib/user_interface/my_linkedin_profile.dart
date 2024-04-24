import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/user_interface/add_tags.dart';
import 'package:untitled/user_interface/set_avatar.dart';

class MyLinkedinProfile extends StatefulWidget {
  const MyLinkedinProfile({Key? key}) : super(key: key);

  @override
  _MyLinkedinProfileState createState() => _MyLinkedinProfileState();
}

class _MyLinkedinProfileState extends State<MyLinkedinProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const AddTags(),
            ),
          );
        },
        backgroundColor: Color(0xfffe5f2e),
        child: Center(
          child: Icon(Icons.arrow_forward,color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset("assets/images/linkedin.png", height: 30,),
                  const SizedBox(width: 15,),
                  Text("Your profile",
                    style: GoogleFonts.firaSans(
                        color: Colors.black,fontSize: 18
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fullName.toString(),
                        style: GoogleFonts.firaSans(
                            color: Colors.black,
                            fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(height: 40,),
                      Text(linkedInLink.toString(),
                        style: GoogleFonts.firaSans(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Text(contactNo.toString(),
                        style: GoogleFonts.firaSans(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Text(emailId.toString(),
                        style: GoogleFonts.firaSans(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 35, height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(1000)),
                        border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Center(child: Icon(Icons.edit, color: Colors.grey.shade400,)),
                      )),
                  const SizedBox(width: 10,),
                  Container(
                      width: 35, height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(1000)),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Center(child: Icon(Icons.delete, color: Colors.grey.shade400,)),
                      )),
                ],
              ),
              const SizedBox(height: 30,),
              Divider(thickness: 1,),
              const SizedBox(height: 20,),
              Text("ABOUT",
                style: GoogleFonts.firaSans(
                    color: Colors.blueGrey,fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20,),
              Text(aboutText.toString(),
                style: GoogleFonts.firaSans(
                  color: Colors.black,fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20,),
              Divider(thickness: 1,),
              const SizedBox(height: 20,),
              Text("EDUCATION",
                style: GoogleFonts.firaSans(
                  color: Colors.blueGrey,fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20,),
              Text(educationList[0].toString(),
                style: GoogleFonts.firaSans(
                  color: Colors.black,fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(educationList[1].toString(),
                style: GoogleFonts.firaSans(
                  color: Colors.black,fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20,),
              Divider(thickness: 1,),
              const SizedBox(height: 20,),
              Text("Experience",
                style: GoogleFonts.firaSans(
                  color: Colors.blueGrey,fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20,),
              Text("Co-Founder @ Orange Events",
                style: GoogleFonts.firaSans(
                  color: Colors.black,fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text("Jan 2024 - present",
                style: GoogleFonts.firaSans(
                  color: Colors.black,fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: GoogleFonts.firaSans(
                  color: Colors.black,fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20,),
              Text("Co-Founder @ Orange Events",
                style: GoogleFonts.firaSans(
                  color: Colors.black,fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text("Jan 2024 - present",
                style: GoogleFonts.firaSans(
                  color: Colors.black,fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: GoogleFonts.firaSans(
                  color: Colors.black,fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
