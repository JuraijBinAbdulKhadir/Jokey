import 'package:flutter/material.dart';
import 'package:funs/service/service.dart';

class GenaratePagState extends StatefulWidget {
  const GenaratePagState({super.key});

  @override
  State<GenaratePagState> createState() => __GenaratePagStateState();
}

class __GenaratePagStateState extends State<GenaratePagState> {
String jokeText = "Click the button to get a joke!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Card(
              color: Colors.black26,
              child:  Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 150,
                  width: 350,
                  child: Center(child: Text(jokeText,style: TextStyle(color: Colors.white),)),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _getRandomJoke, 
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              
              child: const Text('Generate'))
          ],
        ),
      ),
    );
  }

void _getRandomJoke() async {
    setState(() {
      jokeText = "Loading...";
    });

    // Fetch the joke from the API
    Jokes? joke = await getRandom();

    // Update the UI with the fetched joke or an error message
    setState(() {
      if (joke != null) {
        jokeText = "${joke.setup}\n${joke.punchline}";
      } else {
        jokeText = "Failed to load joke!";
      }
    });
  }
}




