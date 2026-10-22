import 'package:flutter/material.dart';
import 'restaurant_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> foodCategories = const [
    {
      "name": "Fried Rice",
      "image":
          "https://images.pexels.com/photos/723198/pexels-photo-723198.jpeg"
    },
    {
      "name": "Biryani",
      "image":
          "https://images.pexels.com/photos/9609838/pexels-photo-9609838.jpeg"
    },
    {
      "name": "North Indian",
      "image":
          "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg"
    },
    {
      "name": "Burger",
      "image":
          "https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg"
    },
    {
      "name": "Pizza",
      "image":
          "https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg"
    },
    {
      "name": "South Indian",
      "image":
          "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg"
    },
    {
      "name": "Rolls",
      "image":
          "https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text(
          "Hello User 👋",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Search Bar

              TextField(
                decoration: InputDecoration(
                  hintText: "Search Your Food",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Food Categories",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodCategories.length,
                  itemBuilder: (context, index) {

                    return Padding(
                      padding: const EdgeInsets.only(right: 18),

                      child: Column(
                        children: [

                          CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                              foodCategories[index]["image"]!,
                            ),
                          ),

                          const SizedBox(height: 8),

                          SizedBox(
                            width: 80,
                            child: Text(
                              foodCategories[index]["name"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Top Restaurants",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),              restaurantCard(
                context,
                "Burger King",
                "https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg",
                "4.7",
                "25-30 mins",
                "Burgers • Fast Food",
              ),

              restaurantCard(
                context,
                "KFC",
                "https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg",
                "4.6",
                "20-25 mins",
                "Fried Chicken • Meals",
              ),

              restaurantCard(
                context,
                "Thambi Biryani",
                "https://images.pexels.com/photos/9609838/pexels-photo-9609838.jpeg",
                "4.8",
                "30 mins",
                "Special Biryani",
              ),

              restaurantCard(
                context,
                "Amman Mess",
                "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg",
                "4.5",
                "25 mins",
                "South Indian Meals",
              ),

              restaurantCard(
                context,
                "Pizza Hut",
                "https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg",
                "4.6",
                "30 mins",
                "Pizza • Garlic Bread",
              ),

              restaurantCard(
                context,
                "Tea Time",
                "https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg",
                "4.4",
                "15 mins",
                "Tea • Coffee • Snacks",
              ),

              restaurantCard(
                context,
                "McDonald's",
                "https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg",
                "4.5",
                "20 mins",
                "Burgers • Fries",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget restaurantCard(
    BuildContext context,
    String restaurantName,
    String image,
    String rating,
    String time,
    String tagLine,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantScreen(
              restaurantName: restaurantName,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 15),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.network(
                image,
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    restaurantName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [

                      const Icon(
                        Icons.star,
                        color: Colors.green,
                        size: 18,
                      ),

                      const SizedBox(width: 5),

                      Text(
                        rating,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 20),

                      const Icon(
                        Icons.access_time,
                        color: Colors.orange,
                        size: 18,
                      ),

                      const SizedBox(width: 5),

                      Text(time),

                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                    tagLine,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
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