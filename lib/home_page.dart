import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/booking_screen.dart';
import 'package:hotel_booking_app/screens/discover_screen.dart';
import 'package:hotel_booking_app/screens/favourite_screen.dart';
import 'package:hotel_booking_app/screens/message_screen.dart';
import 'package:hotel_booking_app/services/firebase_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int screenNo = 0;
  List<Widget> screenList = const [
    DiscoverScreen(),
    FavouriteScreen(),
    BookingScreen(),
    MessageScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseServices.getHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[screenNo],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromARGB(202, 0, 0, 0),
          ),
          width: double.infinity,
          height: 60,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottomNavigationIcon(
                    icon: Icons.navigation, iconText: 'Discover', index: 0),
                bottomNavigationIcon(
                    icon: Icons.favorite_outline,
                    iconText: 'Favorites',
                    index: 1),
                bottomNavigationIcon(
                    icon: Icons.book, iconText: 'Booking', index: 2),
                bottomNavigationIcon(
                    icon: Icons.message_rounded,
                    iconText: 'Messages',
                    index: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationIcon(
      {required IconData icon, required String iconText, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          screenNo = index;
        });
        // print(screenNo);
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: screenNo == index ? Colors.white : Colors.grey,
            size: screenNo == index ? 23 : 18,
          ),
          Text(
            iconText,
            style: TextStyle(
              color: screenNo == index ? Colors.white : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
