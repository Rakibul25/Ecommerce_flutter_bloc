import 'package:ecommerce_flutter_bloc/API/fetchData.dart';
import 'package:ecommerce_flutter_bloc/data/model/individuakProductModel.dart';
import 'package:ecommerce_flutter_bloc/logic/search/product_details_bloc/product_details_bloc.dart';
import 'package:ecommerce_flutter_bloc/logic/search/product_details_bloc/product_details_event.dart';
import 'package:ecommerce_flutter_bloc/logic/search/product_details_bloc/product_details_state.dart';
import 'package:ecommerce_flutter_bloc/screens/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
            child: Column(
              children: [
                Expanded(child: BlocBuilder<ProductDetailsBloc,DetailsState>(
                  builder: (context, state){
                    if(state is InitialState){
                      if(widget.quantity==0){
                        BlocProvider.of<ProductDetailsBloc>(context)
                            .add(EventWithoutQuantity(widget.slug));
                      }else{
                        BlocProvider.of<ProductDetailsBloc>(context)
                            .add(EventWithQuantity(widget.slug));
                      }
                      return Center(child: CircularProgressIndicator());
                    }
                    if(state is ProductWithoutQuantity){
                      return Center(child: Text(state.individualProduct.data.id.toString()));
                    }
                    if(state is ProductWithQuantity){
                      return Center(child: Text(state.individualProduct.data.id.toString()));
                    }
                    return Text("errror");
                  },
                ))
              ],
            )
        ));
  }
}
