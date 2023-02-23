import 'dart:developer';

import 'package:ecommerce_flutter_bloc/API/fetchData.dart';
import 'package:ecommerce_flutter_bloc/logic/search/search_bloc/searchBloc.dart';
import 'package:ecommerce_flutter_bloc/screens/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/model/productModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchPage(),
      ),
    );
  }
}
