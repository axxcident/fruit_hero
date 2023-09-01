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
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'WEIGHT';

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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _builInfoCard('WEIGHT', '300', 'G'),
                            const SizedBox(
                              height: 10,
                            ),
                            _builInfoCard('CALORIES', '267', 'CAL'),
                            const SizedBox(
                              height: 10,
                            ),
                            _builInfoCard('VITAMINS', 'A, B6', 'VIT'),
                            const SizedBox(
                              height: 10,
                            ),
                            _builInfoCard('AVAIL', 'NO', 'AV'),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10)),
                              color: Colors.black),
                          height: 50,
                          child: const Center(
                            child: Text(
                              "\$50",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget _builInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
      onTap: () {
        selectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardTitle == selectedCard
              ? const Color(0xFF7A9BEE)
              : Colors.white,
          border: Border.all(
              color: cardTitle == selectedCard
                  ? Colors.transparent
                  : Colors.grey.withOpacity(0.3),
              style: BorderStyle.solid,
              width: 0.75),
        ),
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(
                unit,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color:
                      cardTitle == selectedCard ? Colors.white : Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: cardTitle == selectedCard
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
