import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const VerseApp());
}

class VerseApp extends StatelessWidget {
  const VerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '오늘의 말씀',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9C6BFF),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Pretendard'),
          displayMedium: TextStyle(fontFamily: 'Pretendard'),
          displaySmall: TextStyle(fontFamily: 'Pretendard'),
          headlineLarge: TextStyle(fontFamily: 'Pretendard'),
          headlineMedium: TextStyle(fontFamily: 'Pretendard'),
          headlineSmall: TextStyle(fontFamily: 'Pretendard'),
          titleLarge: TextStyle(fontFamily: 'Pretendard'),
          titleMedium: TextStyle(fontFamily: 'Pretendard'),
          titleSmall: TextStyle(fontFamily: 'Pretendard'),
          bodyLarge: TextStyle(fontFamily: 'Pretendard'),
          bodyMedium: TextStyle(fontFamily: 'Pretendard'),
          bodySmall: TextStyle(fontFamily: 'Pretendard'),
          labelLarge: TextStyle(fontFamily: 'Pretendard'),
          labelMedium: TextStyle(fontFamily: 'Pretendard'),
          labelSmall: TextStyle(fontFamily: 'Pretendard'),
        ),
      ),
      home: const VerseHomePage(),
    );
  }
}

class VerseHomePage extends StatefulWidget {
  const VerseHomePage({super.key});

  @override
  State<VerseHomePage> createState() => _VerseHomePageState();
}

class _VerseHomePageState extends State<VerseHomePage> {
  late int _currentIndex;
  final _random = Random();

