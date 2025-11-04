import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('북마크'),
        elevation: 0,
      ),
      body: Consumer<NewsProvider>(
        builder: (context, provider, child) {
          if (provider.bookmarkedArticles.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '북마크한 뉴스가 없습니다',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '관심있는 뉴스를 북마크하여\n나중에 다시 볼 수 있습니다',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.bookmarkedArticles.length,
            itemBuilder: (context, index) {
              final article = provider.bookmarkedArticles[index];
              return NewsCard(
                article: article,
                onBookmarkToggle: () {
                  provider.toggleBookmark(article);
                },
              );
            },
          );
        },
      ),
    );
  }
}
