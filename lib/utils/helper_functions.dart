// helper functions 
// format the date time 
String formatDateTime(Duration duration){
  final String minutes=duration.inMinutes.toString().padLeft(2,'0');
  final String seconds=(duration.inSeconds % 60).toString().padLeft(2,'0');

  return "$minutes:$seconds";
} 

//   ~/ (integer division) gets minutes (inSeconds ~/ 60).

//   % (modulus) gets remaining seconds (inSeconds % 60).