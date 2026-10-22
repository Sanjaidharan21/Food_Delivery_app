
import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  final String restaurantName;

  const RestaurantScreen({
    super.key,
    required this.restaurantName,
  });

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  // Cart stores food name and quantity
  Map<String, int> cart = {};

  // Add first item
  void addItem(String foodName) {
    setState(() {
      cart[foodName] = 1;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 700),
        content: Text("$foodName added to cart"),
      ),
    );
  }

  // Increase quantity
  void increaseItem(String foodName) {
    setState(() {
      cart[foodName] = cart[foodName]! + 1;
    });
  }

  // Decrease quantity
  void decreaseItem(String foodName) {
    setState(() {
      if (cart[foodName] == 1) {
        cart.remove(foodName);
      } else {
        cart[foodName] = cart[foodName]! - 1;
      }
    });
  }

  // Total items
  int get totalItems {
    int total = 0;
    cart.forEach((key, value) {
      total += value;
    });
    return total;
  }

  // Restaurant Menu
  List<Map<String, String>> getMenu() {
    switch (widget.restaurantName) {
      case "Burger King":
        return [
          {
            "name": "Chicken Whopper",
            "price": "₹199",
            "desc": "Flame grilled chicken burger",
            "image":
                "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400"
          },
          {
            "name": "Veg Whopper",
            "price": "₹179",
            "desc": "Loaded vegetable burger",
            "image":
                "https://images.unsplash.com/photo-1550547660-d9450f859349?w=400"
          },
          {
            "name": "Crispy Chicken",
            "price": "₹189",
            "desc": "Crispy chicken burger",
            "image":
                "https://images.unsplash.com/photo-1550317138-10000687a72b?w=400"
          },
          {
            "name": "French Fries",
            "price": "₹149",
            "desc": "Golden crispy fries",
            "image":
                "https://images.unsplash.com/photo-1576107232684-1279f390859f?w=400"
          },
          {
            "name": "Chocolate Shake",
            "price": "₹169",
            "desc": "Creamy chocolate shake",
            "image":
                "https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=400"
          },
        ];

      case "KFC":
        return [
          {
            "name": "Zinger Burger",
            "price": "₹199",
            "desc": "Spicy chicken burger",
            "image":
                "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400"
          },
          {
            "name": "Chicken Popcorn",
            "price": "₹179",
            "desc": "Crispy popcorn chicken",
            "image":
                "https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=400"
          },
          {
            "name": "Hot Wings",
            "price": "₹219",
            "desc": "Hot & spicy wings",
            "image":
                "https://images.unsplash.com/photo-1608039829572-78524f79c4c7?w=400"
          },
          {
            "name": "Chicken Bucket",
            "price": "₹399",
            "desc": "Bucket of fried chicken",
            "image":
                "https://images.unsplash.com/photo-1513639776629-7b61b0ac49cb?w=400"
          },
          {
            "name": "Pepsi",
            "price": "₹79",
            "desc": "Chilled soft drink",
            "image":
                "https://images.unsplash.com/photo-1629203851122-3726ecdf080e?w=400"
          },
        ];

      case "Thambi Biryani":
        return [
          {
            "name": "Chicken Biryani",
            "price": "₹249",
            "desc": "Traditional chicken biryani",
            "image":
                "https://media.istockphoto.com/id/1345624336/photo/chicken-biriyani.jpg?s=1024x1024&w=is&k=20&c=bvTAMlq5A8Z5EhVjBn6D8eYOQS-rsuKmT9ToLkCc2Y4="
          },
          {
            "name": "Mutton Biryani",
            "price": "₹329",
            "desc": "Spicy mutton biryani",
            "image":
                "https://images.unsplash.com/photo-1633945274405-b6c8069047b0?w=400"
          },
          {
            "name": "Egg Biryani",
            "price": "₹179",
            "desc": "Egg dum biryani",
            "image":
                "https://images.unsplash.com/photo-1681546898018-961e2a05c6fa?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D"
          },
          {
            "name": "Veg Biryani",
            "price": "₹169",
            "desc": "Healthy veg biryani",
            "image":
                "https://images.unsplash.com/photo-1630409346824-4f0e7b080087?q=80&w=1246&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D"
          },
          {
            "name": "Chicken 65",
            "price": "₹199",
            "desc": "Spicy chicken starter",
            "image":
                "https://media.istockphoto.com/id/1265209311/photo/fried-chicken-kebab-or-kabab.webp?a=1&b=1&s=612x612&w=0&k=20&c=k6elu7ogARiXzPbHTFtCqEg2A4HQ1w-FR0kbpM8Hc_Q="
          },
        ];

      default:
        return [
          {
            "name": "Special Meal",
            "price": "₹199",
            "desc": "Chef's Special",
            "image":
                "https://images.unsplash.com/photo-1625398407796-82650a8c135f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D"
          },
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final menu = getMenu();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.restaurantName),
      ),
      bottomNavigationBar: totalItems > 0
          ? Container(
              padding: const EdgeInsets.all(10),
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/cart",
                    arguments: cart,
                  );
                },
                child: Text(
                  "View Cart ($totalItems Items)",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.restaurantName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.green,
                  size: 18,
                ),
                SizedBox(width: 5),
                Text("4.7"),
                SizedBox(width: 20),
                Icon(
                  Icons.access_time,
                  color: Colors.orange,
                  size: 18,
                ),
                SizedBox(width: 5),
                Text("25 - 30 mins"),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Items Starting at ₹149",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  final food = menu[index];

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food["name"]!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  food["price"]!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  food["desc"]!,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  food["image"]!,
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return Container(
                                      height: 90,
                                      width: 90,
                                      color: Colors.grey.shade200,
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.restaurant,
                                        color: Colors.grey,
                                        size: 32,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),
                              cart.containsKey(food["name"])
                                  ? Container(
                                      width: 100,
                                      height: 38,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              decreaseItem(food["name"]!);
                                            },
                                            child: const Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            cart[food["name"]].toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              increaseItem(food["name"]!);
                                            },
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      width: 90,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {
                                          addItem(food["name"]!);
                                        },
                                        child: const Text(
                                          "ADD",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
