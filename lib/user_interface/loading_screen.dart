import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:untitled/user_interface/initial_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Artboard? riveArtboard;
  SMIBool? isDance;
  SMITrigger? isLookUp;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/rive/i_love_emails!.riv').then(
          (data) async {
        try {
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller =
          StateMachineController.fromArtboard(artboard, 'Sniff Rig');
          if (controller != null) {
            artboard.addController(controller);
            isDance = controller.findSMI('isTracking');
            isLookUp = controller.findSMI('isSniffing');
          }
          setState(() => riveArtboard = artboard);
        } catch (e) {
          print(e);
        }
      },
    );
    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const InitialScreen(),
        ),
      );
    });
  }

  void toggleDance(bool newValue) {
    setState((){isDance!.value = !isDance!.value;
    isLookUp!.value = !isLookUp!.value;});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: riveArtboard == null
        ? const SizedBox()
        : Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Rive(
                artboard: riveArtboard!,
                fit: BoxFit.cover,
              ),
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Dance'),
                Switch(
                  value: isDance!.value,
                  onChanged: (value) => toggleDance(value),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Text('Look up'),
              onPressed: () => isLookUp?.value = true,
            ),
            const SizedBox(height: 12),*/
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Orange",
                  style: GoogleFonts.titilliumWeb(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(" Events",
                  style: GoogleFonts.titilliumWeb(
                      fontSize: 45,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
