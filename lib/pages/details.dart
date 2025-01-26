import 'package:flutter/material.dart';
import 'package:grocery/pages/widgets/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width / 2,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset("assets/salad4.png"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Italian Salad", style: fontSetting.boldFont()),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      value--;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      )),
                ),
                Text(
                  value.toString(),
                  style: fontSetting.boldFont(),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      value++;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "This chopped salad is so flavorful that even salad skeptics will pile their plates with seconds! The key ingredients? A punchy dressing, pepperoncini, and TWO types of cheese.",
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Delivery Time",
                  style: fontSetting.semiboldFont(),
                ),
                Spacer(),
                Icon(
                  Icons.timer_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "30 Min",
                  style: fontSetting.lightFont(),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: fontSetting.boldFont(),
                    ),
                    Text(
                      "\$" + (8 * value).toString(),
                      style: fontSetting.boldFont(),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
