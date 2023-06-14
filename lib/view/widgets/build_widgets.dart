import 'package:flutter/material.dart';
import 'package:news_api_task/model/news_model.dart';

Widget buildItemNews(NewsModel business,BuildContext context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(business.author,
    style: Theme.of(context).textTheme.bodyLarge
    ),
      Text(business.title,
        style: Theme.of(context).textTheme.bodyMedium,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 5,),
      Text("${business.publishedAt}",
        style: const TextStyle(
            color: Colors.grey
        ),
      )


    ],
  ),
);