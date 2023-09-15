import 'package:flutter/material.dart';
import 'package:topu/services/service.dart';

import '../component/component.dart';
import '../model/model.dart';

class allNews extends StatelessWidget {
  allNews({super.key});
  ComentHelper comentHelper = ComentHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: comentHelper.getAllNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Newsmodel> airticle = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: airticle.length,
                  itemBuilder: (context, index) {
                    return component(newsmodel: airticle[index]);
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
