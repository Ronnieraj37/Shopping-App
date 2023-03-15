import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/models/catalog.dart';
import 'package:shopping/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
class HomeDetail extends StatelessWidget {
  final Item item;
  const HomeDetail({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceAround,
        buttonPadding: const EdgeInsets.all(25),
        children: [
          "\$${item.price}".toString().text.size(17).bold.xl3.red800.make(),
          ElevatedButton(onPressed: (){//Navigator.pushNamed(context, "/login");
             },
            onLongPress: (){},
            style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Themes.darkBluish),
            shape: const MaterialStatePropertyAll(StadiumBorder()),
            ), child: const Icon(CupertinoIcons.cart_fill_badge_plus,size: 30),
          ).w20(context),
        ],
      ),
      backgroundColor: Themes.creamColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Themes.creamColor,
        elevation: 8,
        enableFeedback: true,
        onPressed: (){Navigator.pop(context) ;},
        child:  Container(
          padding: const EdgeInsets.all(10.0),
          child: Icon(CupertinoIcons.back,color: Themes.darkBluish),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(item.id.toString()),
              child: Image.network(item.image),
            ).h40(context),
            // item.name.text.make(),
            Expanded(child: VxArc(
              height: 30,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                padding: const EdgeInsets.all(0),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    60.heightBox,
                    item.name.text.size(16).xl2.color(Themes.darkBluish).bold.make(),
                    10.heightBox,
                    item.desc.text.size(14).xl.textStyle(context.captionStyle).make(),
                    30.heightBox,
                    "Diam sagittis in elementum consectetuer odio Conubia aptent quis duis ante.\nPotenti potenti. Dolor eleifend varius, magnis a elementum Porttitor. Ullamcorper metus. \nCursus nonummy platea blandit hendrerit, platea dui et.Phasellus euismod. Vivamus. \nScelerisque luctus potenti torquent nostra Pulvinar non inceptos vitae mauris sed amet per mi posuere curabitur dictumst.".text.textStyle( context.captionStyle).size(15).make().p16(),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),

    );
  }
}
