import 'package:flutter/material.dart';

import '../models/catalog.dart';
class ItemWidgets extends StatelessWidget {
  const ItemWidgets({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
        child: ListTile(
          onTap: (){
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            textScaleFactor: 1.5,
            style: const TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
  }
}


