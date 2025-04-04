import 'package:flutter/material.dart';
import 'package:music_player_app/components/my_drawer.dart';
import 'package:music_player_app/models/playlistProvider.dart';
import 'package:music_player_app/models/song.dart';
import 'package:music_player_app/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title:  const Text("P L A Y L I S T"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Consumer<Playlistprovider>(
        builder: (context,value,chlid){
          //now the value variable is reffereing to the object of the provider class , most probably 

          final List<Song> playList=value.playList;
          

          return ListView.builder(
            itemCount: playList.length,
            itemBuilder: (context,index){
              //go through each individual song 
              final song=playList[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.asset(song.albumArtImage)),
                title: Text(song.songName),
                subtitle: Text(song.artistName,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                onTap: (){
                  value.setCurrentSongIndex(index);
                  Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const SongPage(),
                ));
                value.playSong();
                },
              );
            }
            );
        }
        ),
      
      
    );
  }
}