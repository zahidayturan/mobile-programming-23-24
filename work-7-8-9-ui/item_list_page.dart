import 'package:flutter/material.dart';
import 'package:mobile_odev_2/cart_page.dart';
import 'package:mobile_odev_2/product_item.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key, required this.title});
  final String title;
  @override
  State<ItemList> createState() => _ItemListState();
}

final List<ProductItem> _items = [
  ProductItem(
      0,
      "https://images.pexels.com/photos/1772973/pexels-photo-1772973.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Dağ (Tablo)",
  250),
  ProductItem(
    1,
      "https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Yol (Tablo)",
  150),
];
final List<Map<ProductItem,double>> itemsAddedToCart = [];

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    double totalItem = itemsAddedToCart.map((e) => e.values.first).fold(0, (previousValue, element) => previousValue + element);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
        toolbarHeight: 50,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width/2,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 64,
              color: Colors.blueAccent,
              child: Center(child:
              getText('Yardımcı Menü',Colors.white, 16, FontWeight.w400, TextAlign.center),
            ),
            ),
            ListTile(
              title: getText('Sepete Git (${totalItem.toStringAsFixed(0)})', Colors.black, 15, FontWeight.normal, TextAlign.start),
              leading: Icon(Icons.shopping_cart,color: Colors.black,),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context) => Cart(itemList: itemsAddedToCart)),).then((result) {setState(() {});
                },);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            int addCount = 0;
            itemsAddedToCart.forEach((element) { 
              if(element.keys.first.id == _items[index].id){
                addCount = element.values.first.toInt();
              }
            });
            return Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_items[index].image),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: getText(_items[index].name,Colors.black, 16, FontWeight.normal, TextAlign.start),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: getText("${_items[index].price.toString()} ₺",Colors.black,16,FontWeight.w900,TextAlign.start),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: addCount == 0,
                      child: getText("Sepete Ekle",Colors.black,12,FontWeight.normal,TextAlign.center),
                    ),
                    Visibility(
                      visible: addCount >0,
                      child: IconButton(onPressed: () {
                        for (var element in itemsAddedToCart) {
                          if (element.keys.first.id == _items[index].id) {
                            element[element.keys.first] = element.values.first - 1;
                            if(element.values.first == 0){
                              itemsAddedToCart.remove(element);
                            }
                            break;
                          }
                        }
                        setState(() {});
                      }, icon: Icon(Icons.remove_rounded),color: Colors.red,),
                    ),
                    Visibility(
                        visible: addCount >0,
                        child: Text(addCount.toStringAsFixed(0))),
                    IconButton(onPressed: () {
                      bool itemExists = false;
                      for (var element in itemsAddedToCart) {
                        if (element.keys.first.id == _items[index].id) {
                          element[element.keys.first] = element.values.first + 1;
                          itemExists = true;
                          break;
                        }
                      }
                      if (!itemExists) {
                        itemsAddedToCart.add({_items[index]: 1});
                        ScaffoldMessenger.of(context).showSnackBar(
                          getSnackBar(Colors.blueAccent,"Ürün Sepete Eklendi",Duration(milliseconds: 500)),
                        );
                      }
                      setState(() {});
                    }, icon: Icon(Icons.add_shopping_cart_rounded),color: Colors.blueAccent),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }

  SnackBar getSnackBar(Color color, String text, Duration duration){
    return SnackBar( behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      duration: duration,
      content: Text(
        text,
        style: TextStyle(fontSize: 16, height: 1),
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