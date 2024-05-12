import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final String cat;
  final String colors;
  final String size;
  final String price;
  final String imagePath;
  final int itemCount;
  final VoidCallback updateTotalPrice;

  Category({
    Key? key,
    required this.cat,
    required this.colors,
    required this.size,
    required this.price,
    required this.imagePath,
    required this.itemCount,
    required this.updateTotalPrice,
  }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int itemCount = 1;
  double totalPrice = 0.0;
  @override
  void initState() {
    super.initState();
    // Initialize itemCount and totalPrice
    itemCount = widget.itemCount;
    totalPrice = double.parse(widget.price) * itemCount;
  }

  void addItem() {
    setState(() {
      itemCount++;
      totalPrice = double.parse(widget.price) * itemCount;
      widget.updateTotalPrice(); // Notify the parent widget about the change
    });
  }

  void removeItem() {
    setState(() {
      if (itemCount > 0) {
        itemCount--;
        totalPrice = double.parse(widget.price) * itemCount;
        widget.updateTotalPrice(); // Notify the parent widget about the change
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 8, 8),
      width: 500,
      height: 140,
      color: Colors.white70,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //image
            Image.asset(
              widget.imagePath,
              width: 140,
              height: 140,
              fit: BoxFit.scaleDown,
            ),
            //middle
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //pullover
                Text(
                  widget.cat,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    //color
                    Text(
                      widget.colors,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),

                    //size
                    Text(
                      widget.size,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                //add remove button
                Row(
                  children: [
                    IconButton(
                      onPressed: removeItem,
                      icon: const Icon(Icons.remove),
                      iconSize: 31,
                    ),
                    Text(
                      itemCount.toString(), // Display the item count
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: addItem,
                      icon: const Icon(Icons.add),
                      iconSize: 30,
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //more button
                IconButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print("more");
                    }
                  },
                  icon: const Icon(Icons.more_vert),
                  iconSize: 30,
                ),
                //price
                Text(
                  '\$$totalPrice',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ]),
    );
  }
}
