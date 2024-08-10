import 'dart:convert';

import 'package:equatable/equatable.dart';

class FoodLabel extends Equatable {
  final num? _energy;
  final num? _fat;
  final num? _saturated;
  final num? _protein;
  final num? _salt;
  final num? _sugar;
  final num? _carbohydrates;

  const FoodLabel({
    num? energy,
    num? fat,
    num? saturated,
    num? protein,
    num? salt,
    num? sugar,
    num? carbohydrates,
  })  : _energy = energy,
        _fat = fat,
        _saturated = saturated,
        _protein = protein,
        _salt = salt,
        _sugar = sugar,
        _carbohydrates = carbohydrates;

  FoodLabel copyWith({
    num? energy,
    num? fat,
    num? saturated,
    num? protein,
    num? salt,
    num? sugar,
    num? carbohydrates,
  }) {
    return FoodLabel(
      energy: energy ?? _energy,
      fat: fat ?? _fat,
      saturated: saturated ?? _saturated,
      protein: protein ?? _protein,
      salt: salt ?? _salt,
      sugar: sugar ?? _sugar,
      carbohydrates: carbohydrates ?? _carbohydrates,
    );
  }

  num get energy => _energy ?? 0;
  num get fat => _fat ?? 0;
  num get saturated => _saturated ?? 0;
  num get protein => _protein ?? 0;
  num get salt => _salt ?? 0;
  num get sugar => _sugar ?? 0;
  num get carbohydrates => _carbohydrates ?? 0;

  FoodLabel operator +(FoodLabel other) {
    return FoodLabel(
      energy: (_energy ?? 0) + (other._energy ?? 0),
      fat: (_fat ?? 0) + (other._fat ?? 0),
      saturated: (_saturated ?? 0) + (other._saturated ?? 0),
      protein: (_protein ?? 0) + (other._protein ?? 0),
      salt: (_salt ?? 0) + (other._salt ?? 0),
      sugar: (_sugar ?? 0) + (other._sugar ?? 0),
      carbohydrates: (_carbohydrates ?? 0) + (other._carbohydrates ?? 0),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'energy': _energy,
      'fat': _fat,
      'saturated': _saturated,
      'protein': _protein,
      'salt': _salt,
      'sugar': _sugar,
      'carbohydrates': _carbohydrates,
    };
  }

  factory FoodLabel.fromMap(Map<String, dynamic> map) {
    return FoodLabel(
      energy: map['energy'] as num,
      fat: map['fat'] as num,
      saturated: map['saturated'] as num,
      protein: map['protein'] as num,
      salt: map['salt'] as num,
      sugar: map['sugar'] as num,
      carbohydrates: map['carbohydrates'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodLabel.fromJson(String source) =>
      FoodLabel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        _energy,
        _fat,
        _saturated,
        _protein,
        _salt,
        _sugar,
        _carbohydrates,
      ];
}
