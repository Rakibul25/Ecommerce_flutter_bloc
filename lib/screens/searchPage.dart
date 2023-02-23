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
      backgroundColor: Colors.grey.shade100,
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
                  fillColor: Colors.black12,
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
                              return Container(
                                alignment: Alignment.topCenter,
                                height: size.height * .55,
                                child: ProductCard(
                                  name: state.products!.data!.products!
                                      .results[index]!.productName,
                                  imagesource: state.products!.data!.products!
                                      .results[index]!.image,
                                  current_charge: state
                                      .products!
                                      .data!
                                      .products!
                                      .results[index]!
                                      .charge!
                                      .currentCharge,
                                  selling_price: state.products!.data!.products!
                                      .results[index]!.charge!.sellingPrice,
                                  profit: state.products!.data!.products!
                                      .results[index]!.charge!.profit,
                                  discount: state.products!.data!.products!
                                      .results[index]!.charge!.discountCharge, stock: state.products!.data!.products!
                                    .results[index]!.stock,
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 5,
                              childAspectRatio: 0.6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  child: Text("<<Prev"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    elevation: 0,
                                  ),
                                  onPressed: () {},
                                ),
                                ElevatedButton(
                                  child: Text("Next>>"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    elevation: 0,
                                  ),
                                  onPressed: () {},
                                ),

                              ],
                            ),
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
