import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/market_list_response.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchLocations extends SearchDelegate<String> {
  final List<ListElement> allList;
  final List<ListElement> suggestionList;

  SearchLocations({required this.allList, required this.suggestionList});

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        color: Color(0xFF95969D),
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'OpenSans',
      );

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Qidirish';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            close(context, query);
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, query);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<ListElement> allSortedList = allList
        .where((element) =>
            element.marketName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: allSortedList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            query = allSortedList[index].marketName;
            context.push(
              Routes.fairPriceProductList,
              extra: {
                "marketId": allSortedList[index].id,
                'isMarketEmployee': false
              },
            );
            close(context, query);
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              tileColor: Colors.grey.shade300,
              title: Text(allSortedList[index].marketName),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ListElement> allSuggestionList = suggestionList
        .where((element) =>
            element.marketName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: allSuggestionList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            query = allSuggestionList[index].marketName;
            context.push(
              Routes.fairPriceProductList,
              extra: {
                "marketId": allSuggestionList[index].id,
                'isMarketEmployee': false
              },
            );
            close(context, query);
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              tileColor: Colors.grey.shade300,
              title: Text(allSuggestionList[index].marketName),
            ),
          ),
        );
      },
    );
  }
}
