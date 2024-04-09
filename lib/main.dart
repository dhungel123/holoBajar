
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holo_bazar/features/auth/ui/screens/login_page.dart';
import 'package:holo_bazar/features/auth/ui/screens/signup_page.dart';
import 'package:holo_bazar/features/checkout/ui/screens/checkout_screen.dart';
import 'package:holo_bazar/features/dashboard/ui/screens/dashboard_screen.dart';

import 'core/constants/custom_themes.dart';
import 'core/constants/routes.dart';
import 'features/splash/ui/screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      theme: ThemeData(
        primaryColor: CustomTheme.primaryColor,
        useMaterial3: false,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      onGenerateRoute: (setting){
        if(setting.name == MyRoutes.home){
          return MaterialPageRoute(builder: (context)=>SplashPage());
        }else if(setting.name == MyRoutes.login){
          return MaterialPageRoute(builder: (context)=> LoginPage());
        }else if(setting.name == MyRoutes.register){
          return MaterialPageRoute(builder: (context)=> SignupPages());
        }else if(setting.name == MyRoutes.dashboard){
          return MaterialPageRoute(builder: (context)=> DashboardScreens());
        }else if(setting.name == MyRoutes.checkout){
          return MaterialPageRoute(builder: (context)=>CheckoutPage());
        }
      },

      // home: const SplashPage(),
    );
  }
}
