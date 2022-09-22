
import 'package:flutter/material.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../themes.dart';
import 'catalog_image.dart';


class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount : CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context)=>HomeDetailPage(catalog: catalog)
              )
              ),
          child: CatalogItem(catalog: catalog)
          );
      },
      );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
         Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image:catalog.image)),
         Expanded(          
          child: Column(           
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.bold.lg.make(),
                _AddToCart(catalog : catalog),
              ],
            ).pOnly(right: 8)
          ],
          )
          )
      ],
      )
    ).white.roundedLg.square(120).make().py(16);
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key, required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {

   bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {
          
        });
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
        shape: MaterialStateProperty.all(const StadiumBorder(),
        )
      ),
      child: isAdded? Icon(Icons.done) : "Add".text.make(),
      );
  }
}
