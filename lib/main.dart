import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pocetok/views/theme_provider.dart';
import 'registerPage.dart';
import 'posleNajava.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_pocetok/views/loginPage.dart';
const lightColor = Color(0xFF0EBECB);
const darkColor = Colors.deepPurple;
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    //const seedColor = Color(0xFF0EBECB); // тиркизна за light

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      themeMode: themeProvider.themeMode,

      
theme: ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: lightColor,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: lightColor,
    foregroundColor: Colors.black,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: lightColor,
    foregroundColor: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColor,
      foregroundColor: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: lightColor,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(fontSize: 18, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
  ),
),

darkTheme: ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: darkColor,
    foregroundColor: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: darkColor,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.deepPurple,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(fontSize: 18, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
  ),
),

      home: const SplashScreen(),
    );
  }
}

// ------------------------ SPLASH SCREEN ------------------------

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/icon/image2.png',
                width: 550,
                height: 550,
              ),
              Lottie.asset(
                'assets/icon/loading1.json',
                width: 200,
                height: 200,
                repeat: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

