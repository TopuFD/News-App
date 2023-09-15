import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:topu/model/model.dart';
import 'package:url_launcher/url_launcher.dart';

class newsDitails extends StatelessWidget {
  final Newsmodel newsmodel;
  newsDitails({super.key, required this.newsmodel});
  var defaulturl =
      "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/604eeec9983ae2091c888414a378b2e3.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsmodel.title.toString()),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: CachedNetworkImage(
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: newsmodel.urlToImage ?? defaulturl,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            newsmodel.source!.name.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        newsmodel.publishedAt.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    newsmodel.author.toString() == Null
                        ? ""
                        : "writern By:${newsmodel.author}",
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(newsmodel.description.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          final url = Uri.parse(newsmodel.url.toString());
                          if (url == Null) {
                            throw Exception("could not launch");
                          } else {
                            launchUrl(url);
                          }
                        },
                        child: const Text("Read more...")),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
