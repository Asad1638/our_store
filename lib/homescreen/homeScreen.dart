
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:our_store/shops/shopHomeScreen.dart';

import 'gridItemswidgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        titleSpacing: 20,
      
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
          //  Background image covering the entire screen
            Container(
              height: MediaQuery.of(context).size.height *1.20, // Increase height here
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/home.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
              //  color: Colors.black.withOpacity(0.2 ),
                height: MediaQuery.of(context).size.height * 1.20, // Adjust the height accordingly
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  // Container with the upper image
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/datastats.jpeg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  SizedBox(height: 30), // Adding some space

                  // Grid view containing the grid items
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2, // Two grid items in a row
                    
                    // childAspectRatio: 1.5, // Aspect ratio for grid items.........
                    // mainAxisSpacing: 20,
                    // crossAxisSpacing: 20,
                   // padding: EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    children: [
                      // Add your grid view items here
                      GridItem(
                        imageAsset: "assets/images/shops.jpeg",
                        itemName: "Shops",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopHomePage(),
                            ),
                          );
                        },
                      ),
                      GridItem(
                        imageAsset: "assets/images/shops.jpeg",
                        itemName: "Orders",
                        onTap: () {
                          // Navigator.push(
                          //   context, 
                          //   MaterialPageRoute(
                          //     builder: (context) => ,
                           // ),
                        //  );
                        },
                      ),
                      GridItem(
                        imageAsset: "assets/images/customers.jpeg",
                        itemName: "Customers",
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ,
                          //   ),
                          // );
                        },
                      ),
                      GridItem(
                        imageAsset: "assets/images/riders.jpeg",
                        itemName: "Rider",
                        onTap: () {
                          //  Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ,
                          //   ),
                        //  );
                        },
                      ),
                    
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
