import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/app_colors.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade400.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                isPressed
                    ? const SizedBox(
                        width: 250,
                        height: 40,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Search Places',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.primaryColor),
                          ),
                          Text(
                            'Date Range and Number of guests',
                            style: TextStyle(
                                fontSize: 13,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
