import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animeshop/core/store.dart';
import 'package:animeshop/models/cart.dart';
import 'package:animeshop/models/catalog.dart';
import 'package:animeshop/utlis/routes.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/services.dart';
import '../widgets/home_widgets/catalogHeader.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name = "hi";

  // final url =
  //     "https://jsoneditoronline.org/#left=cloud.ed9e767531ff4713b48d7568e1f3bd32";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData();
  }

  LoadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/Catalog.json");
    // final response = await http.get(Uri.ht(url));
    // final catalogJson = response.body;
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];

    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.theme.focusColor),
        backgroundColor: context.theme.canvasColor,
        title: Text("Animeshop",
            style: TextStyle(color: context.theme.focusColor)),
        centerTitle: true,
      ),
      drawer: Drawer(),
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, dynamic, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.backgroundColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.white,
            size: 22,
            count: _cart.items.length,
            textStyle: TextStyle(
              color: context.theme.backgroundColor,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                Center(
                  child: CircularProgressIndicator().centered(),
                ).expand()
            ],
          ),
        ),
      ),
    );
  }
}
