import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int walletMoney = 0;
  int moneyToAdd = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    "Wallet",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Image.asset(
                    "assets/wallet.jpg",
                    scale: 5,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Wallet",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          "₹" + walletMoney.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Container(
                child: Text(
                  "Add Money",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                moneyToAdd = 100;
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 1, horizontal: 8),
                        child: Text(
                          "₹100",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        moneyToAdd = 200;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 8),
                          child: Text(
                            "₹200",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        moneyToAdd = 500;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 8),
                          child: Text(
                            "₹500",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        moneyToAdd = 1000;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 8),
                          child: Text(
                            "₹1000",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    walletMoney += moneyToAdd;
                    moneyToAdd = 0;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF008080),
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Center(
                    child: Text(
                      "Add Money",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
