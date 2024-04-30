import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glassmorphism/glassmorphism.dart';


class ShopHomePage extends StatefulWidget {
  @override
  _ShopHomePageState createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  List<Shop> shops = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shop Home')),
      body: ListView.builder(
        itemCount: shops.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(shops[index].icon),
            title: Text(shops[index].name),
            subtitle: Text(shops[index].address),
            onTap: () {
              // Navigate to shop detail page
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddShopDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddShopDialog(BuildContext context) async {
    String shopName = '';
    String shopAddress = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Shop'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => shopName = value,
                decoration: InputDecoration(labelText: 'Shop Name'),
              ),
              TextField(
                onChanged: (value) => shopAddress = value,
                decoration: InputDecoration(labelText: 'Shop Address'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _addShop(shopName, shopAddress);
                Navigator.of(context).pop();
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _addShop(String name, String address) {
    // Add shop to list
    setState(() {
      shops.add(Shop(name: name, address: address, icon: Icons.shop));
    });

    // Store shop in Firestore
    FirebaseFirestore.instance.collection('shops').add({
      'name': name,
      'address': address,
      // Add other fields as needed
    });
  }
}

class Shop {
  final String name;
  final String address;
  final IconData icon;

  Shop({required this.name, required this.address, required this.icon});
}
