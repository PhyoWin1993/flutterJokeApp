import 'package:flutter/material.dart';
import 'package:ui/model/joke.dart';

class JokeListening extends StatelessWidget {
  final ValueChanged<Joke> jokeSelectedCallBack;
  final Joke jokeSelected;

  const JokeListening(
      {@required this.jokeSelectedCallBack, @required this.jokeSelected});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((joke) {
        return Container(
          child: ListTile(
            title: Text(joke.setup),
            onTap: () => jokeSelectedCallBack(joke),
            selected: jokeSelected == joke,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.5),
          ),
        );
      }).toList(),
    );
  }
}
