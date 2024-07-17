import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:popups/app/modules/cookies_popup/cookies_popup_store.dart';

class CookiesPopupPage extends StatefulWidget {
  final String title;
  const CookiesPopupPage({super.key, this.title = 'Cookies Exemplo'});
  @override
  CookiesPopupPageState createState() => CookiesPopupPageState();
}

class CookiesPopupPageState extends State<CookiesPopupPage> {
  final CookiesPopupStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (store.aninController!.isCompleted) {
                  store.aninController!.reverse();
                  return;
                }
                store.aninController!.forward();
              },
              child: const Text("Mostrar popup"),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 20,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/cookie.png",
                        width: 70,
                        height: 70,
                      ).animate(
                        onComplete: (controller) {
                          controller.forward(from: 0);
                        },
                      ).rotate(
                        duration: const Duration(seconds: 5),
                        curve: Curves.linear,
                      ),
                      const Text(
                        "Cookies e Privacidade",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {
                          store.aninController!.reverse();
                        },
                        child: const Text(
                          "Aceitar Tudo",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {
                          store.aninController!.reverse();
                        },
                        child: const Text(
                          "Rejeitar Tudo",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        store.aninController!.reverse();
                      },
                      icon: const Icon(
                        Icons.highlight_remove_outlined,
                      ),
                    ),
                  )
                ],
              ),
            )
                .animate(
                  onInit: (controller) {
                    store.aninController = controller;
                  },
                  autoPlay: false,
                  controller: store.aninController,
                )
                .moveX(
                  begin: -300,
                  end: 0,
                  duration: const Duration(milliseconds: 300),
                ),
          )
        ],
      ),
    );
  }
}
