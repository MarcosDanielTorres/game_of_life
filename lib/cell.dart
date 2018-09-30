import 'package:flutter/material.dart';

class Cell {
  final int i;
  final int j;
  bool viva;

  Cell(this.i, this.j, this.viva);

  bool get estaViva => this.viva;
  set setViva(bool viva) => this.viva = viva;

  int obtenerCantidadVecinos(List<List<Cell>> game) {
    int sum = 0;
        for (int k = -1; k <= 1; k++) {
            for (int l = -1; l <= 1; l++) {
                if (k == 0 && l == 0) continue;
                int tempi = i + k;
                int tempj = j + l;
                if(tempi < 0){
                    tempi = tempi + game.length - 1;
                }else{
                    if(tempi > game.length - 1){
                        tempi = tempi % game.length;
                    }
                }
                if(tempj < 0){
                    tempj = tempj + game[0].length - 1;
                }else{
                    if(tempj > game[0].length - 1){
                        tempj = tempj % game[0].length;
                    }
                }
                 if (game[tempi][tempj].estaViva) sum++;
            }
        }
        return sum;
  }
}
