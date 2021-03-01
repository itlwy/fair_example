import 'package:fair/fair.dart';
import 'package:fair_example/src/pages/news/delegate/news_home_delegate.dart';
import 'package:fair_example/src/utils/toast.dart';
import 'package:flutter/material.dart';

@FairPatch()
class ListItem extends StatelessWidget {
  final NewsModel data;

  ListItem(this.data);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Toast.show('click to ${data.title}', context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
        child: InkWell(
          splashColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 7,
                        child: Image.network(data.backgroundUrl,
                            fit: BoxFit.cover),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 8, bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        data.title,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            data.content,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                        //onTap: AppTheme.onTapEmpty,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
