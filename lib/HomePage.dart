import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:swift_cafe/product_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],

      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '16/10/2024',
                      style: TextStyle(color: Colors.white60),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Joshua Scanlan',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.delete, color: Colors.white),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/logo/user.jpg'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search favorite Beverages',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Most Popular Beverages',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                beverageCard('Hot Cappuccino', 'assets/img/coffee1.png',
                    'Espresso, Steamed Milk', 4.9, 458),
                beverageCard('Latte', 'assets/img/coffee2.png',
                    'Espresso, Steamed Milk', 4.8, 340),
                beverageCard('Flat White', 'assets/img/coffee3.png',
                    'Espresso, Steamed Milk', 4.7, 400),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Get it instantly',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                instantBeverageCard('Latte',
                    'A milk coffee made of espresso and steamed milk', 'assets/img/coffee1.png', 4.9, 458),
                instantBeverageCard(
                    'Flat White',
                    'A coffee with a smooth layer of milk foam',
                    'assets/img/coffee3.png',
                    4.7,
                    400),
              ],
            ),
          ),
        ],
      ),


      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StylishBottomBar(
          backgroundColor: Colors.white30,
          option: AnimatedBarOptions(
            barAnimation: BarAnimation.drop,
            iconStyle: IconStyle.animated,
          ),
          items: [
            BottomBarItem(
              icon: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home'),
                selectedIcon: const Icon(Icons.home, color: Colors.black),
                selectedColor: Colors.white,
                backgroundColor: Colors.lightBlueAccent.shade200,
                unSelectedColor: Colors.black,
                badgeColor: Colors.lightBlueAccent
            ),
            BottomBarItem(
              icon: const Icon(Icons.search, color: Colors.white),
                selectedIcon: const Icon(Icons.search, color: Colors.black),
                title: const Text('Search'),
                selectedColor: Colors.white,
                backgroundColor: Colors.lightBlueAccent.shade200,
                unSelectedColor: Colors.black,
                badgeColor: Colors.lightBlueAccent
            ),
            BottomBarItem(
              icon: const Icon(Icons.shopping_cart,color: Colors.white,),
              selectedIcon: const Icon(Icons.shopping_cart, color: Colors.black),
              title: const Text('Cart'),
              selectedColor: Colors.white,
              backgroundColor: Colors.lightBlueAccent.shade200,
              unSelectedColor: Colors.black,
              badgeColor: Colors.lightBlueAccent
            ),
            BottomBarItem(
              icon: const Icon(Icons.person, color: Colors.white),
                selectedIcon: const Icon(Icons.person, color: Colors.black),
                title: const Text('Profile'),
                selectedColor: Colors.white,
                backgroundColor: Colors.lightBlueAccent.shade200,
                unSelectedColor: Colors.black,
                badgeColor: Colors.lightBlueAccent
            ),
          ],
          hasNotch: true,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget beverageCard(String title, String image, String subtitle, double rating, int reviews) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(productName: title, imageUrl: image, rating: rating, reviews: reviews, description: 'A milk coffee made of espresso and steamed milk',

            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: image,
                  child: Image.asset(image, height: 80)),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white60, fontSize: 12),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 14),
                  const SizedBox(width: 5),
                  Text(
                    '$rating ($reviews)',
                    style: const TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.add, color: Colors.green),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget instantBeverageCard(String title, String description, String image,
      double rating, int reviews) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Image.asset(image, height: 80),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 14),
                      const SizedBox(width: 5),
                      Text(
                        '$rating ($reviews)',
                        style: const TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('ADD'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
