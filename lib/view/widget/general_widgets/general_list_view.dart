import 'package:flutter/material.dart';
import 'package:tourism_app/data/model/trips_model.dart';
import 'card_item.dart';

class GeneralListView extends StatelessWidget {
  final List<TripsModel> list;
  final String type;

  const GeneralListView({super.key, required this.list, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list.length >= 6 ? 6 : list.length,
          itemBuilder: (context, index) {
            return CardItem(
                tripsModel: list[index],
                type: type,
                index: list[index].id!,
                id: list[index].id!,
                favorite: list[index].favourite);
          }),
    );
  }
}
