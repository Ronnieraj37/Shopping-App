import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping/models/catalog.dart';
import 'package:shopping/pages/home_detail.dart';
import 'package:shopping/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:lottie/lottie.dart';

class MyApp extends StatefulWidget {
  final String id;
  const MyApp(this.id, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("files/catalog.json");
    var decodeJson = jsonDecode(catalogJson);
    var productData = decodeJson["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "cart");
        },
        backgroundColor: Themes.darkBluish,
        enableFeedback: true,
        child: const Icon(CupertinoIcons.cart_fill),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      backgroundColor: Themes.creamColor,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.apps),
            title: const Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.bag_fill),
            title: const Text(
              'Orders',
            ),
            activeColor: Colors.teal,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.cart_fill),
            title: const Text(
              'Cart',
            ),
            activeColor: Themes.darkBluish,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Settings'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl5.bold.color(Themes.darkBluish).make(),
              "Trending Products".text.xl2.make(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                const CatalogList().py(16).expand()
              else
                LottieBuilder.network(
                  "https://assets8.lottiefiles.com/packages/lf20_x62chJ.json",
                  alignment: Alignment.center,
                  height: 500,
                  width: 500,
                  animate: true,
                  repeat: true,
                  fit: BoxFit.fitWidth,
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final item = CatalogModel.getByPos(index);
        return CatalogItem(item);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  //const CatalogItem({Key? key}) : super(key: key);
  final Item item;
  const CatalogItem(this.item, {super.key});
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(item.id.toString()),
              child: Image.network(item.image)
                  .box
                  .p4
                  .rounded
                  .color(Themes.creamColor)
                  .make()
                  .p8()
                  .w32(context)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.name.text.size(16).color(Themes.darkBluish).bold.make(),
              item.desc.text.size(14).textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: const EdgeInsets.only(right: 10),
                children: [
                  "\$${item.price}".toString().text.size(17).bold.xl.make(),
                  ElevatedButton(
                          onPressed: () {
                            //Navigator.pushNamed(context, "/login");
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Themes.darkBluish),
                            shape: const MaterialStatePropertyAll(
                              StadiumBorder(),
                            ),
                          ),
                          child: const Text("Buy").p8())
                      .px8(),
                ],
              )
            ],
          ))
        ],
      ),
    ).white.rounded.size(150, 130).make().py8().onTap(() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeDetail(item: item),
          ));
    });
  }
}

//const CircularProgressIndicator().centered().expand(),