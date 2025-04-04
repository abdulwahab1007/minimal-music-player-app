// ignore_for_file: prefer_final_fields

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/models/song.dart';

class Playlistprovider extends ChangeNotifier{

  //playList of songs 
  List<Song> _playList=[
    //song 1  
    Song(
      songName: "Birds of a Feather", 
      artistName: "Billie Eilish", 
      albumArtImage: "assets/images/billie.jpeg", 
      audioPath: "audio/birdsOfFeather.mp3"
      ),

    //song 2 
    Song(
      songName: "Gul", 
      artistName: "Anuv Jain", 
      albumArtImage: "assets/images/GUL.jpeg", 
      audioPath: "audio/GUL.mp3"
    ),
    // song 3 
    Song(
      songName: "The Shimmer of Sindhu", 
      artistName: "A.R Rehman", 
      albumArtImage: "assets/images/shimmerOfSindhu.jpeg", 
      audioPath: "audio/shimmerOfSindhu.mp3"
    ),

    // NOTE : no need to include "assets/" file in the file path while using Asset source , 
  ];

  //Now We need a current Song index to know that which SOng are we playing 
  int? _currentSongIndex;

  /*

    AUDIO PLAYER 
    -- we can also adjust volume (_audioPlayer.setVolume(25));

   */

  //  audioPlayer 
  final AudioPlayer _audioPlayer=AudioPlayer();

  //durations

  Duration _currentDuration=Duration.zero;
  Duration _totalDuration=Duration.zero;

  //constructor

  Playlistprovider(){
    listenToDuration();
  }

  //initially not playing
  bool isPlaying=false;

  //play the song 
  void playSong()async{
    final String path=_playList[_currentSongIndex!].audioPath;
    await _audioPlayer.play(AssetSource(path));
    isPlaying=true;
    notifyListeners();
  }

  //pause the song 
  void pauseSong()async{
    await _audioPlayer.pause();
    isPlaying=false;
    notifyListeners();
  }

  //resume the song
    void resumeSong()async{
      await _audioPlayer.resume();
      isPlaying=true;
      notifyListeners();
    }

  //pause or resume 
    void pauseOrResume(){
      if(isPlaying){
        pauseSong();
      }
      else{
        resumeSong();
      }
      notifyListeners();
    }

  //seek to a spectific postition in the current Song 
  void seek(Duration position)async{
    await _audioPlayer.seek(position);
    notifyListeners();
  }

  // play Next Song 
  void playNextSong(){
   if(currentSongIndex!=null){
     if(_currentSongIndex!<_playList.length-1){
      //then move to the next song
      _currentSongIndex=_currentSongIndex!+1;
    }
    else{
      //if it's the last song , then Create a loop , by going to the First song 
      _currentSongIndex=0;
    }
    playSong();
   }
   notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  //play previous song 
  void playPreviousSong(){
    if(_currentSongIndex!=null){
      if(currentDuration.inSeconds>2){
        //if the song has played for more than 2 seconds, play the same exact song 
         seek(Duration.zero);
      }
      else{
        if(_currentSongIndex!>0){
          //then move to the previous Song 
          _currentSongIndex=_currentSongIndex!-1;
        }
        else if(_currentSongIndex==0){
          //if it's the first Song , then go back to the last song 
          _currentSongIndex=playList.length-1;
        }
      }
      playSong();
    }
    notifyListeners();
  }

  //listen to duration
  void listenToDuration()async{
    //for the total Duration 
     _audioPlayer.onDurationChanged.listen((newDuration){
      _totalDuration=newDuration;
      notifyListeners();
     });

     //listen to  the current song Duration 
     _audioPlayer.onPositionChanged.listen((newDuration){
      _currentDuration=newDuration;
      notifyListeners();//listen each second whenever the UI changes 
     });

     //listen for the song completion 
      _audioPlayer.onPlayerComplete.listen((event){
        //play Next Song 
        playNextSong();
      });
  }

  

  



  // Gettters 

  List<Song> get playList=>_playList;
  int? get currentSongIndex=>_currentSongIndex ;

  Duration get currentDuration=>_currentDuration;
  Duration get totalDuration=>_totalDuration;

  //setters

  setCurrentSongIndex(int index){
    _currentSongIndex=index;
  }

  
}