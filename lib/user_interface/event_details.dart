import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:untitled/user_interface/attendee_profiles.dart';
import 'package:untitled/user_interface/beacon_notifications.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const AttendeeProfiles(),
            ),
          );
        },
        backgroundColor: Color(0xfffe5f2e),
        child: Center(
          child: Icon(Icons.people,color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
              child: Stack(
                children: [
                  Image.asset("assets/images/eventImage.png",
                    height: 250,width: double.infinity ,fit: BoxFit.cover,),
                  Container(
                    height: 250, width: double.infinity,color: Colors.black.withOpacity(0.2),
                  ),
                  Positioned(
                    right: 20, top: 60,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => const BeaconNotifications(),
                          ),
                        );
                      },
                      child: Icon(Icons.notifications_active, color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text("Syracuse University : ",
                textAlign: TextAlign.left,
                style: GoogleFonts.firaSans(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfffe5f2e),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Text("A Demo Event of NextGen Products (Internet of Things)",
                textAlign: TextAlign.left,
                style: GoogleFonts.firaSans(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text("24th April 2024 | Wednesday | 1pm",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.firaSans(
                    fontSize: 14,letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text("About",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.firaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: ReadMoreText(
                  'Join us for the Semester 1 IoT Group Project Presentations, where innovative minds showcase cutting-edge projects. Discover unique solutions and advancements from our brightest students across various IoT domains. Engage with the creators, learn about their processes, and explore the future of technology. Don’t miss this exciting opportunity to see where creativity meets functionality!',
                  trimMode: TrimMode.Line,
                  trimLines: 3,
                  colorClickableText: Colors.red,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Show less',
                  moreStyle: GoogleFonts.firaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                  style: GoogleFonts.firaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                )
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Presenters",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.firaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text("View all",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.firaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text("Agenda",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.firaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.2,
                  indicatorStyle: IndicatorStyle(
                    width: 20, color: Color(0xfffe5f2e),
                  ),
                  endChild: Container(
                    constraints: const BoxConstraints(
                      minHeight: 80,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("  Event Begins",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.firaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  startChild: Container(
                    child: Text("1:00 pm",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.firaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                )
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                  child: TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.2,
                    indicatorStyle: IndicatorStyle(
                      width: 20, color: Color(0xfffe5f2e),
                    ),
                    endChild: Container(
                      constraints: const BoxConstraints(
                        minHeight: 80,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("  IoT : Home Automation\n  Group 1 Demo",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.firaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    startChild: Container(
                      child: Text("1:10 pm",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.firaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
