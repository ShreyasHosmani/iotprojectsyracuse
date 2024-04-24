import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_tags/simple_tags.dart';
import 'package:untitled/user_interface/event_checkin.dart';
import 'package:untitled/user_interface/initial_screen_2.dart';

class AddLookingForTags extends StatefulWidget {
  const AddLookingForTags({Key? key}) : super(key: key);

  @override
  _AddLookingForTagsState createState() => _AddLookingForTagsState();
}

class _AddLookingForTagsState extends State<AddLookingForTags> {

  final List<String> tags = [
    'UI/UX',
    'Android',
    'iOS',
    'Web Development',
    'Abobe XD',
    'Figma',
    'Product',
    'Frontend',
    'Backend',
    'Github',
    'Project Management'
  ];

  List<String> selectedTags = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedTags = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const CheckIn(),
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
            child: Text("Looking\nfor?",
              textAlign: TextAlign.left,
              style: GoogleFonts.firaSans(
                  fontSize: 45,
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
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: SimpleTags(
              content: selectedTags,
              wrapSpacing: 10,
              wrapRunSpacing: 10,
              onTagPress: (tag) {
                print('pressed $tag');
                if(selectedTags.contains(tag.toString())){
                  setState(() {
                    selectedTags.remove(tag.toString());
                  });
                }else{
                  setState(() {
                    selectedTags.add(tag.toString());
                  });
                }
                print("selectedTags : "+selectedTags.toString());
              },
              // onTagLongPress: (tag) {print('long pressed $tag');},
              // onTagDoubleTap: (tag) {print('double tapped $tag');},
              tagContainerPadding: EdgeInsets.all(6),
              tagTextStyle: TextStyle(color: Colors.white,fontSize: 10),
              tagIcon: Icon(Icons.clear, size: 12, color: Colors.white,),
              tagContainerDecoration: BoxDecoration(
                color: Color(0xfffe5f2e),
                border: Border.all(color: Color(0xfffe5f2e)),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(139, 139, 142, 0.16),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1.75, 3.5), // c
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search tags (UI/UX, Flutter, Product, etc)',
                  hintStyle: GoogleFonts.firaSans(
                      color: Colors.black,fontSize: 16
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: SimpleTags(
              content: tags,
              wrapSpacing: 20,
              wrapRunSpacing: 20,
              onTagPress: (tag) {
                print('pressed $tag');
                if(selectedTags.contains(tag.toString())){
                  setState(() {
                    selectedTags.remove(tag.toString());
                  });
                }else{
                  setState(() {
                    selectedTags.add(tag.toString());
                  });
                }
                print("selectedTags : "+selectedTags.toString());
              },
              // onTagLongPress: (tag) {print('long pressed $tag');},
              // onTagDoubleTap: (tag) {print('double tapped $tag');},
              tagContainerPadding: EdgeInsets.all(6),
              tagTextStyle: TextStyle(color: Colors.black),
              tagIcon: Icon(Icons.clear, size: 12, color: Colors.grey,),
              tagContainerDecoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xfffe5f2e)),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(139, 139, 142, 0.16),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1.75, 3.5), // c
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
