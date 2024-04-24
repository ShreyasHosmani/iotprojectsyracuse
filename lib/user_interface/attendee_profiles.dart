import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var attendeeNames;

class AttendeeProfiles extends StatefulWidget {
  const AttendeeProfiles({Key? key}) : super(key: key);

  @override
  _AttendeeProfilesState createState() => _AttendeeProfilesState();
}

class _AttendeeProfilesState extends State<AttendeeProfiles> {

  Future<void> getCheckedInAttendees() async {
    try {
      await http.get(
        Uri.parse('https://01hhm9wsi9.execute-api.us-east-1.amazonaws.com/user'),
      ).then((value){
        print(jsonDecode(value.body.toString()));
        setState(() {
          attendeeNames = List.generate(jsonDecode(value.body.toString()).length,
                  (index) => jsonDecode(value.body.toString())[index]['firstName']);
        });
        print(attendeeNames);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      attendeeNames = [];
    });
    getCheckedInAttendees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 90,bottom:0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    InkWell(
                        onTap: (){Navigator.of(context).pop();},
                        child: Icon(Icons.arrow_back)),
                    const SizedBox(width: 20,),
                    Text("View All Players",
                      style: GoogleFonts.firaSans(
                        letterSpacing: 0,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Divider(thickness: 1,),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1628890923662-2cb23c2e0cfe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1607990281513-2c110a25bd8c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 60,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 80,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1509839862600-309617c3201e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 130,
                      child: Text(
                        "30+ Joined",
                        style: GoogleFonts.firaSans(color: Colors.black, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: ListView.builder(
                  itemCount: attendeeNames.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: InkWell(
                        onTap: (){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) =>
                          //       PlayerProfile()),
                          // );
                        },
                        child: Container(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40, width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  color: Color(0xfffe5f2e),
                                ),
                                child: Center(
                                  child: Icon(Icons.person_rounded,color: Colors.white,),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 0,),
                                  Text(attendeeNames[index],
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.firaSans(
                                        letterSpacing: 0,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Group 1 | ",
                                        style: GoogleFonts.firaSans(
                                          letterSpacing: 0,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(attendeeNames[index].toString().contains('Shreyas') ? "#UI/UX,#Android,#iOS" :
                                        "#Backend,#ProjectManagement",
                                        style: GoogleFonts.firaSans(
                                          letterSpacing: 0,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.deepOrange
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
