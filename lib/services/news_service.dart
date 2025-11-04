import '../models/news_article.dart';

class NewsService {
  // Mock AI 뉴스 데이터 (실제 API 없이도 동작하도록)
  static List<NewsArticle> getMockGoogleAINews() {
    final now = DateTime.now();
    
    return [
      NewsArticle(
        id: '1',
        title: 'Google Gemini 2.0 발표: 차세대 AI 모델의 혁신',
        description: 'Google이 차세대 AI 모델 Gemini 2.0을 공개했습니다. 향상된 멀티모달 기능과 더 빠른 추론 속도를 자랑합니다.',
        url: 'https://blog.google/technology/ai/google-gemini-ai/',
        imageUrl: 'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800',
        source: 'Google Blog',
        publishedAt: now.subtract(const Duration(hours: 2)),
        category: 'AI Models',
      ),
      NewsArticle(
        id: '2',
        title: 'AlphaCode 3: 구글 딥마인드의 새로운 코딩 AI',
        description: '구글 딥마인드가 AlphaCode 3를 발표했습니다. 이전 버전보다 85% 향상된 코드 생성 능력을 보여줍니다.',
        url: 'https://deepmind.google/discover/blog/',
        imageUrl: 'https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=800',
        source: 'DeepMind',
        publishedAt: now.subtract(const Duration(hours: 5)),
        category: 'Development',
      ),
      NewsArticle(
        id: '3',
        title: 'Google AI로 의료 진단 정확도 95% 달성',
        description: 'Google의 최신 AI 시스템이 의료 영상 분석에서 95% 이상의 정확도를 기록하며 의사들의 진단을 보조하고 있습니다.',
        url: 'https://health.google/health-research/',
        imageUrl: 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800',
        source: 'Google Health',
        publishedAt: now.subtract(const Duration(hours: 8)),
        category: 'Healthcare',
      ),
      NewsArticle(
        id: '4',
        title: 'Bard의 새로운 이미지 생성 기능 출시',
        description: 'Google Bard가 이미지 생성 기능을 추가했습니다. 자연어 프롬프트로 고품질 이미지를 생성할 수 있습니다.',
        url: 'https://bard.google.com/',
        imageUrl: 'https://images.unsplash.com/photo-1686191128892-c0557e8d0c7a?w=800',
        source: 'Google Bard',
        publishedAt: now.subtract(const Duration(hours: 12)),
        category: 'Generative AI',
      ),
      NewsArticle(
        id: '5',
        title: 'Google AI가 기후 변화 예측 모델 개선',
        description: '구글의 AI 기술이 기후 변화 예측의 정확도를 크게 향상시켜 더 정확한 날씨 예보와 장기 기후 모델링을 가능하게 합니다.',
        url: 'https://sustainability.google/',
        imageUrl: 'https://images.unsplash.com/photo-1611273426858-450d8e3c9fce?w=800',
        source: 'Google Sustainability',
        publishedAt: now.subtract(const Duration(hours: 18)),
        category: 'Climate',
      ),
      NewsArticle(
        id: '6',
        title: 'PaLM 3: 언어 이해의 새로운 지평',
        description: 'Google이 PaLM 3를 발표하며 자연어 처리 분야에서 새로운 벤치마크를 세웠습니다. 다국어 지원이 크게 향상되었습니다.',
        url: 'https://ai.google/discover/palm2/',
        imageUrl: 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=800',
        source: 'Google AI',
        publishedAt: now.subtract(const Duration(days: 1)),
        category: 'NLP',
      ),
      NewsArticle(
        id: '7',
        title: 'Google의 AI 윤리 가이드라인 업데이트',
        description: 'Google이 AI 개발 및 배포를 위한 새로운 윤리 가이드라인을 발표했습니다. 책임감 있는 AI 사용을 강조합니다.',
        url: 'https://ai.google/responsibility/principles/',
        imageUrl: 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=800',
        source: 'Google AI',
        publishedAt: now.subtract(const Duration(days: 1, hours: 6)),
        category: 'Ethics',
      ),
      NewsArticle(
        id: '8',
        title: 'Android에 내장된 새로운 AI 어시스턴트 기능',
        description: 'Google이 Android 운영체제에 강력한 AI 어시스턴트 기능을 통합했습니다. 더 자연스러운 대화와 작업 자동화가 가능합니다.',
        url: 'https://www.android.com/ai/',
        imageUrl: 'https://images.unsplash.com/photo-1607252650355-f7fd0460ccdb?w=800',
        source: 'Android',
        publishedAt: now.subtract(const Duration(days: 2)),
        category: 'Mobile',
      ),
      NewsArticle(
        id: '9',
        title: 'Google Cloud AI Platform 대규모 업데이트',
        description: 'Google Cloud가 AI Platform을 대대적으로 업데이트했습니다. 더 많은 사전 훈련된 모델과 향상된 MLOps 도구를 제공합니다.',
        url: 'https://cloud.google.com/ai-platform',
        imageUrl: 'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=800',
        source: 'Google Cloud',
        publishedAt: now.subtract(const Duration(days: 2, hours: 12)),
        category: 'Cloud',
      ),
      NewsArticle(
        id: '10',
        title: 'Google의 양자 컴퓨팅과 AI의 만남',
        description: '구글이 양자 컴퓨팅을 활용한 새로운 AI 알고리즘을 개발했습니다. 복잡한 최적화 문제를 획기적으로 빠르게 해결합니다.',
        url: 'https://quantumai.google/',
        imageUrl: 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=800',
        source: 'Google Quantum AI',
        publishedAt: now.subtract(const Duration(days: 3)),
        category: 'Quantum',
      ),
      NewsArticle(
        id: '11',
        title: 'Google Search에 AI 기반 요약 기능 추가',
        description: 'Google 검색에 AI가 자동으로 검색 결과를 요약해주는 기능이 추가되었습니다. 정보 탐색 시간이 크게 단축됩니다.',
        url: 'https://blog.google/products/search/generative-ai-search/',
        imageUrl: 'https://images.unsplash.com/photo-1573804633927-bfcbcd909acd?w=800',
        source: 'Google Search',
        publishedAt: now.subtract(const Duration(days: 3, hours: 8)),
        category: 'Search',
      ),
      NewsArticle(
        id: '12',
        title: 'Google AI로 교육 혁신: 개인화된 학습 경험',
        description: 'Google이 AI 기반 교육 플랫폼을 출시했습니다. 각 학생의 학습 속도와 스타일에 맞춘 개인화된 커리큘럼을 제공합니다.',
        url: 'https://edu.google.com/ai/',
        imageUrl: 'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=800',
        source: 'Google for Education',
        publishedAt: now.subtract(const Duration(days: 4)),
        category: 'Education',
      ),
      NewsArticle(
        id: '13',
        title: 'Google AI가 새로운 약물 발견 가속화',
        description: '구글의 AI 시스템이 신약 개발 과정을 획기적으로 단축시키고 있습니다. 잠재적 약물 후보를 빠르게 식별합니다.',
        url: 'https://deepmind.google/discover/blog/alphafold/',
        imageUrl: 'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?w=800',
        source: 'DeepMind',
        publishedAt: now.subtract(const Duration(days: 4, hours: 10)),
        category: 'Healthcare',
      ),
      NewsArticle(
        id: '14',
        title: 'Workspace에 통합된 AI 생산성 도구',
        description: 'Google Workspace가 AI 기반 생산성 도구를 통합했습니다. 이메일 작성, 문서 요약, 회의 노트 자동화 등이 가능합니다.',
        url: 'https://workspace.google.com/ai/',
        imageUrl: 'https://images.unsplash.com/photo-1552664730-d307ca884978?w=800',
        source: 'Google Workspace',
        publishedAt: now.subtract(const Duration(days: 5)),
        category: 'Productivity',
      ),
      NewsArticle(
        id: '15',
        title: 'Google AI의 실시간 번역 기술 돌파',
        description: '구글이 실시간 다국어 번역 기술에서 새로운 돌파구를 마련했습니다. 더 자연스럽고 정확한 번역을 제공합니다.',
        url: 'https://translate.google.com/about/',
        imageUrl: 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=800',
        source: 'Google Translate',
        publishedAt: now.subtract(const Duration(days: 5, hours: 14)),
        category: 'Translation',
      ),
    ];
  }

  Future<List<NewsArticle>> fetchGoogleAINews({String? category}) async {
    // 실제 환경에서는 여기서 API 호출
    // 현재는 Mock 데이터 반환
    await Future.delayed(const Duration(seconds: 1)); // API 호출 시뮬레이션
    
    List<NewsArticle> news = getMockGoogleAINews();
    
    if (category != null && category != 'All') {
      news = news.where((article) => article.category == category).toList();
    }
    
    return news;
  }

  Future<List<NewsArticle>> searchNews(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    final allNews = getMockGoogleAINews();
    final lowercaseQuery = query.toLowerCase();
    
    return allNews.where((article) {
      return article.title.toLowerCase().contains(lowercaseQuery) ||
          article.description.toLowerCase().contains(lowercaseQuery) ||
          article.category.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  List<String> getCategories() {
    return [
      'All',
      'AI Models',
      'Development',
      'Healthcare',
      'Generative AI',
      'Climate',
      'NLP',
      'Ethics',
      'Mobile',
      'Cloud',
      'Quantum',
      'Search',
      'Education',
      'Productivity',
      'Translation',
    ];
  }
}
