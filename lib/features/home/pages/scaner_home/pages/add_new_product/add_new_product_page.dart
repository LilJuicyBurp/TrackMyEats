import '/bloc/product/product_bloc.dart';
import '/data/models/product_model.dart';
import '/features/home/pages/scaner_home/widgets/add_prod_dropdown.dart';
import '/utils/insets.dart';
import '/utils/integer_text_input_formater.dart';
import '/utils/null_objects.dart';
import '/widgets/inputDecoration/border_none_labeled.dart';
import '/widgets/inputDecoration/border_top_left_labeled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../utils/decimal_text_input_formatter.dart';

class AddNewProductPage extends StatelessWidget {
  const AddNewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = NullObjects.product;
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Product"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Insets.s),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: borderTopLeftLabeled(
                        "Name",
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) => isNull(value),
                      onSaved: (newName) =>
                          product.copyWith(name: newName?.toLowerCase()),
                    ),
                    const SizedBox(height: Insets.xs),
                    TextFormField(
                      decoration: borderNoneLabeled("Barcode"),
                      inputFormatters: [IntegerTextInputFormatter()],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) => isNull(value),
                      onSaved: (newBarcode) =>
                          product.copyWith(barcode: newBarcode?.toLowerCase()),
                    ),
                    const SizedBox(height: Insets.xs),
                    TextFormField(
                      decoration: borderNoneLabeled("Producer"),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) => isNull(value),
                      onSaved: (newProducer) => product.copyWith(
                          producer: newProducer?.toLowerCase()),
                    ),
                    const SizedBox(height: Insets.xs),
                    _neutritionTextField(
                        "Energy (kcal)",
                        (newEnergy) => product.nutritionalLabelling
                            .copyWith(energy: num.tryParse(newEnergy!) ?? 0)),
                    const SizedBox(height: Insets.xs),
                    _neutritionTextField(
                        "Fat",
                        (newFat) => product.nutritionalLabelling
                            .copyWith(fat: num.tryParse(newFat!) ?? 0)),
                    const SizedBox(height: Insets.xs),
                    _neutritionTextField(
                        "Saturated",
                        (newSaturated) => product.nutritionalLabelling.copyWith(
                            saturated: num.tryParse(newSaturated!) ?? 0)),
                    const SizedBox(height: Insets.xs),
                    _neutritionTextField(
                        "Carbohydrates",
                        (newCarbohydrates) => product.nutritionalLabelling
                            .copyWith(
                                carbohydrates:
                                    num.tryParse(newCarbohydrates!) ?? 0)),
                    const SizedBox(height: Insets.xs),
                    _neutritionTextField(
                        "Salts",
                        (newSalts) => product.nutritionalLabelling
                            .copyWith(salt: num.tryParse(newSalts!) ?? 0)),
                    const SizedBox(height: Insets.xs),
                    _neutritionTextField(
                        "Protein",
                        (newProtein) => product.nutritionalLabelling
                            .copyWith(protein: num.tryParse(newProtein!) ?? 0)),
                    const SizedBox(height: Insets.xs),
                    _neutritionTextField(
                        "Sugars",
                        (newSugar) => product.nutritionalLabelling
                            .copyWith(sugar: num.tryParse(newSugar!) ?? 0)),
                    const SizedBox(height: Insets.xs),
                    AddProdDropdown(
                      onChanged: (newUnit) =>
                          product.copyWith(unit: newUnit?.toLowerCase()),
                    ),
                    const SizedBox(height: Insets.l),
                    BlocConsumer<ProductBloc, ProductState>(
                      builder: (context, state) {
                        if (state is CreatingProduct) {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.red,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(Insets.s),
                                child: CircularProgressIndicator(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          );
                        }
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                BlocProvider.of<ProductBloc>(context).add(
                                  CreateProduct(product: product),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.red,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(Insets.s),
                              child: Text("Add product"),
                            ),
                          ),
                        );
                      },
                      listener: (context, state) {
                        if (state is ProductCreated) {
                          context.pop();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _neutritionTextField(
          String label, void Function(String?) onSaved) =>
      TextFormField(
        decoration: borderNoneLabeled(label),
        style: const TextStyle(color: Colors.white),
        inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: (value) => isNull(value),
        onSaved: onSaved,
      );

  String? isNull(String? value) {
    if (value == null || value.isEmpty) {
      return "value cant't be null!";
    }
    return null;
  }
}
