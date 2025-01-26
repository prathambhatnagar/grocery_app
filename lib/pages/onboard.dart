import 'package:flutter/material.dart';
import 'package:grocery/pages/login_pages/login.dart';
import 'package:grocery/pages/navigation_bar.dart';
import 'package:grocery/pages/widgets/content_model.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});
  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image,
                        height: 450,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        contents[i].descrip,
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        contents[i].title,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            contents.length,
                            (index) => buildDot(index, context),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          if (currentIndex == contents.length - 1) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          }
                          _controller.nextPage(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.bounceIn);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.green.shade400,
                          ),
                          height: 60,
                          margin: EdgeInsets.all(40),
                          width: double.infinity,
                          child: Material(
                            borderRadius: BorderRadius.circular(50),
                            elevation: 5,
                            color: Colors.green,
                            child: Center(
                                child: Text("Next",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 18 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.black),
    );
  }
}
