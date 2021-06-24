//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Game());
  }
}

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body:Center(
      child: Container(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container (
                  //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Image(
                    image: AssetImage("asset/ttt_logo.png"),
                    width: 200,
                    height: 250,
                  ),
                )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                //padding: EdgeInsets.fromLTRB(120, 100, 0, 0),
                child: Text("Tic Tac Toe",style: TextStyle(color: Colors.blueGrey[900],fontSize: 30),),
                height: 300,
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.fromLTRB(100, 50, 0, 0),
                  width: 200,
                  child: RaisedButton(
                    child: Text("Start Game",style: TextStyle(color: Colors.blueGrey[900]),),
                    color: Colors.white,
                    onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder : (context) => Homepage()));
                    },
                  )
                )
                
              ],
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                //padding: EdgeInsets.fromLTRB(120, 100, 0, 0),
                child: Text("Created By Srinu_Kesari"),
              ),
            ],
          ),
          ],
        ),
      ),
    ),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool flag = true;
  int tapped = 0;
  List<String> displayxo = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("# Tic Tac Toe #",style: TextStyle(fontSize: 40)),
        backgroundColor: Colors.blue[400],
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding( 
        padding: EdgeInsets.fromLTRB(40,150,40,20),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tapped(index);
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[600])),
                child: Center(
                    child: Text(displayxo[index],
                        style: TextStyle(color: Colors.black, fontSize: 30))),
              ),
            );
          }),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (displayxo[index] == '') {
        if (flag) {
          displayxo[index] = "O";
          tapped += 1;
        } else {
          displayxo[index] = "X";
          tapped += 1;
        }
        flag = !flag;
        _checkwin();
      }
    });
  }
  
  void _checkwin() {
    if (displayxo[0] == displayxo[1] &&
        displayxo[1] == displayxo[2] &&
        displayxo[0] != "") {
      _showwinner(displayxo[0]);
    }
    if (displayxo[3] == displayxo[4] &&
        displayxo[3] == displayxo[5] &&
        displayxo[3] != "") {
      _showwinner(displayxo[3]);
    }
    if (displayxo[6] == displayxo[8] &&
        displayxo[7] == displayxo[8] &&
        displayxo[6] != "") {
      _showwinner(displayxo[8]);
    }
    if (displayxo[0] == displayxo[3] &&
        displayxo[0] == displayxo[6] &&
        displayxo[0] != "") {
      _showwinner(displayxo[0]);
    }
    if (displayxo[1] == displayxo[4] &&
        displayxo[1] == displayxo[7] &&
        displayxo[1] != "") {
      _showwinner(displayxo[1]);
    }
    if (displayxo[2] == displayxo[5] &&
        displayxo[2] == displayxo[8] &&
        displayxo[2] != "") {
      _showwinner(displayxo[2]);
    }
    if (displayxo[0] == displayxo[4] &&
        displayxo[0] == displayxo[8] &&
        displayxo[0] != "") {
      _showwinner(displayxo[0]);
    }
    if (displayxo[2] == displayxo[4] &&
        displayxo[6] == displayxo[4] &&
        displayxo[4] != "") {
      _showwinner(displayxo[2]);
    }
    else if(tapped == 9)
    {
        _drawgame();
    }
  }
  void _showwinner(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Winner is: " + winner),
            actions: <Widget>[
              FlatButton(
                child: Text("Play Again!"),
                onPressed: (){
                 _resetgame();
                 Navigator.of(context).pop();
                }
               )
            ],
          );
        });
  }
  void _drawgame(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Draw Match"),
            actions: <Widget>[
              FlatButton(
                child: Text("Play Again!"),
                onPressed: (){
                  _resetgame();
                  Navigator.of(context).pop();
                 }
                )
            ],
          );
        });
  }
  void _resetgame(){
    setState(() {
      for(int i=0;i<9;i++)
      {
        displayxo[i] = "";
      }
    });
    tapped = 0;
  }
}
