import 'package:flutter/material.dart';
import 'package:mobile_health/models/EntryType.dart';

class HomeCategoryItem extends StatefulWidget {

  final EntryType entryType;
  HomeCategoryItem({
    EntryType entryType
  }): this.entryType = entryType;


  @override
  _HomeCategoryItemState createState() => _HomeCategoryItemState(entryType);
}

class _HomeCategoryItemState extends State<HomeCategoryItem> {

  _HomeCategoryItemState(this.entryType);
  final EntryType entryType;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          onTap: () {},
          title: Text(
            entryType.name,
          ),
        ),
      ),
    );
  }
}
