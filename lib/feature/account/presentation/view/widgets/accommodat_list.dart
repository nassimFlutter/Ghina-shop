import 'package:best_price/feature/account/presentation/manager/add_address/add_address_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/change_address_page/change_address_page_cubit.dart';
import 'package:best_price/feature/account/presentation/view/pages/add_address_page_view.dart';
import 'package:flutter/material.dart';

import 'accommodation_card.dart';

class AccommodatList extends StatelessWidget {
  const AccommodatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ChangeAddressPageCubit changeAddressPageCubit =
        ChangeAddressPageCubit.get(context);
    AddAddressCubit addAddressCubit = AddAddressCubit.get(context);

    return ListView.builder(
        padding: EdgeInsets.zero,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              changeAddressPageCubit.changePage(index);
              addAddressCubit.clearControllers();
            },
            child: AccommodationCard(
              title: changeAddressPageCubit.accommodationTypeList[index],
              index: index,
              selectedIndex: changeAddressPageCubit.selectedIndex,
            ),
          );
        });
  }
}
