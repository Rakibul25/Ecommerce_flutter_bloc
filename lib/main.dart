import 'dart:developer';

import 'package:ecommerce_flutter_bloc/API/fetchData.dart';
import 'package:ecommerce_flutter_bloc/screens/searchPage.dart';
import 'package:flutter/material.dart';

import 'data/model/productModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ProductModel? productModel;
  FetchData fetchData = FetchData();
  productModel = await fetchData.getProduct();
  print(productModel?.status.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}
