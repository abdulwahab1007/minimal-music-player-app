//let's first set the services for our Theme 
import 'package:flutter/material.dart';
import 'package:music_player_app/themes/dark_mode.dart';
import 'package:music_player_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{

  //set the theme to light Mode 
  ThemeData _themeData=lightMode;

  //getter for the ThemeData

  ThemeData get themeData=>_themeData;


  //isDarkMode
  bool isDarkMode()=>_themeData==darkMode; 

  setThemeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();
  }
    //toggle Theme
   void toggleTheme(){
      if(_themeData==lightMode){
        setThemeData(darkMode);
      }
      else{
        setThemeData(lightMode);
      }
    }





}