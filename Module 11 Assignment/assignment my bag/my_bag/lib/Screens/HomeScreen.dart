import 'package:flutter/material.dart';
import 'package:my_bag/modal/category.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categories = [
    Category(
      cat: 'Pullover',
      colors: 'Black',
      size: 'L',
      price: '51',
      imagePath: 'images/pullover.jpeg',
      itemCount: 1,
      updateTotalPrice: () {},
    ),
    Category(
      cat: 'T-Shirt',
      colors: 'Gray',
      size: 'L',
      price: '30',
      imagePath: 'images/tshirt.jpeg',
      itemCount: 1,
      updateTotalPrice: () {},
    ),
    Category(
      cat: 'Sports',
      colors: 'Black',
      size: 'L',
      price: '43',
      imagePath: 'images/sports.jpg',
      itemCount: 1,
      updateTotalPrice: () {},
    ),
  ];
  double get totalPrice {
    double total = 0;
    for (var category in categories) {
      total += double.parse(category.price) * category.itemCount;
    }
    return total;
  }

  void updateTotalPrice() {
    setState(
        () {}); // Trigger a rebuild of HomeScreen to update the total price
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //"My Bag"
              const Text(
                "My Bag",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              //catagory 01
              Column(
                children: categories.map((category) {
                  return Category(
                    cat: category.cat,
                    colors: category.colors,
                    size: category.size,
                    price: category.price,
                    imagePath: category.imagePath,
                    itemCount: category.itemCount,
                    updateTotalPrice: updateTotalPrice,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 130,
              ),
              Row(
                children: [
                  Text(
                      'Total amount:                                   $totalPrice \$',
                      style: const TextStyle(
                        fontSize: 20,
                      )),
                ],
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Center(child: Text("Congratulations!")),
                          content: const Text(
                              "You have added 5 T-Shirt on your bag"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Okay'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Check-Out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
