import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery/pages/details.dart';
import 'package:grocery/pages/widgets/services/database.dart';
import 'package:grocery/pages/widgets/widget_support.dart';
import 'package:grocery/pages/widgets/content_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool ice_cream = false, burger = false, pizza = false, salad = false;
  List<UnboardingContent> cate = burgerList;
  Stream? fooditemStream;
  ontheload() async {
    fooditemStream = await DataBaseMethod().getFoodItem('pizza');
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItems() {
    return StreamBuilder(
      stream: fooditemStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(ds['Image'],
                                          height: 150,
                                          width: 150,
                                          fit: BoxFit.cover),
                                    ),
                                    Text(ds['Name'],
                                        style: fontSetting.semiboldFont()),
                                    Text(ds['Details'].substring(0, 12),
                                        maxLines: 1,
                                        style: fontSetting.disFont()),
                                    Text(
                                      "\$" + ds['Price'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
            : CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String name = "Pratham";

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
                  child: Row(
                    children: [
                      Material(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          child: Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            child: Icon(Icons.menu_open_rounded),
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.pin_drop_rounded,
                        color: Colors.green,
                        size: 25,
                      ),
                      Text("Noida"),
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/profil.jpg',
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hello " + name + "!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Go Grocery",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Text(
                  "Discover More Food",
                  style: fontSetting.lightFont(),
                ),
                SizedBox(height: 20),
                foodCat(),
                SizedBox(height: 50),
                Container(
                  child: allItems(),
                  height: 150,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.asset(cate[1].image,
                                            height: 150,
                                            width: 150,
                                            fit: BoxFit.cover),
                                      ),
                                      Text(cate[0].title,
                                          style: fontSetting.semiboldFont()),
                                      Text(cate[0].descrip.substring(0, 12),
                                          maxLines: 1,
                                          style: fontSetting.disFont()),
                                      Text(
                                        "\$4",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(cate[2].image,
                                                height: 150,
                                                width: 150,
                                                fit: BoxFit.cover),
                                          ),
                                          Text(cate[2].title,
                                              style:
                                                  fontSetting.semiboldFont()),
                                          Text(cate[2].descrip.substring(0, 12),
                                              maxLines: 1,
                                              style: fontSetting.disFont()),
                                          Text(
                                            "\$8",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Details()));
                  },
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade100,
                    child: Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child: Image.asset(cate[0].image,
                                height: 120, width: 150, fit: BoxFit.cover),
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cate[1].descrip,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$4",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Details()));
                  },
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade100,
                    child: Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(cate[2].image,
                                height: 120, width: 150, fit: BoxFit.cover),
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cate[2].descrip,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\$8",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget foodCat() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              burger = true;
              ice_cream = false;
              pizza = false;
              salad = false;
              cate = burgerList;
            });
          },
          child: Material(
            elevation: 8,
            color: burger ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/burger.png',
                  height: 60,
                  width: 60,
                  color: burger ? Colors.white : Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              burger = false;
              ice_cream = false;
              pizza = true;
              salad = false;
              cate = burgerList;
            });
          },
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(10),
            color: pizza ? Colors.black : Colors.white,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Image.asset('assets/pizza.png',
                  height: 60,
                  width: 60,
                  color: pizza ? Colors.white : Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              burger = false;
              ice_cream = true;
              pizza = false;
              salad = false;
              cate = icecreamList;
            });
          },
          child: Material(
              elevation: 8,
              color: ice_cream ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Image.asset('assets/ice-cream.png',
                    height: 60,
                    width: 60,
                    color: ice_cream ? Colors.white : Colors.black),
              )),
        ),
        GestureDetector(
          onTap: () {
            setState(
              () {
                burger = false;
                ice_cream = false;
                pizza = false;
                salad = true;
                cate = saladList;
              },
            );
          },
          child: Material(
              elevation: 8,
              color: salad ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Image.asset('assets/salad.png',
                    height: 50,
                    width: 60,
                    color: salad ? Colors.white : Colors.black),
              )),
        ),
      ],
    );
  }
}
