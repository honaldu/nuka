import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'SizeConfig.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  bool available = true;


  InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;


  List<ProductDetails> _products = [];


  List<PurchaseDetails> _purchases = [];


  StreamSubscription _subscription;

  int _credits = 0;

  String ProductId = 'com.nuka.point1000';


  void _initialize() async {

    // Check availability of In App Purchases
    available = await _iap.isAvailable();

    if (available) {
      print('aa');
      await _getProducts();
      await _getPastPurchases();

      // Verify and deliver a purchase with your own business logic
      _verifyPurchase();

    }

    _subscription = _iap.purchaseUpdatedStream.listen((data) => setState(() {
      print('NEW PURCHASE');
      _purchases.addAll(data);
      _verifyPurchase();
    }));

  }

  Future<void> _getProducts() async {
    print('getproduct');
    const Set<String> _kIds = {'com.nuka.point1000' ,'com.nuka.point5000', 'com.nuka.point10000'};
//    Set<String> ids = Set.from([ProductId, 'com.nuka.point5000', 'com.nuka.point10000']);
    print(_kIds);
    ProductDetailsResponse response = await _iap.queryProductDetails(_kIds);
    print(response.productDetails);
    print(response.notFoundIDs);
    setState(() {
      _products = response.productDetails;
    });
  }

  Future<void> _getPastPurchases() async {
    QueryPurchaseDetailsResponse response =
    await _iap.queryPastPurchases();
    print(response);
    for (PurchaseDetails purchase in response.pastPurchases) {
      if (Platform.isIOS) {
        print(purchase);
        InAppPurchaseConnection.instance.completePurchase(purchase);
      }
    }

    setState(() {
      _purchases = response.pastPurchases;
    });
  }

  PurchaseDetails _hasPurchased(String productID) {
    return _purchases.firstWhere( (purchase) => purchase.productID == productID, orElse: () => null);
  }

  void _verifyPurchase() {
    print('_verifyPurchase');
    PurchaseDetails purchase = _hasPurchased(ProductId);

    // TODO serverside verification & record consumable in the database

    if (purchase != null && purchase.status == PurchaseStatus.purchased) {
      _credits = 10;
    }
  }

  void _buyProduct(ProductDetails prod) {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: prod);
    // _iap.buyNonConsumable(purchaseParam: purchaseParam);
    _iap.buyConsumable(purchaseParam: purchaseParam, autoConsume: false);
  }

  @override
  void initState() {
    // TODO: implement initState
    _initialize();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(236, 128, 130, 1.0),
        ),
        title: Text(
          '${_credits} Point',
          style: TextStyle(
            color: Color.fromRGBO(236, 128, 130, 1.0),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[InkWell(
                onTap: () {},
                child: Container(
                  width: 80 * SizeConfig.widthMultiplier,
                  height: 8 * SizeConfig.heightMultiplier,
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  margin: EdgeInsets.fromLTRB(
                    2 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    2 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.grey[300]),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Icon(
                          Icons.monetization_on,
                          color: Color.fromRGBO(236, 128, 130, 1.0),
                          size: 8 * SizeConfig.widthMultiplier,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          '15 Points',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6 * SizeConfig.widthMultiplier,
                            color: Color.fromRGBO(236, 128, 130, 1.0),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          '\$ 5',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6 * SizeConfig.widthMultiplier,
                            color: Color.fromRGBO(236, 128, 130, 1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),InkWell(
                onTap: () {},
                child: Container(
                  width: 80 * SizeConfig.widthMultiplier,
                  height: 8 * SizeConfig.heightMultiplier,
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  margin: EdgeInsets.fromLTRB(
                    2 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    2 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.grey[300]),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Icon(
                          Icons.monetization_on,
                          color: Color.fromRGBO(236, 128, 130, 1.0),
                          size: 8 * SizeConfig.widthMultiplier,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          '15 Points',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6 * SizeConfig.widthMultiplier,
                            color: Color.fromRGBO(236, 128, 130, 1.0),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          '\$ 5',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6 * SizeConfig.widthMultiplier,
                            color: Color.fromRGBO(236, 128, 130, 1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),InkWell(
                onTap: () {},
                child: Container(
                  width: 80 * SizeConfig.widthMultiplier,
                  height: 8 * SizeConfig.heightMultiplier,
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  margin: EdgeInsets.fromLTRB(
                    2 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    2 * SizeConfig.widthMultiplier,
                    1 * SizeConfig.heightMultiplier,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.grey[300]),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(3.0, 3.0))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Icon(
                          Icons.monetization_on,
                          color: Color.fromRGBO(236, 128, 130, 1.0),
                          size: 8 * SizeConfig.widthMultiplier,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          '15 Points',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6 * SizeConfig.widthMultiplier,
                            color: Color.fromRGBO(236, 128, 130, 1.0),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(
                          0.5 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                          2 * SizeConfig.widthMultiplier,
                          1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          '\$ 5',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6 * SizeConfig.widthMultiplier,
                            color: Color.fromRGBO(236, 128, 130, 1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),],
            ),
          ),
        ],
      ),
    );
  }
}
