import 'package:flutter/material.dart';
import 'about_me.dart';
import 'education.dart';
import 'work.dart';
import 'package:flutter/gestures.dart';
import 'material/pager.dart';
import 'molecules/side_dock.dart';
import 'atoms/icon_data_item.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'projects.dart';
import 'additional_info.dart';
import 'package:shelf/shelf.dart';
import 'dart:io';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'molecules/dock_mobile.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Welcome to my CV!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIconIndex = 0;
  PageController _pageController = PageController();

  List<IconDataItem> _iconDataList = [
    IconDataItem(icon: Icons.person_2_outlined, index: 0),
    IconDataItem(icon: Icons.school_outlined, index: 1),
    IconDataItem(icon: Icons.work_history_outlined, index: 2),
    IconDataItem(icon: Icons.construction_outlined, index: 3),
    IconDataItem(icon: Icons.info_outline, index: 4),

    // Add more icons here if needed
  ];

  static const _backgroundColor = Color.fromARGB(255, 31, 29, 100);

  static const _colors = [
    Color.fromARGB(255, 102, 64, 254),
    Color.fromARGB(255, 35, 45, 140),
    Color.fromARGB(164, 35, 45, 140),
    Color.fromARGB(74, 54, 60, 115),
  ];

  static const _durations = [
    10000,
    9000,
    8500,
    8000,
  ];

  static const _heightPercentages = [
    0.32,
    0.42,
    0.41,
    0.38,
  ];

  @override
  void initState() {
    super.initState();
    _selectedIconIndex = 0;
    _pageController = PageController(initialPage: _selectedIconIndex);
  }

  void _selectIcon(int index) async {
    await _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    setState(() {
      _selectedIconIndex = index;
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIconIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff2F243A),
            primary: Color.fromARGB(255, 127, 67, 187),
            secondary: const Color(0xff444054),
            surface: const Color(0xffBEBBBB),
            inversePrimary: Color(0xffDB8A74)),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
        ),
        scaffoldBackgroundColor: const Color(0xffFAC9B8),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 20),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 15),
          bodySmall: TextStyle(color: Colors.white, fontSize: 10),
          headlineLarge: TextStyle(color: Colors.white, fontSize: 60),
        ),
      ),
      home: Scaffold(
          body: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              durations: _durations,
              heightPercentages: _heightPercentages,
              gradients: [
                [
                  Color.fromARGB(255, 102, 64, 254),
                  Color.fromARGB(255, 81, 58, 176),
                  Color.fromARGB(255, 35, 45, 140),
                ],
                [
                  Color.fromARGB(255, 81, 58, 176),
                  Color.fromARGB(255, 36, 21, 99),
                  Color.fromARGB(255, 8, 13, 58),
                ],
                [
                  Color.fromARGB(134, 82, 58, 176),
                  Color.fromARGB(111, 37, 21, 99),
                  Color.fromARGB(105, 8, 13, 58),
                ],
                [
                  Color.fromARGB(107, 102, 64, 254),
                  Color.fromARGB(109, 82, 58, 176),
                  Color.fromARGB(90, 35, 45, 140),
                ],
              ],
            ),
            backgroundColor: _backgroundColor,
            size: Size(double.infinity, double.infinity),
            waveAmplitude: 10,
          ),
          Pager(
              onPageChanged: _onPageChanged,
              pageController: _pageController,
              pages: [
                const AboutMePage(),
                const EducationPage(),
                const WorkPage(),
                const ProjectsPage(),
                const AdditionalPage(),
              ]),
          MediaQuery.of(context).size.width > 880
              ? SideDock(
                  icons: _iconDataList,
                  index: _selectedIconIndex,
                  selectIcon: _selectIcon,
                )
              : DockMobile(
                  index: _selectedIconIndex,
                  selectIcon: _selectIcon,
                  icons: _iconDataList)
        ],
      )),
    );
  }
}
