import 'package:ecommerce_flutter_bloc/logic/search/Product_Card_In_SearchPage_bloc/count_stream_handeler/streamBloc.dart';
import 'package:ecommerce_flutter_bloc/logic/search/Product_Card_In_SearchPage_bloc/count_stream_handeler/streamEvent.dart';
import 'package:ecommerce_flutter_bloc/logic/search/Product_Card_In_SearchPage_bloc/productBloc.dart';
import 'package:ecommerce_flutter_bloc/logic/search/Product_Card_In_SearchPage_bloc/productEvent.dart';
import 'package:ecommerce_flutter_bloc/logic/search/Product_Card_In_SearchPage_bloc/productState.dart';
import 'package:ecommerce_flutter_bloc/logic/search/product_details_bloc/product_details_bloc.dart';
import 'package:ecommerce_flutter_bloc/widgets/productDetailsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imagesource;
  final String slug;
  final num? current_charge;
  final num? selling_price;
  final num? profit;
  final num? discount;
  final num? stock;

  const ProductCard(
      {required this.name,
      required this.imagesource,
      required this.slug,
      required this.current_charge,
      required this.selling_price,
      required this.profit,
      required this.discount,
      required this.stock,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quantity = TextEditingController();
    //to handle stream
    final _bloc = Bloc_Counter();
    //in quantityparse setting quantity value
    int? quantityparse = 0;
    var size = MediaQuery.of(context).size;
    return Container(child: BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is InitialSate) {
          //in initial state this wll show a productcard with name and some other information
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => ProductDetailsBloc(),
                        /*this will navigate the system to details page, binding with a bloc to manage details page, also sending slug and quantity.
                        slug will help to fetch individual product, and quantity to store quantity of the product.
                         */
                        child: ProductDetailsCard(
                          slug: slug,
                          quantity: quantityparse,
                        ),
                      )));
            },
            child: SizedBox(
                height: size.height * .40,
                child: Stack(
                  children: [
                    Card(
                      //making product card
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
                              Text(
                                name,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("ক্রয়",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54)),
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
                                      //if no discount then it will be invisible
                                        visible: discount != null,
                                        child: Text("৳ $discount",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.pinkAccent))),
                                  ],
                                ),
                                //©Rakibul Islam
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("বিক্রয়",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54)),
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
                      //if there are no product available then it will be show
                      visible: stock == 0,
                      child: Positioned(
                        width: 120,
                        top: 10,
                        right: 6,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text("স্টকে নেই",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red)),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      //also if no product available then add to cart button will be invisible
                      visible: stock != 0,
                      child: Positioned(
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
                          child: GestureDetector(
                            onTap: () {
                              BlocProvider.of<ProductBloc>(context)
                                  .add(AddProductButton());
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          );
        }
        if (state is AddOptionState) {
          //if add to cart button is pressed then this state will occur with increment and decrement button, other almost everything same to previous state
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => ProductDetailsBloc(),
                        child: ProductDetailsCard(
                          slug: slug,
                          quantity: quantityparse,
                        ),
                      )));
            },
            child: SizedBox(
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
                              Text(
                                name,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("ক্রয়",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54)),
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
                                        visible: discount != null,
                                        child: Text("৳ $discount",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.pinkAccent))),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("বিক্রয়",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54)),
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
                      //if there are no product available then it will be show
                      visible: stock == 0,
                      child: Positioned(
                        width: 120,
                        top: 10,
                        right: 6,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text("স্টকে নেই",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red)),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      //button to increment and decrement, also this will show the quantity
                      bottom: -2,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                //color: Colors.white,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade200,
                                  shape: BoxShape.circle,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    //decrement and triggering decrement event in stream
                                    _bloc.counterEventSink
                                        .add(DecrementEvent(quantityparse!));
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white60,
                                  ),
                                ),
                              ),
                              Container(
                                child: StreamBuilder(
                                  //this streambuilder setting value for quantity on increment and decrement
                                  stream: _bloc.counter,
                                  initialData: 1,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<int> snapshot) {
                                    quantityparse = snapshot.data;
                                    return Text('${snapshot.data} পিস',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.pinkAccent));
                                  },
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                //color: Colors.white,
                                decoration: const BoxDecoration(
                                  color: Colors.indigo,
                                  shape: BoxShape.circle,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    //increment and triggering increment event in stream
                                    _bloc.counterEventSink
                                        .add(IncrementEvent(quantityparse!));
                                    print(quantityparse);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white60,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          );
        }
        return const Center(
          //if anything error in this process
          child: Text("error!"),
        );
      },
    ));
  }
}
