import 'package:master_detail/item.dart';
import 'package:master_detail/item_details.dart';
import 'package:master_detail/item_listing.dart';
import 'package:flutter/material.dart';

class MasterDetailContainer extends StatefulWidget {
  const MasterDetailContainer({super.key});

  @override
  State<MasterDetailContainer> createState() => _ItemMasterDetailContainerState();
}

class _ItemMasterDetailContainerState extends State<MasterDetailContainer> {
  static const int kTabletBreakpoint = 600;

  Item _selectedItem = Item(title: "title", subtitle: "subtitle");

  Widget _buildMobileLayout() {
    return ItemListing(
      itemSelectedCallback: (item) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ItemDetails(
                isInTabletLayout: false,
                item: item,
              );
            },
          ),
        );
      }, selectedItem: _selectedItem,
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Material(
            elevation: 4.0,
            child: ItemListing(
              itemSelectedCallback: (item) {
                setState(() {
                  _selectedItem = item;
                });
              },
              selectedItem: _selectedItem,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: ItemDetails(
            isInTabletLayout: true,
            item: _selectedItem,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.width;

    if (shortestSide < kTabletBreakpoint) {
      content = _buildMobileLayout();
    } else {
      content = _buildTabletLayout();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Master-detail flow sample'),
      ),
      body: content,
    );
  }
}
