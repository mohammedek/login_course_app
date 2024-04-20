import 'package:flutter/material.dart';
import 'package:login_course_app/screens/products/product_screen.dart';
import 'package:login_course_app/utils/app_colors.dart';
import 'package:login_course_app/utils/app_strings.dart';
import 'package:login_course_app/utils/app_textstyles.dart';
import 'package:provider/provider.dart';

import '../../providers/bottom_navigation_provider.dart';
import '../Profile/profile_screen.dart';

import '../search/search_screen.dart';

class BottomNavigationSC extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.primaryColor,
      //   tooltip: "Category",
      //   onPressed: (){},
      //   child: const Icon(Icons.sort_sharp,color: AppColors.whiteColor,),),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: AppTextStyles.labelTextStyle.copyWith(
          fontSize: 14
        ),
        selectedLabelStyle:AppTextStyles.labelTextStyle.copyWith(
            fontSize: 14,
          color: Colors.black
        ),
        unselectedItemColor: AppColors.grey,
        unselectedIconTheme:IconThemeData(
          color: AppColors.iconGrey,
        ),
        selectedIconTheme: IconThemeData(
          color: AppColors.darkGrey,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppStrings.search,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppStrings.profile,
          ),
        ],
        currentIndex: provider.selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          provider.setSelectedIndex(index);
        },
      ),
      body: _getBody(provider.selectedIndex),
    );
  }

  Widget _getBody(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const ProductScreen();
      case 1:
        return const SearchScreen();
      case 2:
        return const ProfileScreen();
      default:
        return const ProductScreen();
    }
  }
}
