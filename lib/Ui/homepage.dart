import 'package:flutter/material.dart';
import 'package:topu/Ui/allNews.dart';
import 'package:topu/Ui/breakingNews.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("news App"),
            bottom: const TabBar(
              indicatorWeight: 5,
              tabs: [
              Tab(text: "All news",),
              Tab(text: "Breaking News",)
            ]),
          ),
          body: TabBarView(children: [
            allNews(),
            breakingNews(),
          ]),
        ));
  }
}
