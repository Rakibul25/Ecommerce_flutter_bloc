import 'package:ecommerce_flutter_bloc/logic/search/Product_Card_In_SearchPage_bloc/productBloc.dart';
import 'package:ecommerce_flutter_bloc/logic/search/search_bloc/searchBloc.dart';
import 'package:ecommerce_flutter_bloc/logic/search/search_bloc/searchEvent.dart';
import 'package:ecommerce_flutter_bloc/logic/search/search_bloc/searchState.dart';
import 'package:ecommerce_flutter_bloc/widgets/productCard.dart';
import 'package:ecommerce_flutter_bloc/widgets/productDetailsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController query = TextEditingController();
  bool tapAdd = false;
  List<String> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: query,
                decoration: InputDecoration(
                  hintText: 'কাঙ্ক্ষিত পণ্যটি খুজুন',
                  suffixIcon: GestureDetector(
                      onTap: () {
                        BlocProvider.of<searchBloc>(context)
                            .add(SearchIconPressed(query.text));
                        //triggering SearchIconPressed event in bloc after initial state
                      },
                      child: const Icon(Icons.search)),
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
              child: BlocBuilder<searchBloc, SearchState>(
                  builder: (context, state) {
                if (state is InitialSate) {
                  //this state is initial, after opening app this page will show.
                  return const Center(
                    child: Text("Search what you want!"),
                  );
                }
                if (state is NoResultState) {
                  return Center(
                    //this is if there is no similar data or any problem, and this will show "nothing similar to search keyword"
                    child: Text(state.error),
                  );
                }
                if (state is ResultLoadingState) {
                  return const Center(
                    //this is for loading state
                    child: CircularProgressIndicator(),
                  );
                }
                //storing query data in q as text.
                String q = query.text;
                if (state is ResultLoadedState &&
                    state.products!.data!.products!.results.length == 0) {
                  /*this is for if somehow something found in api by search keyword but actual there are nothing to show then
                  this will show again nothing similar to search keyword*/
                  return Center(
                    child: Text("Nothing Similar to $q"),
                  );
                }
                if (state is ResultLoadedState) {
                  /*this is result loaded state, if the system get product with similar to search product then this gridview will make
                  gridview with those data.
                   */
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            //length of data list
                            itemCount:
                                state.products!.data!.products!.results.length,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.topCenter,
                                height: size.height * .55,
                                child: Stack(
                                  children: [
                                    //providing productbloc, as we need it in every item
                                    BlocProvider(
                                      create: (context) => ProductBloc(),
                                      child: ProductCard(
                                        //this card will receive name,iamge,slug,current_charge,selling_price,profit,discount,stock
                                        name: state.products!.data!.products!
                                            .results[index]!.productName,
                                        imagesource: state.products!.data!
                                            .products!.results[index]!.image,
                                        slug: state.products!.data!.products!
                                            .results[index]!.slug,
                                        current_charge: state
                                            .products!
                                            .data!
                                            .products!
                                            .results[index]!
                                            .charge!
                                            .currentCharge,
                                        selling_price: state
                                            .products!
                                            .data!
                                            .products!
                                            .results[index]!
                                            .charge!
                                            .sellingPrice,
                                        profit: state.products!.data!.products!
                                            .results[index]!.charge!.profit,
                                        discount: state
                                            .products!
                                            .data!
                                            .products!
                                            .results[index]!
                                            .charge!
                                            .discountCharge,
                                        stock: state.products!.data!.products!
                                            .results[index]!.stock,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            //©Rakibul Islam
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 5,
                              childAspectRatio: 0.6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              /*it's possible that the api gives the system infinite data, that's why the system will show 10 data
                              initially, then with previous or next button system will load more
                               */
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /*if there are previous link or product then this will visible, as in first page there is no possible
                                previous page state so this will be invisible. from second page it will show prev button to come back.
                                 */
                                Visibility(
                                  visible: state
                                          .products!.data!.products!.previous !=
                                      null,
                                  child: ElevatedButton(
                                    child: const Text("<<Prev"),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      elevation: 0,
                                    ),
                                    onPressed: () {
                                      BlocProvider.of<searchBloc>(context).add(
                                          NextButtonPressed(state.products!
                                              .data!.products!.previous));
                                    },
                                  ),
                                ),
                                /* this is for next button, if the api have more than 10 data then this next button will be
                                visible, when there are no data in the list it will be invisible.
                                 */
                                Visibility(
                                  visible:
                                      state.products!.data!.products!.next !=
                                          null,
                                  child: ElevatedButton(
                                    child: const Text("Next>>"),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      elevation: 0,
                                    ),
                                    onPressed: () {
                                      BlocProvider.of<searchBloc>(context).add(
                                          NextButtonPressed(state
                                              .products!.data!.products!.next));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return const Center(
                  //this is for if something occur in this process
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
