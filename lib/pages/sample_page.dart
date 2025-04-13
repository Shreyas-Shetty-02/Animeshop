import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/cart.dart';
import '../models/catalog.dart';
import '../utlis/routes.dart';
import '../widgets/home_widgets/catalogHeader.dart';
import '../widgets/home_widgets/catalog_list.dart';

class Sample_Page extends StatefulWidget {
  const Sample_Page({super.key});

  @override
  State<Sample_Page> createState() => _Sample_PageState();
}

class _Sample_PageState extends State<Sample_Page> {
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
        await rootBundle.loadString("assets/files/Catalog2.json");
    // final response = await http.get(Uri.ht(url));
    // final catalogJson = response.body;
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["samples"];

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
        title: Text(
          "Animeshop",
          style: TextStyle(color: context.theme.focusColor),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, dynamic, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.dialogBackgroundColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.white,
            size: 22,
            count: _cart.items.length,
            textStyle: TextStyle(
              color: context.theme.dialogBackgroundColor,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader2(),
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

class CatalogHeader2 extends StatelessWidget {
  const CatalogHeader2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Demon Slayer Products"
            .text
            .xl2
            .bold
            .color(context.theme.focusColor)
            .make(),
      ],
    );
  }
}