  final List<BibleVerse> _verses = const [
    BibleVerse(
      reference: '시편 23:1',
      text: '여호와는 나의 목자시니 내게 부족함이 없으리로다.',
    ),
    BibleVerse(
      reference: '시편 23:4',
      text: '내가 사망의 음침한 골짜기로 다닐지라도 해를 두려워하지 않을 것은 주께서 나와 함께하심이라.',
    ),
    BibleVerse(
      reference: '시편 23:6',
      text: '내 평생에 선하심과 인자하심이 반드시 나를 따르리니 내가 여호와의 집에 영원히 살리로다.',
    ),
    BibleVerse(
      reference: '시편 16:8',
      text: '내가 여호와를 항상 내 앞에 모시며 그가 내 오른쪽에 계시므로 내가 흔들리지 아니하리로다.',
    ),
    BibleVerse(
      reference: '시편 27:1',
      text: '여호와는 나의 빛이요 나의 구원이시니 내가 누구를 두려워하리요.',
    ),
    BibleVerse(
      reference: '시편 34:8',
      text: '너희는 여호와의 선하심을 맛보아 알지어다.',
    ),
    BibleVerse(
      reference: '시편 46:1',
      text: '하나님은 우리의 피난처시요 힘이시니 환난 중에 만날 큰 도움이시라.',
    ),
    BibleVerse(
      reference: '시편 91:1',
      text: '지존자의 은밀한 곳에 거주하는 자는 전능하신 자의 그늘 아래에 거하리로다.',
    ),
    BibleVerse(
      reference: '시편 119:105',
      text: '주의 말씀은 내 발에 등이요 내 길에 빛이니이다.',
    ),
    BibleVerse(
      reference: '시편 121:1-2',
      text: '내가 산을 향하여 눈을 들리라 나의 도움이 어디서 올까 나의 도움은 천지를 지으신 여호와에게서로다.',
    ),
    BibleVerse(
      reference: '시편 139:14',
      text: '내가 주께 감사하옴은 나를 지으심이 심히 기묘하심이라.',
    ),
    BibleVerse(
      reference: '잠언 3:5-6',
      text: '너는 마음을 다하여 여호와를 신뢰하고 스스로 명철을 의지하지 말라 그리하면 네 길을 지도하시리라.',
    ),
    BibleVerse(
      reference: '이사야 40:31',
      text: '오직 여호와를 앙망하는 자는 새 힘을 얻으리니 독수리가 날개 치며 올라감 같을 것이요.',
    ),
    BibleVerse(
      reference: '이사야 41:10',
      text: '두려워하지 말라 내가 너와 함께함이니라 놀라지 말라 나는 네 하나님이 됨이니라.',
    ),
    BibleVerse(
      reference: '이사야 43:1',
      text: '너는 두려워하지 말라 내가 너를 구속하였고 내가 너를 지명하여 불렀나니 너는 내 것이라.',
    ),
    BibleVerse(
      reference: '예레미야 29:11',
      text: '너희를 향한 나의 생각은 재앙이 아니라 평안이요 장래에 소망을 주려 하는 생각이라.',
    ),
    BibleVerse(
      reference: '예레미야애가 3:22-23',
      text: '여호와의 인자와 긍휼이 무궁하심으로 우리가 진멸되지 아니함이니 아침마다 새로우니 주의 성실이 크도소이다.',
    ),
    BibleVerse(
      reference: '스가랴 4:6',
      text: '힘으로 되지 아니하며 능으로 되지 아니하고 오직 나의 영으로 되는이라.',
    ),
    BibleVerse(
      reference: '마태복음 5:16',
      text: '너희는 세상의 빛이라 너희 빛을 사람 앞에 비추어 너희 착한 행실을 보게 하라.',
    ),
    BibleVerse(
      reference: '마태복음 6:33',
      text: '너희는 먼저 그의 나라와 그의 의를 구하라 그리하면 이 모든 것을 너희에게 더하시리라.',
    ),
    BibleVerse(
      reference: '마태복음 11:28',
      text: '수고하고 무거운 짐 진 자들아 다 내게로 오라 내가 너희를 쉬게 하리라.',
    ),
    BibleVerse(
      reference: '마태복음 28:20',
      text: '볼지어다 내가 세상 끝날까지 너희와 항상 함께 있으리라.',
    ),
    BibleVerse(
      reference: '마가복음 9:23',
      text: '믿는 자에게는 능히 하지 못할 일이 없느니라.',
    ),
    BibleVerse(
      reference: '누가복음 1:37',
      text: '대저 하나님의 모든 말씀은 능하지 못하심이 없느니라.',
    ),
    BibleVerse(
      reference: '요한복음 3:16',
      text: '하나님이 세상을 이처럼 사랑하사 독생자를 주셨으니 이는 그를 믿는 자마다 멸망하지 않고 영생을 얻게 하려 하심이라.',
    ),
    BibleVerse(
      reference: '요한복음 8:12',
      text: '나는 세상의 빛이니 나를 따르는 자는 어둠에 다니지 아니하고 생명의 빛을 얻으리라.',
    ),
    BibleVerse(
      reference: '요한복음 14:6',
      text: '내가 곧 길이요 진리요 생명이니 나로 말미암지 않고는 아버지께로 올 자가 없느니라.',
    ),
    BibleVerse(
      reference: '요한복음 16:33',
      text: '담대하라 내가 세상을 이기었노라.',
    ),
    BibleVerse(
      reference: '사도행전 1:8',
      text: '성령이 너희에게 임하시면 너희가 권능을 받고 내 증인이 되리라.',
    ),
    BibleVerse(
      reference: '로마서 5:8',
      text: '우리가 아직 죄인 되었을 때에 그리스도께서 우리를 위하여 죽으심으로 하나님께서 우리에 대한 사랑을 확증하셨느니라.',
    ),
    BibleVerse(
      reference: '로마서 8:28',
      text: '하나님을 사랑하는 자 곧 그의 뜻대로 부르심을 입은 자들에게는 모든 것이 합력하여 선을 이루느니라.',
    ),
    BibleVerse(
      reference: '로마서 8:31',
      text: '만일 하나님이 우리를 위하시면 누가 우리를 대적하리요.',
    ),
    BibleVerse(
      reference: '로마서 12:2',
      text: '이 세대를 본받지 말고 마음을 새롭게 함으로 변화를 받아 하나님의 선하시고 온전하신 뜻이 무엇인지 분별하라.',
    ),
    BibleVerse(
      reference: '고린도전서 13:13',
      text: '믿음, 소망, 사랑 이 세 가지는 항상 있을 것인데 그중의 제일은 사랑이라.',
    ),
    BibleVerse(
      reference: '고린도전서 16:14',
      text: '너희 모든 일을 사랑으로 행하라.',
    ),
    BibleVerse(
      reference: '고린도후서 5:17',
      text: '누구든지 그리스도 안에 있으면 새로운 피조물이라 이전 것은 지나갔으니 보라 새 것이 되었도다.',
    ),
    BibleVerse(
      reference: '고린도후서 12:9',
      text: '내 은혜가 네게 족하도다 이는 내 능력이 약한 데서 온전하여짐이라.',
    ),
    BibleVerse(
      reference: '갈라디아서 2:20',
      text: '이제 내가 육체 가운데 사는 것은 나를 사랑하사 자기 몸을 버리신 하나님의 아들을 믿는 믿음 안에서 사는 것이라.',
    ),
    BibleVerse(
      reference: '에베소서 2:8',
      text: '너희가 그 은혜에 의하여 믿음으로 말미암아 구원을 받았으니 이것은 너희에게서 난 것이 아니요 하나님의 선물이라.',
    ),
    BibleVerse(
      reference: '에베소서 6:10',
      text: '끝으로 너희가 주 안에서와 그의 힘의 능력으로 강건하여지고.',
    ),
    BibleVerse(
      reference: '빌립보서 4:6',
      text: '아무것도 염려하지 말고 오직 모든 일에 기도와 간구로 너희 구할 것을 감사함으로 하나님께 아뢰라.',
    ),
    BibleVerse(
      reference: '빌립보서 4:13',
      text: '내게 능력 주시는 자 안에서 내가 모든 것을 할 수 있느니라.',
    ),
    BibleVerse(
      reference: '데살로니가전서 5:16-18',
      text: '항상 기뻐하라 쉬지 말고 기도하라 범사에 감사하라 이것이 그리스도 예수 안에서 너희를 향하신 하나님의 뜻이니라.',
    ),
    BibleVerse(
      reference: '디모데후서 1:7',
      text: '하나님이 우리에게 주신 것은 두려워하는 마음이 아니요 오직 능력과 사랑과 절제하는 마음이니.',
    ),
    BibleVerse(
      reference: '히브리서 4:16',
      text: '긍휼하심을 받고 때를 따라 돕는 은혜를 얻기 위하여 은혜의 보좌 앞에 담대히 나아갈 것이니라.',
    ),
    BibleVerse(
      reference: '히브리서 11:1',
      text: '믿음은 바라는 것들의 실상이요 보이지 않는 것들의 증거니.',
    ),
    BibleVerse(
      reference: '야고보서 1:5',
      text: '너희 중에 누구든지 지혜가 부족하거든 모든 사람에게 후히 주시고 꾸짖지 아니하시는 하나님께 구하라.',
    ),
    BibleVerse(
      reference: '베드로전서 5:7',
      text: '너희 염려를 다 주께 맡기라 이는 그가 너희를 돌보심이라.',
    ),
    BibleVerse(
      reference: '요한일서 1:9',
      text: '만일 우리가 우리 죄를 자백하면 그는 미쁘시고 의로우사 우리 죄를 사하시며 우리를 모든 불의에서 깨끗하게 하실 것이요.',
    ),
    BibleVerse(
      reference: '요한계시록 3:20',
      text: '볼지어다 내가 문 밖에 서서 두드리노니 누구든지 내 음성을 듣고 문을 열면 내가 그에게로 들어가 그와 더불어 먹고 그는 나와 더불어 먹으리라.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = _random.nextInt(_verses.length);
  }

  void _pickVerse() {
    setState(() {
      int nextIndex = _random.nextInt(_verses.length);
      while (nextIndex == _currentIndex && _verses.length > 1) {
        nextIndex = _random.nextInt(_verses.length);
      }
      _currentIndex = nextIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final verse = _verses[_currentIndex];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFCE7F3), Color(0xFFE0EAFC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text(
                  '오늘의 말씀',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF5A3FFF),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '말씀을 클릭해 오늘의 힘을 받아보세요',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6F6C90),
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _pickVerse,
                        child: Hero(
                          tag: 'bibleCard',
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                            height: 180,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFFB4ED), Color(0xFFB5A7FF)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x339C6BFF),
                                  offset: Offset(0, 18),
                                  blurRadius: 32,
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 28,
                                  left: 28,
                                  right: 28,
                                  child: Container(
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 32,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.85),
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: const Text(
                                      '오늘의 말씀',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF5A3FFF),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 70,
                                  child: Container(
                                    height: 64,
                                    width: 88,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: const Icon(
                                      Icons.auto_stories,
                                      size: 36,
                                      color: Color(0xFF9C6BFF),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 18,
                                  right: 30,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFEF08A),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.favorite,
                                      size: 14,
                                      color: Color(0xFFFB7185),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder: (child, animation) => FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0, 0.2),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        ),
                        child: Column(
                          key: ValueKey(verse.reference),
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(28),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x1A000000),
                                    blurRadius: 24,
                                    offset: Offset(0, 12),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    '"${verse.text}"',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5,
                                      color: Color(0xFF3F3D56),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    verse.reference,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF9C6BFF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              '성경책을 톡! 하고 눌러 더 많은 말씀을 만나보세요',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6F6C90),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BibleVerse {
  final String reference;
  final String text;

  const BibleVerse({required this.reference, required this.text});
}
