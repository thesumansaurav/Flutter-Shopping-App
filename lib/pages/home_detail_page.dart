import 'package:flutter/material.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';


class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creameColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl2.make(),
                  ElevatedButton(
                    onPressed: (){}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(const StadiumBorder(),
                      )
                    ),
                    child: "Buy".text.make(),
                    ).wh(100, 50)
                ],
        ).p8(),
      ),
        body: SafeArea(
                  
            child: Column(
                      children: [
                      Hero(
                        tag: Key(catalog.id.toString()),
                        child: Image.network(catalog.image)
                        ).h32(context),
                      Expanded(
                        child: VxArc(
                          height: 30.0,
                          arcType: VxArcType.CONVEY,
                          edge: VxEdge.TOP,
                          child: Container(    
                            width: context.screenWidth,  
                            color: Colors.white,
                            child: Column(
                              children: [
                                catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                                catalog.desc.text.xl.textStyle(context.captionStyle).center.make(),
                                10.heightBox,
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, "
                                .text.textStyle(context.captionStyle).make().p16(),
                        ],
                      ).py64(),
                    ),
                  ))
                ],
             ),
          ),
    );
  }
}