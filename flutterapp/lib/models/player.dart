import 'dart:ffi';

import 'package:flutter/material.dart';

class Player {
  String name;
  String imagePath;
  int rank;
  double score;

  Player({
    required this.name,
    required this.imagePath,
    required this.rank,
    required this.score,
  });

  String get _name => name;
  int get _rank => rank;
  double get _score => score;
}
