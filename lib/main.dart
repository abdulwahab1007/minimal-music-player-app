import 'package:flutter/material.dart';
import 'package:music_player_app/models/playlistProvider.dart';
import 'package:music_player_app/pages/home_page.dart';
import 'package:music_player_app/pages/settings_page.dart';
import 'package:music_player_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
   MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>ThemeProvider()),
      ChangeNotifierProvider(create: (context)=>Playlistprovider()),
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context,listen: true).themeData, // THe UI should listen the toggle theme Changes and rebuild the widget , that's why we are using true while listening 
      routes: {
        '/settings_page':(context)=>const SettingsPage()
      },
     );
  }
}
