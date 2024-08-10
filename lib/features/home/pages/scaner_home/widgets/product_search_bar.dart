import '/data/repository/model_repository/product_repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/insets.dart';

class ProductSearchBar extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fieldController = TextEditingController();
  ProductSearchBar({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(20),
          ),
          border: Border.all(color: Colors.white, width: 3)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Insets.s,
              ),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _fieldController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                  autocorrect: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "field is null";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Product name",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              final isValid = _formKey.currentState?.validate();
              if (isValid == true) {
                ProductRepository repo = ProductRepository();
                context.go("/home/results",
                    extra: repo.getProductsByName(_fieldController.text));
              }
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
