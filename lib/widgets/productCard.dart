import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imagesource;
  final num? current_charge;
  final num? selling_price;
  final num? profit;
  final num? discount;
  final num? stock;

  const ProductCard(
      {required this.name,
      required this.imagesource,
      required this.current_charge,
      required this.selling_price,
      required this.profit,
      required this.discount,
      required this.stock,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * .40,
        child: Stack(
          children: [
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Container(
                            child: Image.network(
                          imagesource,
                          height: 200,
                          width: 200,
                        )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("ক্রয়",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54)),
                            const SizedBox(
                              width: 8,
                            ),
                            Text("৳ $current_charge",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent)),
                            const SizedBox(
                              width: 20,
                            ),
                            Visibility(
                                visible: discount == null,
                                child: Text("৳ $discount",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.pinkAccent))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("বিক্রয়",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54)),
                            Text("৳$selling_price",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            const SizedBox(
                              width: 15,
                            ),
                            Text("৳ $profit",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: stock==0,
              child: Positioned(
                width: 120,
                top: 10,
                right: 6,
                child: Container(
                 decoration: BoxDecoration(
                     color: Colors.red.shade100,
                   borderRadius: BorderRadius.circular(8)
                 ),
                  child: const Center(
                    child: Text("স্টকে নেই",style: TextStyle(
                        fontSize: 20, color: Colors.red)),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 30,
                width: 30,
                //color: Colors.white,
                decoration: const BoxDecoration(
                  color: Colors.indigo,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white60,
                ),
              ),
            ),
          ],
        ));
  }
}
