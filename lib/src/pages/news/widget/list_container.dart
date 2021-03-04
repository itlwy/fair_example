import 'package:fair/fair.dart';
import 'package:fair_example/src/pages/news/delegate/news_home_delegate.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

@FairBinding(packages: ['package:smooth_star_rating/smooth_star_rating.dart'])
class ListContainer extends StatelessWidget {
  final List<NewsModel> datas;

  ListContainer(this.datas);

  @override
  Widget build(BuildContext context) {
//    return ListView(
//      children: datas
//          .map((data) => FairWidget(
//                name: 'item-${data.hashCode}',
//                path:
//                    'http://192.168.31.249:1337/static/bundles/lib_pages_news_widget_list_item.fair.json',
//                data: {
//                  'data.title': data.title,
//                  'data.content': data.content,
//                  'data.backgroundUrl': data.backgroundUrl,
//                },
//              ))
//          .toList(),
//    );
    return ListView.builder(
      shrinkWrap: true,
//      itemBuilder: (context, index) => ListItem(datas[index]),
      itemBuilder: (context, index) {
        print('======> list_container rebuild');
        var data = datas[index];
        return FairWidget(
          name: 'item-${data.hashCode}',
          path:
              'http://192.168.31.249:1337/static/bundles/lib_src_pages_news_widget_list_item.fair.json',
          data: {
            'data.title': data.title,
            'data.content': data.content,
            'data.backgroundUrl': data.backgroundUrl,
          },
        );
      },
      itemCount: datas.length,
    );
  }
}
