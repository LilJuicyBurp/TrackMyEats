// ignore_for_file: public_member_api_docs, sort_constructors_first
import '/bloc/auth/auth_bloc.dart';
import '/utils/insets.dart';
import 'package:flutter/material.dart';

import '/data/models/menu_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuElements {
  static const main = MenuElement(label: "Home", icon: Icon(Icons.home));
  static const scanProduct =
      MenuElement(label: "Scan Product", icon: Icon(Icons.qr_code));
  static const profile =
      MenuElement(label: "Profile", icon: Icon(Icons.person));

  static const elements = [
    main,
    scanProduct,
    profile,
  ];
}

class MenuPage extends StatelessWidget {
  final MenuElement currentElement;
  final ValueChanged<MenuElement> onSelectedElement;
  const MenuPage({
    Key? key,
    required this.currentElement,
    required this.onSelectedElement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            _menuTitle(),
            const Spacer(flex: 6),
            ...MenuElements.elements
                .map((element) => _buildMenuItem(element))
                .toList(),
            const Spacer(flex: 10),
            _logoutButton(context),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _menuTitle() => const Padding(
        padding: EdgeInsets.all(Insets.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "FitFitMeal",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            SizedBox(height: Insets.xs),
            Text(
              "Eat healthy, feel great!",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ],
        ),
      );

  Widget _buildMenuItem(MenuElement element) => ListTile(
        selected: element == currentElement,
        minLeadingWidth: 20,
        leading: element.icon,
        focusColor: Colors.white,
        iconColor: Colors.white,
        selectedColor: Colors.white,
        textColor: Colors.white,
        selectedTileColor: Colors.black26,
        title: Text(element.label),
        onTap: () => onSelectedElement(element),
      );

  Widget _logoutButton(BuildContext context) => Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.8,
          child: OutlinedButton(
            onPressed: () => BlocProvider.of<AuthBloc>(context).add(SignOut()),
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              side: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(Insets.xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(width: Insets.xs),
                  Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
