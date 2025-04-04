import 'package:flutter/material.dart';
import 'package:music_player_app/components/neu_box.dart';
import 'package:music_player_app/models/playlistProvider.dart';
import 'package:music_player_app/utils/helper_functions.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget{
  const SongPage({
    super.key,
    });
    


  //creating a utility Function 
  @override
  Widget build(BuildContext context) {
    return Consumer<Playlistprovider>(
      builder: (context,value,child){
        // Fetch the play list , and the Current song index 
        // ignore: unused_local_variable
        final Playlistprovider playlistprovider=Playlistprovider();
    
        final playList=value.playList;
        // get the current song 
        final currentSong=playList[value.currentSongIndex ?? 0];
        // this is how we will fetch the curretn Song , which is being setted 
        return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: SingleChildScrollView(
                child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 10.0,top: 10.0),
                          child: Column(
                            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back Icon button
                    IconButton(
                      onPressed: ()=>Navigator.pop(context), 
                      icon: const Icon(Icons.arrow_back)
                      ),
                      //title
                      const Text("P l A Y L I S T"),
                          
                      //menu
                      IconButton(onPressed: (){}, icon: const Icon(Icons.menu))
                  ],
                ),
                //album Art Image 
                const SizedBox(height: 25.0,),
                Neubox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(currentSong.albumArtImage),
                        ),
                        const SizedBox(height: 10.0,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                 Text(currentSong.songName,
                          style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,                        
                        ),),
                        Text(currentSong.artistName,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),),],
                            ),
                            const Icon(Icons.favorite,
                            color: Colors.red,
                            size: 27,)
                          ],
                        )
                    ],
                  )
                  ),
                            
                  //song Duration progress 
                  const SizedBox(height: 15.0,),
                   Padding(
                    padding:  const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //start time 
                        Text(formatDateTime(value.currentDuration)),
                        // shuffle icon 
                        const Icon(Icons.shuffle),
                        // loop Icon
                        const Icon(Icons.loop),
                        // end time 
                        Text(formatDateTime(value.totalDuration)),
                            
                      ],
                    ),
                    ),
                            
                    //Slider 
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 8,
                        )
                      ), 
                      child: Slider(
                        inactiveColor: Theme.of(context).colorScheme.secondary,
                        activeColor: Colors.green,
                        min: 0,
                        max: value.totalDuration.inSeconds.toDouble(),
                        value: value.currentDuration.inSeconds.toDouble(),
                        onChanged: (double value){
                          //do nothing on this Change 
                        }, 
                        onChangeEnd: (double newPosition){
                          // when the user stops moving the scroll thumb ,go to that poistion in the song 
                          value.seek(Duration(seconds: newPosition.toInt()));
                        },
                        )
                      ),
                      const SizedBox(height: 15.0,),
                       Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: ()=>value.playPreviousSong(),
                              child: const Neubox(
                                child: Icon(Icons.skip_previous)
                                ),
                            ),
                            ),
                            const SizedBox(width: 15.0,),
                            Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: value.pauseOrResume,
                              child:  Neubox(
                                child: value.isPlaying ?const Icon(Icons.pause) : const Icon(Icons.play_arrow)
                                ),
                            ),
                            ),
                            const SizedBox(width: 15.0,),
                            Expanded(
                            child: GestureDetector(
                              onTap: ()=>value.playNextSong(),
                              child: const Neubox(
                                child: Icon(Icons.skip_next)
                                ),
                            ),
                            )
                            
                        ],
                      )
                            ],
                          ),
                        ),
                ),
              )
              // 
            );
       }
      );
  }
}