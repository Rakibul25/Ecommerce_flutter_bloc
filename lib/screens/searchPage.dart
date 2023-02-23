import 'package:ecommerce_flutter_bloc/logic/search/search_cubit/searchCubit.dart';
import 'package:ecommerce_flutter_bloc/logic/search/search_cubit/searchState.dart';
import 'package:ecommerce_flutter_bloc/widgets/productCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';
  List<String> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) {
                  _searchQuery = value;
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<searchCubit, searchState>(
                  builder: (context, state) {
                if (state is ResultLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ResultLoadedState) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                state.products!.data!.products!.results.length,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                name: state.products!.data!.products!
                                    .results[index]!.productName,
                                imagesource: state.products!.data!.products!
                                    .results[index]!.image,
                                current_charge: state.products!.data!.products!
                                    .results[index]!.charge!.currentCharge,
                                selling_price: state.products!.data!.products!
                                    .results[index]!.charge!.sellingPrice,
                                profit: state.products!.data!.products!
                                    .results[index]!.charge!.profit,
                                discount: state.products!.data!.products!
                                    .results[index]!.charge!.discountCharge,
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              childAspectRatio: 0.6,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("prev"), Text("Next")],
                          )
                        ],
                      ),
                    ),
                  );
                }
                if (state is NoResultState) {
                  return Center(
                    child: Text("error!"),
                  );
                }
                return Center(
                  child: Text("error!"),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
