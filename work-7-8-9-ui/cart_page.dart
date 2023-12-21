import 'package:flutter/material.dart';
import 'package:mobile_odev_2/item_list_page.dart';
import 'package:mobile_odev_2/product_item.dart';

class Cart extends StatefulWidget {
  const Cart({super.key, required this.itemList});
  final List<Map<ProductItem, double>> itemList;
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<Map<ProductItem, double>> itemList = widget.itemList;
    double totalPrice = itemList
        .map((item) => item.keys.first.price * item.values.first)
        .fold(0, (prev, price) => prev + price);
    double totalItem = itemList
        .map((e) => e.values.first)
        .fold(0, (previousValue, element) => previousValue + element);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Sepet"),
        toolbarHeight: 50,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded)),
      ),
      body: Column(
        children: [
          Expanded(
            child: itemList.isNotEmpty
                ? ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(itemList[index].keys.first.image),),
                                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                                height: 80,
                                width: 80,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      child: getText(itemList[index].keys.first.name,Colors.black,14,FontWeight.normal,TextAlign.center),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      child: getText("${itemList[index].keys.first.price.toString()} ₺",Colors.black,15,FontWeight.w900,TextAlign.center),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          child: const Icon(Icons.remove_rounded,color: Colors.red,),
                                          onTap: () {
                                            if (itemList[index].values.first != 1) {
                                              itemList[index] = {itemList[index].keys.first: itemList[index].values.first - 1};}
                                            else {
                                              itemsAddedToCart.remove(itemList[index]);}
                                            setState(() {});
                                          },
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 6),
                                          child: getText(itemList[index].values.first.toStringAsFixed(0),Colors.black,15,FontWeight.normal,TextAlign.center),
                                        ),
                                        GestureDetector(
                                          child: const Icon(Icons.add_shopping_cart_rounded,color: Colors.blue,),
                                          onTap: () {
                                            itemList[index] = {itemList[index].keys.first: itemList[index].values.first + 1};
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        getText("Sepetten sil",Colors.red,12,FontWeight.normal,TextAlign.end),
                                        GestureDetector(
                                          child: const Center(
                                              child: Icon(Icons.highlight_remove_rounded, color: Colors.red)),
                                          onTap: () {
                                            itemsAddedToCart.remove(itemList[index]);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                getSnackBar(Colors.blueAccent, "Ürün Sepetten Kaldırıldı", const Duration(milliseconds: 500),)
                                            );
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : SizedBox(
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.hourglass_empty_rounded),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: getText("Sepet boş",Colors.black,16,FontWeight.normal,TextAlign.center),
                        ),
                      ],
                    )),
          ),
          Visibility(
            visible: itemList.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getText("${totalItem.toStringAsFixed(0)} Adet Ürün İçin Toplam Tutar",Colors.black,15,FontWeight.normal,TextAlign.start),
                  getText("${totalPrice.toStringAsFixed(2)} ₺",Colors.black,16,FontWeight.w900,TextAlign.end),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: itemList.isNotEmpty,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      itemsAddedToCart.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                          getSnackBar(Colors.blueAccent, "Sepet Temizlendi", const Duration(milliseconds: 500),)
                      );
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 30,
                      width: 140,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: getText("Sepeti temizle",Colors.white,16,FontWeight.normal,TextAlign.center)
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: itemList.isNotEmpty,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                        getSnackBar(Colors.blueAccent, "Sepet Onaylandı", const Duration(milliseconds: 500),)
                      );
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 30,
                      width: 140,
                      decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: getText("Sepeti onayla",Colors.white,16,FontWeight.normal,TextAlign.center),),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  SnackBar getSnackBar(Color color, String text, Duration duration){
    return SnackBar( behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      duration: duration,
      content: Text(
        text,
        style: const TextStyle(fontSize: 16, height: 1),
      ),);
  }

  Text getText(String text,Color color,double size, FontWeight weight, TextAlign align){
    return Text(text,style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
      height:1,
    ),textAlign: align,);
  }
}
