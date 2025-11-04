import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/news_article.dart';
import '../services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  final NewsService _newsService = NewsService();
  List<NewsArticle> _articles = [];
  final List<NewsArticle> _bookmarkedArticles = [];
  bool _isLoading = false;
  String? _error;
  String _selectedCategory = 'All';
  late Box _bookmarksBox;

  List<NewsArticle> get articles => _articles;
  List<NewsArticle> get bookmarkedArticles => _bookmarkedArticles;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get selectedCategory => _selectedCategory;
  List<String> get categories => _newsService.getCategories();

  Future<void> initialize() async {
    await Hive.initFlutter();
    _bookmarksBox = await Hive.openBox('bookmarks');
    await loadNews();
    _loadBookmarks();
  }

  Future<void> loadNews() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _articles = await _newsService.fetchGoogleAINews(
        category: _selectedCategory == 'All' ? null : _selectedCategory,
      );
      
      // 북마크 상태 동기화
      for (var article in _articles) {
        article.isBookmarked = _bookmarksBox.containsKey(article.id);
      }
      
      _error = null;
    } catch (e) {
      _error = 'Failed to load news: $e';
      if (kDebugMode) {
        debugPrint('Error loading news: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchNews(String query) async {
    if (query.isEmpty) {
      await loadNews();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _articles = await _newsService.searchNews(query);
      
      // 북마크 상태 동기화
      for (var article in _articles) {
        article.isBookmarked = _bookmarksBox.containsKey(article.id);
      }
      
      _error = null;
    } catch (e) {
      _error = 'Failed to search news: $e';
      if (kDebugMode) {
        debugPrint('Error searching news: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      loadNews();
    }
  }

  Future<void> toggleBookmark(NewsArticle article) async {
    article.isBookmarked = !article.isBookmarked;

    if (article.isBookmarked) {
      await _bookmarksBox.put(article.id, article.toJson());
      _bookmarkedArticles.add(article);
    } else {
      await _bookmarksBox.delete(article.id);
      _bookmarkedArticles.removeWhere((a) => a.id == article.id);
    }

    notifyListeners();
  }

  void _loadBookmarks() {
    _bookmarkedArticles.clear();
    for (var key in _bookmarksBox.keys) {
      try {
        final data = _bookmarksBox.get(key) as Map;
        final article = NewsArticle.fromJson(Map<String, dynamic>.from(data));
        article.isBookmarked = true;
        _bookmarkedArticles.add(article);
      } catch (e) {
        if (kDebugMode) {
          debugPrint('Error loading bookmark: $e');
        }
      }
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    await loadNews();
  }
}
