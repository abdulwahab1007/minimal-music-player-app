import 'package:flutter/material.dart';
import 'package:music_player_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class Neubox extends StatelessWidget{
  const Neubox({
    super.key,
    required this.child
    });

  final Widget? child;

  @override
  Widget build(BuildContext context) {

    //get the isDarkMode
    final isDarkMode=Provider.of<ThemeProvider>(context,listen: false).isDarkMode();

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration( 
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          //darker Shadow on the bottom right 
          BoxShadow(
            color: isDarkMode? Colors.black :Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(4, 4), // is this offset is telling the dimension?
          ),
          //lighter shadow on the top left 
           BoxShadow(
            color: isDarkMode?Colors.grey.shade800 :Colors.white,
            blurRadius: 15,
            offset: const Offset(-4, -4)
          )
        ],
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: child,
    );
  }
}