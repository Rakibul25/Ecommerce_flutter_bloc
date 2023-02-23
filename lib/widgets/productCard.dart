import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imagesource;
  final num? current_charge;
  final num? selling_price;
  final num? profit;
  final num? discount;

  const ProductCard(
      {required this.name,
      required this.imagesource,
      required this.current_charge,
      required this.selling_price,
      required this.profit,
      required this.discount,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        width: size.width * .45,
        height: size.height * .55,
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
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("ক্রয়",
                        style: TextStyle(fontSize: 12, color: Colors.black54)),
                    SizedBox(
                      width: 8,
                    ),
                    Text("৳ $current_charge",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                    SizedBox(
                      width: 20,
                    ),
                    Visibility(
                        visible: discount == null,
                        child: Text("৳ $discount",
                            style: TextStyle(
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
                    Text("বিক্রয়",
                        style: TextStyle(fontSize: 12, color: Colors.black54)),
                    Text("৳$selling_price",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                    SizedBox(
                      width: 15,
                    ),
                    Text("৳ $profit",
                        style: TextStyle(
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
    );
  }
}
