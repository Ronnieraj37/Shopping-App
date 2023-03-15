import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.creamColor,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Themes.creamColor,
      //   elevation: 8,
      //   enableFeedback: true,
      //   onPressed: (){Navigator.pop(context) ;},
      //   child:  Container(
      //     padding: const EdgeInsets.all(10.0),
      //     child: Icon(CupertinoIcons.back,color: Themes.darkBluish,size: 20,),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      appBar: AppBar(title: "Cart".text.xl3.make()),
      body: Column(
        children: [
          const _CartList().p(32).expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$999".text.xl4.semiBold.make(),
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: "NOT Supported yet🥲".text.xl.semiBold.center.make(),
                duration: const Duration(seconds: 2),
               //animation: CurvedAnimation(curve: Curves.bounceIn, parent: kAlwaysCompleteAnimation),
              ));
            },
            style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(5),
              backgroundColor: MaterialStatePropertyAll(Colors.black),
              padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
              shape: MaterialStatePropertyAll(StadiumBorder(side: BorderSide(width: 5)),
              ),
            ),
            child: "Place Order".text.make(),
          ).scale110(),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) =>
          ListTile(
            leading: const Icon(Icons.check),
            trailing: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.remove_circle),
            ),
            title: "Item index".text.make(),
          )
    );
  }
}




