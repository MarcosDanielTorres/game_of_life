import 'package:flutter/material.dart';
import 'cell.dart';
import 'dart:math';
import 'gradient_appbar.dart';

enum gg { hola }

void main() => runApp(GameOfLife());

class GameOfLife extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "xd",
      home: Board(),
    );
  }
}

class Board extends StatefulWidget {
  @override
  State createState() => BoardState();
}

class BoardState extends State<Board> {
  final int rows = 9;
  final int cols = 9;

  List<List<Cell>> game;

  @override
  void initState() {
    game = List<List<Cell>>.generate(rows, (row) {
      return List<Cell>.generate(cols, (col) {
        Random random = Random();
        bool res = random.nextDouble() < 0.14;
        print(res);
        return Cell(row, col, res);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar(),
          Container(
            padding: EdgeInsets.only(top: 50.0),
            color: Colors.grey[50],
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.dashboard),
                  onPressed: () => manager(),
                ),
                IconButton(
                  icon: Icon(Icons.crop_5_4),
                  onPressed: () => xd(),
                ),
                createBoard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void manager() {
    setState(() {
      correr();
    });
  }

  void xd() {
    setState(() {
      print("Hola");
      correr();
    });
  }

  Widget createBoard() {
    List<Row> list = <Row>[];

    for (int i = 0; i < rows; i++) {
      List<Widget> row = <Widget>[];
      for (int j = 0; j < cols; j++) {
        if (game[i][j].estaViva) {
          row.add(CellPaint(
            flagged: true,
            posX: i,
            posY: j,
          ));
        } else {
          row.add(CellPaint(
            flagged: false,
            posX: i,
            posY: j,
          ));
        }
      }
      list.add(
        Row(
          children: row,
          mainAxisAlignment: MainAxisAlignment.center,
          key: ValueKey<int>(i),
        ),
      );
    }
    return Container(
      child: Column(
        children: list,
      ),
    );
  }

  void correr() {
    int p = 0;
    int t = 0;
    List<Cell> aMatar = List<Cell>(rows * cols);
    List<Cell> aRevivir = List<Cell>(rows * cols);

    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (!game[i][j].estaViva &&
            game[i][j].obtenerCantidadVecinos(game) == 3) {
          aRevivir[p] = game[i][j];
          p++;
        }
      }
    }
    //System.out.println(juego[2][1].estaViva());
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (game[i][j].estaViva &&
            (game[i][j].obtenerCantidadVecinos(game) < 2 ||
                game[i][j].obtenerCantidadVecinos(game) > 3)) {
          aMatar[t] = game[i][j];
          t++;
        }
      }
    }

    for (int i = 0; i < p; i++) {
      aRevivir[i].setViva = true;
    }
    for (int i = 0; i < t; i++) {
      aMatar[i].setViva = false;
    }
  }
}

Widget buildTile(Widget child) {
  return Container(
    padding: EdgeInsets.all(1.0),
    height: 41.0,
    width: 41.0,
    color: Colors.grey[400],
    margin:
        EdgeInsets.all(2.0), //MARGEN ES LO DE AFUERA Y PADDING LO DE ADENTRO
    child: child,
  );
}

Widget buildInnerTile(Widget child) {
  return Container(
    padding: EdgeInsets.all(1.0),
    margin: EdgeInsets.all(2.0),
    height: 20.0,
    width: 20.0,
    child: child,
  );
}

class CellPaint extends StatelessWidget {
  final bool flagged;
  final int posX;
  final int posY;

  CellPaint({this.flagged, this.posX, this.posY});

  @override
  Widget build(BuildContext context) {
    Widget viva = Container(
      margin: EdgeInsets.all(2.0),
      height: 41.0,
      width: 41.0,
      color: Colors.yellow,
    );

    Widget innerTile = Container(
      margin: EdgeInsets.all(5.0),
      height: 2.0,
      width: 2.0,
      color: Colors.grey[350],
    );

    return this.flagged ? viva : buildTile(innerTile);
  }
}
