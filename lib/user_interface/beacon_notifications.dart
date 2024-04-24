import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';
import 'package:beacon_flutter/beacon_flutter.dart';
import 'dart:convert';

class BeaconNotifications extends StatefulWidget {
  const BeaconNotifications({Key? key}) : super(key: key);

  @override
  _BeaconNotificationsState createState() => _BeaconNotificationsState();
}

class _BeaconNotificationsState extends State<BeaconNotifications> {

  List<NotificationCard> _listOfNotification = [
    NotificationCard(
      date: DateTime.now(),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: '2 #UI/UX Connections Nearby',
      subtitle: 'We believe in the power of networking, here are 2 people in UI/UX who might be a potential connection. Click to send them a request.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'Someone Is Looking For You',
      subtitle: 'Krutarth is looking for a Flutter Developer and sent you a request.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 10),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'We Found You Perfect Match',
      subtitle: 'Damian is looking for App Developer and Damian is a marketing expert who you\'ve been looking for!'
    ),
  ];

  final _beaconPlugin = Beacon();
  bool hasPeers = false;
  String value = '';

  startBeacon() async {
    Fluttertoast.showToast(msg: 'Subscribed',
        backgroundColor: Colors.green, textColor: Colors.white
    );
    final Map response =
    await _beaconPlugin.startBeacon(walletName: "SYR2024IOT");
    setState(() {
      hasPeers = json.decode(response['success'].toString());
    });
    getBeaconResponse();
  }

  void getBeaconResponse() {
    Fluttertoast.showToast(msg: 'Now listening...',
        backgroundColor: Colors.yellow.shade700, textColor: Colors.black
    );
    _beaconPlugin.getBeaconResponse().listen(
          (data) {
        setState(() {
          value = data;
        });
      },
    );
    listenToBeacon();
  }

  Future<void> listenToBeacon() async {
    await _beaconPlugin.startBeacon(walletName: 'SYR2024IOT');
    Future.delayed(const Duration(seconds: 1), (){
      _beaconPlugin.getBeaconResponse().listen(
            (data) {
          final Map<String, dynamic> requestJson =
          jsonDecode(data) as Map<String, dynamic>;
          final BeaconRequest beaconRequest =
          BeaconRequest.fromJson(requestJson);

          switch (beaconRequest.type) {
            case RequestType.permission:
          break;
            case RequestType.signPayload:
          break;
            case RequestType.operation:
          break;
            case RequestType.broadcast:
          break;
            case null:
              break;
        }
        },
      );
    });
  }

  Future<void> pairBeacon() async {
      final Map response = await _beaconPlugin.pair(
        pairingRequest: '2bZ1dGiCLs8hdFsabfvL4m3PX1kmqjgSdw2oMc1GSyk5LvEZh3yhSkpV3ZbJn8aHGDq6bU5dJ1yFMYWVfjn1JCDejikPoiWdb4P3jMncik2NZYTkEJF5GEuiyqhHDyfDY4gdffninMYynexkW9WALX3NPyLML1DB6HuwFCjKZ4CfSJgU4rPzqYKgsdGdVCka9Af6AcWaWEv4Edev171NWRNovJuPXEdE4Yf48zSoL36wxnFUMu8Xz8LV2m9iedKvJZrBLtNSYegHhczXgRJB7tHhNrHUta1xrCUecymC1UkGcXdjgCXyRXWDUfExQe3LbpF',
      );

      setState(() {
        bool success =
        json.decode(response['success'].toString());
        hasPeers = success;
      });

      if (hasPeers) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(
          content: Text('Successfully paired.'),
        ));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(
          content: Text('Failed to pair.'),
        ));
      }
  }

  Future<void> unpairBeacon() async {
    final Map response =
        await _beaconPlugin.removePeers();

    setState(() {
      bool success =
      json.decode(response['success'].toString());
      hasPeers = !success;
    });

    if (!hasPeers) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
        content: Text('Successfully disconnected.'),
      ));
    }
  }

  Future<void> broadcastMessageToBeacon() async {
    await _beaconPlugin.respondExample();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startBeacon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Image.asset("assets/images/bgImg.png"),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: double.infinity,
          //   color: Colors.black.withOpacity(0.4),
          // ),
          Positioned(
            left: 20, top: 80,
            child: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back, color: Colors.black,
                size: 30,
              ),
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.only(top: 120, left: 10, right: 10),
            child: Container(
              child: StackedNotificationCards(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 2.0,
                  )
                ],
                notificationCardTitle: 'Message',
                notificationCards: [..._listOfNotification],
                cardColor: Color(0xFFF1F1F1),
                padding: 16,
                actionTitle: Text(
                  'Notifications',
                  style: GoogleFonts.firaSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 1
                  ),
                ),
                showLessAction: Text(
                  'Show less ',
                  style: GoogleFonts.firaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                onTapClearAll: () {
                  setState(() {
                    _listOfNotification.clear();
                  });
                },
                clearAllNotificationsAction: Icon(Icons.close, color: Colors.white,),
                clearAllStacked: Text('Clear All'),
                cardClearButton: Text('clear'),
                cardViewButton: Text('view'),
                onTapClearCallback: (index) {
                  print(index);
                  setState(() {
                    _listOfNotification.removeAt(index);
                  });
                },
                onTapViewCallback: (index) {
                  print(index);
                },
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
