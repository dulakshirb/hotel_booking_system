import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/providers/hotel_provider.dart';
import 'package:hotel_booking_app/utils/app_colors.dart';
import 'package:hotel_booking_app/widgets/app_search_bar.dart';
import 'package:provider/provider.dart';

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
                  height: 250,
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
                      left: 15, top: 20, right: 15, bottom: 10),
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
                                'Sri Lanka',
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
                        height: 25,
                      ),
                      Text(
                        'Hey Martin! Tell us where you want to go',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const AppSearchBar()
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 30, left: 20),
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
                    height: 310,
                    child: Consumer<HotelProvider>(
                        builder: (context, hotels, child) {
                      print(hotels.hotelsData);

                      List<Hotel> allHotelData = hotels.hotelsData;
                      return hotels.hotelsData.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: allHotelData.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColors.primaryColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: Image.network(
                                                allHotelData[index].mainImage!,
                                                height: 200,
                                                width: 300,
                                                fit: BoxFit.cover,
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
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    allHotelData[index].title!,
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .secondaryColor,
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
                                                        '${allHotelData[index].rating}',
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
                                              Row(
                                                children: List.generate(
                                                  allHotelData[index]
                                                      .amenities!
                                                      .length,
                                                  (fIndex) => FacilityItem(
                                                    facilityName:
                                                        allHotelData[index]
                                                            .amenities![fIndex],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '\$${allHotelData[index].prices!['ai']}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16,
                                                      color: AppColors
                                                          .secondaryColor,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'All Inclusive',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: AppColors
                                                          .secondaryColor,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                    }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Discover new places',
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
                    height: 120,
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const Row(
                            children: [
                              PlacesLoop(
                                imageUrl:
                                    'https://images.pexels.com/photos/23732429/pexels-photo-23732429/free-photo-of-sailing-boats-in-bay.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                              ),
                              PlacesLoop(
                                  imageUrl:
                                      'https://q-xx.bstatic.com/xdata/images/hotel/max600/427980688.jpg?k=2f4e5810eed431b9428c39043870efa31cfa78bf5700158a0f53c54eccd020f7')
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class PlacesLoop extends StatelessWidget {
  const PlacesLoop({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: 180,
        height: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
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
