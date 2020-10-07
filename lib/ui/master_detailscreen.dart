import 'package:flutter/material.dart';
import 'package:ui/model/joke.dart';
import 'package:ui/ui/joke_detail.dart';
import 'package:ui/ui/joke_listening.dart';

class MasterDetailScreen extends StatefulWidget {
  @override
  _MasterDetailScreenState createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {
  static const int tableBreakpoint = 600;
  Joke _selectedJoked;

  Widget _buildMobileLayout() {
    return JokeListening(
      jokeSelectedCallBack: (jokeSelected) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return JokeDeatils(isTabletlayout: false, joke: jokeSelected);
        }));
      },
      jokeSelected: _selectedJoked,
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        // ignore: missing_required_param
        Flexible(
          flex: 1,
          child: Material(
            child: JokeListening(
                jokeSelectedCallBack: (joke) {
                  setState(() {
                    _selectedJoked = joke;
                  });
                },
                jokeSelected: _selectedJoked),
          ),
        ),

        // add second

        Flexible(
            flex: 3,
            child: JokeDeatils(isTabletlayout: true, joke: _selectedJoked))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait && shortestSide < tableBreakpoint) {
      content = _buildMobileLayout();
    } else {
      content = _buildTabletLayout();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes"),
      ),
      body: content,
    );
  }
}
