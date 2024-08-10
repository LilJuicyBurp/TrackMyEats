// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class CreateProduct extends ProductEvent {
  final Product product;

  const CreateProduct({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}
