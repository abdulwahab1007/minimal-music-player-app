import 'package:flutter/material.dart';
import 'package:music_player_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:  Column(
        children: [
           DrawerHeader(
            child: Icon(Icons.music_note_outlined,
            size: 52,
            color: Theme.of(context).colorScheme.inversePrimary),
            ),
          const SizedBox(height: 20.0,),

          MyListTile(
            onTap: (){
              Navigator.pop(context);
            }, 
            text: "H O M E",
            icon: Icon(Icons.home,
            color: Theme.of(context).colorScheme.inversePrimary),
          ),
          MyListTile(
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings_page');
            }, 
            text: "S E T T I N G S",
            icon:  Icon(Icons.settings,
            color: Theme.of(context).colorScheme.inversePrimary,),
            )
        ],
      ),
    );
  }
}