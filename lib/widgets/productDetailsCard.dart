import 'package:ecommerce_flutter_bloc/logic/search/product_details_bloc/product_details_bloc.dart';
import 'package:ecommerce_flutter_bloc/logic/search/product_details_bloc/product_details_event.dart';
import 'package:ecommerce_flutter_bloc/logic/search/product_details_bloc/product_details_state.dart';
import 'package:ecommerce_flutter_bloc/screens/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:html/parser.dart';

class ProductDetailsCard extends StatefulWidget {
  final String slug;
  final int? quantity;

  const ProductDetailsCard(
      {required this.slug, required this.quantity, Key? key})
      : super(key: key);

  @override
  State<ProductDetailsCard> createState() => _ProductDetailsCardState();
}

class _ProductDetailsCardState extends State<ProductDetailsCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
            child: Column(
              children: [
                Expanded(child: BlocBuilder<ProductDetailsBloc, DetailsState>(
                  builder: (context, state) {
                    if (state is InitialState) {
                      if (widget.quantity == 0) {
                        BlocProvider.of<ProductDetailsBloc>(context)
                            .add(EventWithoutQuantity(widget.slug));
                      } else {
                        BlocProvider.of<ProductDetailsBloc>(context)
                            .add(EventWithQuantity(widget.slug));
                      }
                      return Center(child: CircularProgressIndicator());
                    }

                    if (state is ProductWithQuantity) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  //color: Colors.white,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchPage()));
                                    },
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("প্রোডাক্ট ডিটেইল",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, right: 18.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'কাঙ্ক্ষিত পণ্যটি খুজুন',
                                  suffixIcon: GestureDetector(
                                      child: Icon(Icons.search)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),

                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, bottom: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: size.height * .2,
                                    width: size.width * .18,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  SizedBox(
                                      width: size.width * .02
                                  ),
                                  SizedBox(
                                    child: Container(
                                        child: Image.network(
                                          state.individualProduct.data.image.toString(),
                                          height: size.height*.3,
                                          width: size.width*.6,
                                        ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: size.width * .02
                                  ),
                                  Container(
                                    height: size.height * .2,
                                    width: size.width * .18,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text("Hi"),
                            Text(widget.slug.toString()),


                          ],
                        ),
                      );
                    }
                    if(state is ProductWithoutQuantity){
                      String ht = state.individualProduct.data.description;
                      var doucment = parse(ht);
                      var text = doucment.body?.text;
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    //color: Colors.white,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchPage()));
                                      },
                                      child: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("প্রোডাক্ট ডিটেইল",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'কাঙ্ক্ষিত পণ্যটি খুজুন',
                                    suffixIcon: GestureDetector(
                                        child: Icon(Icons.search)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),

                                    filled: true,
                                    fillColor: Colors.black12,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: size.height * .2,
                                      width: size.width * .18,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    SizedBox(
                                        width: size.width * .02
                                    ),
                                    SizedBox(
                                      child: Container(
                                        child: Image.network(
                                          state.individualProduct.data.image.toString(),
                                          height: size.height*.3,
                                          width: size.width*.6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width: size.width * .02
                                    ),
                                    Container(
                                      height: size.height * .2,
                                      width: size.width * .18,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(state.individualProduct.data.productName.toString(),style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("ব্রাণ্ড:",style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,color: Colors.black54)),
                                    SizedBox(width: 5),
                                    Text(state.individualProduct.data.brand.name.toString(),style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                    SizedBox(width: 15),
                                    Icon(Icons.circle,size: 10,),
                                    SizedBox(width: 15),
                                    Text("ডিস্ট্রিবিউটর:",style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,color: Colors.black54)),
                                    SizedBox(width: 5),
                                    Text(state.individualProduct.data.distributors.toString(),style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Container(
                                  height: size.height*.15,
                                  width: size.width*.93,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("ক্রয়মূল্য ",style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,color: Colors.pinkAccent)),
                                            Text("৳ ${state.individualProduct.data.charge.currentCharge.toString()}",style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,color: Colors.pinkAccent)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("বিক্রয়মূল্য  ",style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,color: Colors.black)),
                                            Text("৳ ${state.individualProduct.data.charge.sellingPrice.toString()}",style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,color: Colors.black)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        DottedLine(
                                          dashColor: Colors.grey,
                                          dashGapLength: 5.0,
                                          dashLength: 7.0,
                                          lineThickness: 1.0,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("লাভ  ",style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,color: Colors.black)),
                                            Text("৳ ${state.individualProduct.data.charge.profit.toString()}",style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("বিস্তারিত ",style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        child: Text(text!))
                                  ],
                                ),
                              )


                            ],
                          ),
                        ),
                      );
                    }
                    return Text("errror");
                  },
                ))
              ],
            )
        ));
  }
}
