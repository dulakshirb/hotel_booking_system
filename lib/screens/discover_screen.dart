import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/app_colors.dart';
import 'package:hotel_booking_app/widgets/app_search_bar.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    image: DecorationImage(
                      image: const NetworkImage(
                          'https://hips.hearstapps.com/hmg-prod/images/airbnb-eco-air-ship-1619179081.png?crop=0.667xw:1.00xh;0.124xw,0&resize=980:*'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.darken),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 40, right: 15, bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Norway',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.person,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Hey Martin! Tell us where you want to go',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const AppSearchBar()
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The most relevant',
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.primaryColor,
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          "https://q-xx.bstatic.com/xdata/images/hotel/max600/427980688.jpg?k=2f4e5810eed431b9428c39043870efa31cfa78bf5700158a0f53c54eccd020f7",
                                        ),
                                      ),
                                      Positioned(
                                        top: 15,
                                        right: 15,
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: const Color.fromARGB(
                                                87, 0, 0, 0),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.favorite_outline,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Tiny home in Roelingen',
                                              style: TextStyle(
                                                color: AppColors.secondaryColor,
                                                fontSize: 17,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  size: 18,
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  '4.96 (217)',
                                                  style: TextStyle(
                                                    color: AppColors
                                                        .secondaryColor,
                                                    fontSize: 13,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Row(
                                          children: [
                                            FacilityItem(
                                              facilityName: '4 guests',
                                            ),
                                            FacilityItem(
                                              facilityName: '2 bedrooms',
                                            ),
                                            FacilityItem(
                                              facilityName: '2 beds',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class FacilityItem extends StatelessWidget {
  const FacilityItem({
    super.key,
    required this.facilityName,
  });

  final String facilityName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.grey),
          ),
          const SizedBox(
            width: 3,
          ),
          Text(facilityName),
        ],
      ),
    );
  }
}
