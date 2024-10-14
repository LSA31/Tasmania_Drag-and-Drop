import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotion Drag & Drop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> emotions = ['🙂', '😢', '😡', '😂', '😱', '😍', '😴', '🤢'];
  String droppedEmotion1 = '';
  String droppedEmotion2 = '';
  String droppedEmotion3 = '';
  String droppedEmotion4 = '';
  String droppedEmotion5 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag and Drop Emotions'),
      ),
      body: Row(
        children: [
          // 왼쪽 감정 이모티콘 목록
          Container(
            width: 100, // 감정 이모티콘이 들어갈 영역 크기
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: emotions.map((emotion) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Draggable<String>(
                    data: emotion,
                    child: Text(emotion, style: TextStyle(fontSize: 40)),
                    feedback: Material(
                      color: Colors.transparent,
                      child: Text(emotion, style: TextStyle(fontSize: 40)),
                    ),
                    childWhenDragging: Text(
                      emotion,
                      style: TextStyle(fontSize: 40, color: Colors.grey),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // 배경 이미지 및 드래그 앤 드롭 영역
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  // 배경 이미지 크기를 줄임
                  Center(
                    child: Container(
                      width: 700, // 이미지의 가로 크기
                      height: 700, // 이미지의 세로 크기
                      child: Image.asset(
                        'assets/background.png', // 이미지 경로
                        fit: BoxFit.contain, // 이미지 크기 조정 옵션
                      ),
                    ),
                  ),
                  // 얼굴 1 (왼쪽 아래)
                  Positioned(
                    left: 60,
                    top: 280,
                    child: DragTarget<String>(
                      onAccept: (data) {
                        setState(() {
                          droppedEmotion1 = data;
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return _buildEmotionCircle(droppedEmotion1);
                      },
                    ),
                  ),
                  // 얼굴 2 (가운데 왼쪽)
                  Positioned(
                    left: 100,
                    top: 150,
                    child: DragTarget<String>(
                      onAccept: (data) {
                        setState(() {
                          droppedEmotion2 = data;
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return _buildEmotionCircle(droppedEmotion2);
                      },
                    ),
                  ),
                  // 얼굴 3 (가운데 중앙)
                  Positioned(
                    left: 200,
                    top: 150,
                    child: DragTarget<String>(
                      onAccept: (data) {
                        setState(() {
                          droppedEmotion3 = data;
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return _buildEmotionCircle(droppedEmotion3);
                      },
                    ),
                  ),
                  // 얼굴 4 (오른쪽 중앙)
                  Positioned(
                    left: 300,
                    top: 150,
                    child: DragTarget<String>(
                      onAccept: (data) {
                        setState(() {
                          droppedEmotion4 = data;
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return _buildEmotionCircle(droppedEmotion4);
                      },
                    ),
                  ),
                  // 얼굴 5 (오른쪽 아래)
                  Positioned(
                    left: 280,
                    top: 280,
                    child: DragTarget<String>(
                      onAccept: (data) {
                        setState(() {
                          droppedEmotion5 = data;
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return _buildEmotionCircle(droppedEmotion5);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 얼굴 자리에 감정 이모티콘을 표시하기 위한 원형 위젯
  Widget _buildEmotionCircle(String emotion) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(
        child: Text(
          emotion.isNotEmpty ? emotion : 'Drop here!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
