import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21BFBD),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                // SizedBox? eller Container
                SizedBox(
                  width: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Text(
                  "Healthy",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
                SizedBox(width: 10),
                Text(
                  "Food",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 25),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(
            height: MediaQuery.of(context).size.height - 185,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75))),
            child: ListView(
              primary: false,
              padding: const EdgeInsets.only(left: 25, right: 20),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Center(
                    child: Container(
                      width: 700,
                      // alignment: Alignment.center,
                      // Lägg till Max-width? Ta bort "DeNNA GJORDE JAG"------
                      height: MediaQuery.of(context).size.height - 300,
                      child: ListView(
                        children: [
                          _buildFoodItems(
                              'assets/plate1.png', 'salmon Bowl', '\$24.00'),
                          _buildFoodItems(
                              'assets/plate2.png', 'Spring Bowl', '\$22.00'),
                          _buildFoodItems(
                              'assets/plate6.png', 'Avocado Bowl', '\$26.00'),
                          _buildFoodItems(
                              'assets/plate5.png', 'Berry Bowl', '\$20.00'),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      // Challenge, addera en tvåa här i övre höger hörn.
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Icon(
                          Icons.shopping_basket,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1),
                          color: const Color(0xFF1C1428),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItems(String imgPath, String foodName, String price) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push("route");
        },
        child: Row(
          // mainAxisAlignment DENNA GJORDE JAG NU --------------------
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Remove container?
            Container(
              child: Row(
                children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75,
                        width: 75,
                      )),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
