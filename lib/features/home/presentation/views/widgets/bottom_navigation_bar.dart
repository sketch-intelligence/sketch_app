import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey, // Unselected color
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.imagesHome,
            color: _selectedIndex == 0 ? AppColors.primary : Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.imagesNetwork,
            color: _selectedIndex == 1 ? AppColors.primary : Colors.grey,
          ),
          label: 'Network',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.imagesArtificialBrain,
            color: _selectedIndex == 2 ? AppColors.primary : Colors.grey,
          ),
          label: 'Generate',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.imagesList,
            color: _selectedIndex == 3 ? AppColors.primary : Colors.grey,
          ),
          label: 'Menu',
        ),
      ],
    );
  }
}
