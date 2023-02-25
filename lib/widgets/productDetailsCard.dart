import 'package:ecommerce_flutter_bloc/screens/searchPage.dart';
import 'package:flutter/material.dart';
class ProductDetailsCard extends StatefulWidget {
  final String slug;
  final int? quantity;
  const ProductDetailsCard({
    required this.slug,
    required this.quantity,
    Key? key}) : super(key: key);

  @override
  State<ProductDetailsCard> createState() => _ProductDetailsCardState();
}

class _ProductDetailsCardState extends State<ProductDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.quantity.toString()),
            Container(
              height: 30,
              width: 30,
              //color: Colors.white,
              decoration: const BoxDecoration(
                color: Colors.indigo,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => SearchPage()
                              ));
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white60,
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
