import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];

    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeAPP")
      ),
        body: (CatalogModel.items != null) 
        ? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            ), 
          itemBuilder: (context, index){
            final item = CatalogModel.items![index];
            return Card(
              child: GridTile(
                header: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  child: Text(
                    item.name,
                    style: const TextStyle(color: Colors.white)),
                  ),
                child: Image.network(item.image),
                footer: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration( 
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: Text(
                    item.price.toString(),
                    style: const TextStyle(color: Colors.white)),
                  ),
                )
              );
          }, 
          itemCount: CatalogModel.items!.length,
          )
        // ListView.builder(
        //   itemCount: CatalogModel.items?.length,
        //   itemBuilder: (context, index) {
        //     return ItemWidget(item: CatalogModel.items![index]);
        //   })
        : const Center(child: CircularProgressIndicator(),
          ),
      drawer: const MyDrawer(),
      );
  }
}