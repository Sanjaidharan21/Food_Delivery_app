import 'package:flutter/material.dart';
import 'cart_screen.dart';

class FoodScreen extends StatefulWidget {
  final String foodName;
  final String foodPrice;
  final String foodImage;
  final String foodDescription;

  const FoodScreen({
    super.key,
    required this.foodName,
    required this.foodPrice,
    required this.foodImage,
    required this.foodDescription,
  });

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}
class _FoodScreenState extends State<FoodScreen> {
  int quantity = 1;

  int get price =>
      int.parse(widget.foodPrice.replaceAll("₹", ""));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.foodName),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.foodImage,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                widget.foodName,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Row(
                children: [

                  Icon(Icons.star,
                      color: Colors.green,
                      size: 20),

                  SizedBox(width: 5),

                  Text(
                    "4.7",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Text(
                widget.foodPrice,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                widget.foodDescription,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Quantity",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [

                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.orange,
                      size: 35,
                    ),
                  ),

                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.orange,
                      size: 35,
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [

                      const Text(
                        "Total Price",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "₹${price * quantity}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),

                  onPressed: () {

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Added To Cart Successfully",
                        ),
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text("Added To Cart Successfully"),
  ),
);

Navigator.pop(context);
                  },

                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}