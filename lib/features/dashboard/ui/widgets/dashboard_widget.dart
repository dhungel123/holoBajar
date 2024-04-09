import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holo_bazar/core/constants/routes.dart';

import '../../../../core/constants/custom_themes.dart';
import '../../../cart/ui/screens/cart_page.dart';
import '../../../homepage/ui/screens/homepage_screen.dart';
import '../../../order/ui/screens/order_screen.dart';

class DashboardWidgets extends StatefulWidget {
  const DashboardWidgets({super.key});

  @override
  State<DashboardWidgets> createState() => _DashboardWidgetsState();
}

class _DashboardWidgetsState extends State<DashboardWidgets> {
  int _selectedIndex = 0;
  PageController _controller = PageController();

  void showDeleteDialog(){
showDialog(context: context, builder: (context){
  return AlertDialog(
    title: Text('Confirm Logout'),
    actions: [
      TextButton(onPressed: (){
        Navigator.pushNamedAndRemoveUntil(
          context,
          MyRoutes.login,
              (route) => false,
        );
      }, child: Text('Yes')),
      TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text('No')),

    ],

  );

});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.primaryColor,
        title: _selectedIndex==0? Text(
          "Dashboard",
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ): (_selectedIndex==1? Text(
          "Cart",
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ): Text(
          "Order",
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ) ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDeleteDialog();

            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _controller.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        }),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        iconSize: 22,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Container(
              child: Text('Home'),
              padding: EdgeInsets.only(left: 8),
            ),
            activeColor: CustomTheme.primaryColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Container(
              child: Text('Cart'),
              padding: EdgeInsets.only(left: 8),
            ),
            activeColor: CustomTheme.lightBlueColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add_shopping_cart_rounded),
            title: Container(
              child: Text('Orders'),
              padding: EdgeInsets.only(left: 8),
            ),
            activeColor: CustomTheme.darkerBlueColor,
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
            print(_selectedIndex);
          });
        },
        children: [
          HomepageScreens(),
          CartPage(),
          OrderScreens(),
        ],
      ),
    );
  }
}