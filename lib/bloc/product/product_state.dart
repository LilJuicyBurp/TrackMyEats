// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class CreatingProduct extends ProductState {}

class ProductCreated extends ProductState {}

class ProductError extends ProductState {
  final String error;

  const ProductError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
