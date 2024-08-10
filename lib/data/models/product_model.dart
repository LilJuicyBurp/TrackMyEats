// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '/data/models/food_label_model.dart';

class Product extends Equatable {
  final String? _barcode;
  final String? _name;
  final String? _producer;
  final String? _unit;
  final FoodLabel? _nutritionalLabelling;

  const Product({
    String? barcode,
    String? name,
    String? producer,
    String? unit,
    FoodLabel? nutritionalLabelling,
  })  : _barcode = barcode,
        _name = name,
        _producer = producer,
        _unit = unit,
        _nutritionalLabelling = nutritionalLabelling;

  Product copyWith({
    String? barcode,
    String? name,
    String? producer,
    String? unit,
    FoodLabel? nutritionalLabelling,
  }) {
    return Product(
      barcode: barcode ?? _barcode,
      name: name ?? _name,
      producer: producer ?? _producer,
      unit: unit ?? _unit,
      nutritionalLabelling: nutritionalLabelling ?? _nutritionalLabelling,
    );
  }

  static Product fromSnapshot(DocumentSnapshot snap) => Product(
        barcode: snap['barcode'] as String,
        name: snap['name'] as String,
        producer: snap['producer'] as String,
        unit: snap['unit'] as String,
        nutritionalLabelling: FoodLabel.fromMap(snap['nutritional_labelling']),
      );

  String get barcode => _barcode ?? "";
  String get name => _name ?? "";
  String get producer => _producer ?? "";
  String get unit => _unit ?? "";
  FoodLabel get nutritionalLabelling =>
      _nutritionalLabelling ?? const FoodLabel();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'barcode': _barcode,
      'name': _name,
      'producer': _producer,
      'unit': _unit,
      'nutritional_labelling': _nutritionalLabelling?.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      barcode: map['barcode'] as String,
      name: map['name'] as String,
      producer: map['producer'] as String,
      unit: map['unit'] as String,
      nutritionalLabelling: FoodLabel.fromMap(
          map['nutritional_labelling'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      barcode,
      name,
      producer,
      unit,
      nutritionalLabelling,
    ];
  }
}
