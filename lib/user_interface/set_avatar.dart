import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:untitled/user_interface/initial_screen.dart';
import 'package:untitled/user_interface/my_linkedin_profile.dart';

var fullName = "";
var linkedInLink = "";
var contactNo = "";
var emailId = "";
var aboutText = "";
var educationList = [];
var experienceList = [];
TextEditingController linkedInLinkController = TextEditingController();

class SetAvatar extends StatefulWidget {
  const SetAvatar({Key? key}) : super(key: key);

  @override
  _SetAvatarState createState() => _SetAvatarState();
}

class _SetAvatarState extends State<SetAvatar> {

  bool setAvatar = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      setAvatar = false;
      linkedInLinkController.clear();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                    onTap: (){
                      print("Set avatar tapped");
                      setState(() {
                        setAvatar = true;
                      });
                    },
                    child: RiveAnimation.asset("assets/rive/avatar.riv")),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 520),
            child: Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: setAvatar == false ? null :
                AssetImage("assets/images/av2.png"),
                child: Center(
                  child: setAvatar == false ? Icon(Icons.camera_alt, color: Colors.white,size: 70,)
                  : Container(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 280),
            child: Center(
              child: Text("Upload your picture",
                style: GoogleFonts.firaSans(
                    color: Colors.black,fontSize: 30
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 180),
            child: Center(
              child: Text("or",
                style: GoogleFonts.firaSans(
                    color: Colors.black,fontSize: 20
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 50, right: 50),
            child: Center(
              child: TextFormField(
                controller: linkedInLinkController,
                decoration: InputDecoration(
                  hintText: 'https://linkedin.com/username',
                  hintStyle: GoogleFonts.firaSans(
                          color: Colors.black,fontSize: 16
                      ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400, left: 50, right: 50),
            child: Center(
              child: InkWell(
                onTap: (){
                  print("LinkedIn URL to be fetched : "+linkedInLinkController.text.toString());
                  if(linkedInLinkController.text.contains('shreyas')){
                    setState(() {
                      fullName = "Shreyas Hosmani";
                      linkedInLink = "linkedin.com/in/shreyas-hosmani";
                      contactNo = "+1 (315) 278 0590";
                      emailId = "sjhosmani@syr.edu";
                      aboutText = "Flutter | 6+ Years | 20+ Products | 2M+ users globally | CoFounded @ Gathrr | Building OrangeEvents";
                      educationList = ["Bachelor in Engineering (CS) / Pune University","Masters in Engineering (CS) / Syracuse University"];
                      experienceList = ["Bachelor in Engineering (CS) / Pune University","Masters in Engineering (CS) / Syracuse University"];
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const MyLinkedinProfile(),
                      ),
                    );
                  }else if(linkedInLinkController.text.contains('krutarth')){
                    setState(() {
                      fullName = "Krutarth Chaudhari";
                      linkedInLink = "linkedin.com/in/krutarth-chaudhari";
                      contactNo = "+1 (315) 324 0448";
                      emailId = "kchaud02@syr.edu";
                      aboutText = "Backend | SQL | Python | Algorithms | Operating Systems | Building OrangeEvents";
                      educationList = ["Bachelor in Engineering (CS) / Pune University","Masters in Engineering (CS) / Syracuse University"];
                      experienceList = ["Bachelor in Engineering (CS) / Pune University","Masters in Engineering (CS) / Syracuse University"];
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const MyLinkedinProfile(),
                      ),
                    );
                  }else if(linkedInLinkController.text.contains('damain')){
                    setState(() {
                      fullName = "Damain Moquin";
                      linkedInLink = "linkedin.com/in/damain-moquin";
                      contactNo = "+1 (774) 437 3230";
                      emailId = "djmoquin@syr.edu";
                      aboutText = "DevOps | Computer Architecture | Computer Networks | Building OrangeEvents";
                      educationList = ["Bachelor in Engineering (CS) / Pune University","Masters in Engineering (CS) / Syracuse University"];
                      experienceList = ["Bachelor in Engineering (CS) / Pune University","Masters in Engineering (CS) / Syracuse University"];
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const MyLinkedinProfile(),
                      ),
                    );
                  }else{
                    Fluttertoast.showToast(msg: 'Couldn\'t fetch profile, please enter a valid profile url!',
                      backgroundColor: Colors.red, textColor: Colors.white
                    );
                  }
                },
                child: Container(
                  height: 70,width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xff0077b5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                        child: Image.asset("assets/images/linkedin.png"),
                      ),
                      const SizedBox(width: 10,),
                      Text("Fetch Linkedin Profile",
                        style: GoogleFonts.firaSans(
                            color: Colors.white,fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
