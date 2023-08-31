import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String heroTag;
  final String foodName;
  final String foodPrice;

  const DetailsPage({
    Key? key,
    required this.heroTag,
    required this.foodName,
    required this.foodPrice,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _detailsPageState();
}

class _detailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Details',
          style: TextStyle(
              fontFamily: 'Montserrat', fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 82,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                  top: 75,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45)),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                  )),
              Positioned(
                  top: 30,
                  left: (MediaQuery.of(context).size.width / 2) - 100,
                  child: Hero(
                      tag: widget.heroTag,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.heroTag),
                                fit: BoxFit.cover)),
                        height: 200,
                        width: 200,
                      ))),
              Positioned(
                  top: 250,
                  left: 25,
                  right: 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.foodName,
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.foodPrice,
                            style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                          Container(
                            height: 25,
                            color: Colors.grey,
                            width: 1.5,
                          ),
                          Container(
                            width: 125,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: const Color(0xFF7A9BEE)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  // LÄGG TILL FUNKTION ADDERA/SUBTRAHERA
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: const Color(0xFF7A9BEE)),
                                    child: const Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                // ÄNDRA DENNA SIFFRA TILL STATE & DYNAMISK
                                const Text(
                                  '2',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 15),
                                ),
                                InkWell(
                                  // LÄGG TILL FUNKTION ADDERA/SUBTRAHERA
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Colors.white),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xFF7A9BEE),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
