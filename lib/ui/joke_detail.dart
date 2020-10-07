import 'package:flutter/material.dart';
import 'package:ui/model/joke.dart';

class JokeDeatils extends StatelessWidget {
  final bool isTabletlayout;
  final Joke joke;

  const JokeDeatils({@required this.isTabletlayout, @required this.joke});
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(joke?.setup ?? "No Joke Selected",
              style: textTheme.headline4),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            joke?.punchline ?? "Please Select a joke on left.",
            style: textTheme.subtitle1,
          ),
        ),
      ],
    );

    if (isTabletlayout) {
      return Center(
        child: content,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(joke?.type ?? "No Joke type."),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: content,
      ),
    );
  }
}
