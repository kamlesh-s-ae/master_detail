import 'package:master_detail/item.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key,
    required this.isInTabletLayout,
    required this.item,
  });

  final bool isInTabletLayout;
  final Item? item;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          item?.title ?? 'No item selected!',
          style: textTheme.headline1,
        ),
        Text(
          item?.subtitle ?? 'Please select one on the left.',
          style: textTheme.subtitle1,
        ),
      ],
    );

    if (isInTabletLayout) {
      return Center(child: content);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item?.title ?? "Kamlesh"),
      ),
      body: Center(child: content),
    );
  }
}
