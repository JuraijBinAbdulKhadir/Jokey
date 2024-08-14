

import 'dart:convert';

import 'package:http/http.dart' as http;
final API='https://official-joke-api.appspot.com/random_joke';

Jokes jokesFromJson(String str) => Jokes.fromJson(json.decode(str));

String jokesToJson(Jokes data) => json.encode(data.toJson());

class Jokes {
    String type;
    String setup;
    String punchline;
    int id;

    Jokes({
        required this.type,
        required this.setup,
        required this.punchline,
        required this.id,
    });

    factory Jokes.fromJson(Map<String, dynamic> json) => Jokes(
        type: json["type"],
        setup: json["setup"],
        punchline: json["punchline"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "setup": setup,
        "punchline": punchline,
        "id": id,
    };
}

Future<Jokes?> getRandom()async{
  try{
    final response= await http.get(Uri.parse(API));
     if (response.statusCode==200){

      return jokesFromJson(response.body);

     }
     else{
 print('failed....');
     }

  }catch(e){
    print('error........$e');
   
  }
  return null;
  

}

