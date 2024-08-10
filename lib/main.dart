import 'package:firebase_core/firebase_core.dart';
import '/bloc/auth/auth_bloc.dart';
import '/bloc/user/user_bloc.dart';
import '/data/models/product_model.dart';
import '/features/auth/forgot_password/forgot_passwd_page.dart';
import '/features/auth/signIn/signi_n_page.dart';
import '/features/auth/signUp/sign_up_page.dart';
import '/features/home/home_page.dart';
import '/features/home/pages/scaner_home/pages/add_new_product/add_new_product_page.dart';
import '/features/home/pages/scaner_home/pages/conclusion_page/conclusion_page.dart';
import '/features/home/pages/scaner_home/pages/product_page/product_page.dart';
import '/features/home/pages/scaner_home/pages/products_result/products_results.dart';
import '/features/home/pages/scaner_home/pages/scaner/barcode_scaner.dart';
import '/features/home/pages/weekly_details/weekly_details.dart';
import '/features/tutorial/tutorial_page.dart';
import '/features/welcome/welcome_page.dart';
import '/firebase_options.dart';
import '/utils/user_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'bloc/product/product_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await UserSharedPreferences.init();

  MobileAds.instance.initialize();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(CheckUser()),
        ),
        BlocProvider<UserBloc>(create: (context) => UserBloc()),
        BlocProvider<ProductBloc>(create: (context) => ProductBloc()),
      ],
      child: const FitFitMeal(),
    ),
  );
}

class FitFitMeal extends StatefulWidget {
  const FitFitMeal({
    Key? key,
  }) : super(key: key);

  @override
  State<FitFitMeal> createState() => _FitFitMealState();
}

class _FitFitMealState extends State<FitFitMeal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      theme: ThemeData(
        fontFamily: 'Rubik',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: "/",
        builder: (context, state) => const WelcomePage(),
        routes: <GoRoute>[
          GoRoute(
            path: "signIn",
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: "signUp",
            builder: (context, state) => const RegisterPage(),
          ),
          GoRoute(
            path: "forgot_password",
            builder: (context, state) => const ForgotPasswdPage(),
          ),
        ],
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) => const HomePage(),
        routes: <GoRoute>[
          GoRoute(
            path: "weekly_details",
            builder: (context, state) => const WeeklyDetails(),
          ),
          GoRoute(
            path: "scaner",
            builder: (context, state) => const BarcodeScaner(),
          ),
          GoRoute(
            path: "results",
            builder: (context, state) => ProductsResults(
              stream: state.extra as Stream<List<Product>>,
            ),
          ),
          GoRoute(
            path: "add_product",
            builder: (context, state) => const AddNewProductPage(),
          ),
          GoRoute(
            path: "product",
            builder: (context, state) =>
                ProductPage(product: state.extra as Product),
          ),
          GoRoute(
            path: "conclusion",
            builder: (context, state) =>
                ConclusionPage(product: state.extra as Product),
          ),
        ],
      ),
      GoRoute(
        path: "/tutorial",
        builder: (context, state) => const TutorialPage(),
      ),
    ],
  );
}
