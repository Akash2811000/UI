import 'package:flutter/material.dart';
import 'package:netflx_ui/models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentlist;
  final bool isOriginal;

  const ContentList(
      {Key? key,
      required this.title,
      required this.contentlist,
      this.isOriginal = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: isOriginal ? 500.0 : 220.0,
          child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: contentlist.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = contentlist[index];
                return GestureDetector(
                  onTap: () => print(content.name),
                  child: Container (
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: isOriginal ? 400.0 : 200.0,
                    width: isOriginal ? 200.0 : 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(content.imageUrl),
                      fit: BoxFit.cover),
                    ),
                  ),

                );
              }),
        ),
      ]),
    );
  }
}
