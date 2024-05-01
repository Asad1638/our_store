import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridItem extends StatelessWidget {
  final String imageAsset;
  final String itemName;
  final VoidCallback onTap;

  GridItem({
    Key? key,
    required this.imageAsset,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.4; // Set the width of the container
    final containerHeight = containerWidth * 1.2; // Set the height of the container

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: containerWidth,
        height: containerHeight,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30), // Circular container with radius 30
              ),
              child: ClipRRect( // Clip the image to make it circular
                borderRadius: BorderRadius.circular(30), // Circular image with radius 30
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.fill, // Ensure the image fits the container
                ),
              ),
            ),
            Positioned.fill(top: 100,left: 10,right: 10,
              child: Center(
                child: Text(
                  itemName,
                  textAlign: TextAlign.center,
                  style:const  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 87, 227, 194),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
