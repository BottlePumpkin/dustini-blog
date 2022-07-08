
import 'dart:math';

import 'package:flutter/material.dart';

class Animal {
  final String name;
  final String age;

  Animal(this.name, this.age);

  @override
  String toString() {
    return 'Animal{name: $name} {age: $age}';
  }


}

enum Fruits {
  apple('사과',12.4,color: Colors.red),
  banana('바나나',10.0,color: Colors.yellow),
  grape('포도',8.0,color: Colors.black),
  orange('오렌지',7.5,color: Colors.orange);

  final String fruitName;
  final double brix;
  final Color color;

  String get thisIsFruit {
    return '이것은 $fruitName 입니다';
  }

  String get howMuchBrix {
    return '당도는 $brix 입니다';
  }



  const Fruits(this.fruitName,this.brix,{required this.color});

  @override
  String toString() => '이것은 과일 입니다';
}

void main() {
  print(Fruits.apple.thisIsFruit);
  print(Fruits.apple.brix);
  print(Fruits.apple.toString);

  debugPrint(Animal(
     'monkey','10'

  ).toString());
}