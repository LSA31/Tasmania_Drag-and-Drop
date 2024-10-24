import 'package:flutter/material.dart';
import 'dart:ui'; // PathMetric을 사용하기 위해 추가

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

  // 드롭된 감정 이모티콘을 저장할 변수와 외곽선 색상 변수
  String droppedEmotion1 = '';
  String droppedEmotion2 = '';
  String droppedEmotion3 = '';
  String droppedEmotion4 = '';

  // 외곽선이 실선으로 바뀌었는지 확인하는 플래그
  bool isDropped1 = false;
  bool isDropped2 = false;
  bool isDropped3 = false;
  bool isDropped4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Do they like playing with other children or prefer playing alone?'),
        backgroundColor: Color(0xFF7A9EDA), // 바 색상을 #7a9eda로 변경
        toolbarHeight: 70, // 바 크기를 조금 더 크게 설정
      ),
      body: Row(
        children: [
          // 감정 이모티콘 목록을 담은 부분
          Container(
            width: 150, // 감정 이모티콘이 들어갈 영역 크기
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFE0ECFF), // '#e0ecff' 색상 배경
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Emotion Icon 문구 추가
                Text(
                  'Emotion Icons',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7A9EDA),
                  ),
                ),
                SizedBox(height: 10), // 문구와 감정 이모티콘 사이 간격
                ...emotions.map((emotion) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Draggable<String>(
                      data: emotion,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF7A9EDA), // 감정 이모티콘의 색상
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          emotion,
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      feedback: Material(
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF7A9EDA), // 감정 이모티콘의 색상
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            emotion,
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      childWhenDragging: Opacity(
                        opacity: 0.5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF7A9EDA), // 감정 이모티콘의 색상
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            emotion,
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          // 배경 이미지 및 드래그 앤 드롭 영역
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFE0ECFF), // '#e0ecff' 색상 배경
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Stack(
                children: [
                  // 배경 이미지
                  Center(
                    child: Container(
                      width: 700, // 이미지의 가로 크기
                      height: 700, // 이미지의 세로 크기
                      child: Image.asset(
                        'assets/background.png', // 업로드된 이미지 경로
                        fit: BoxFit.contain, // 이미지 크기 조정 옵션
                      ),
                    ),
                  ),
                  // 얼굴 1 (작은 크기 동그라미)
                  Positioned(
                    left: 542,
                    top: 102,
                    child: DragTarget<String>(
                      onAccept: (data) {
                        setState(() {
                          droppedEmotion1 = data;
                          isDropped1 = true; // 드랍된 후 플래그 변경
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return _buildEmotionCircle(droppedEmotion1, 50, 50, isDropped1); // 작은 동그라미
                      },
                    ),
                  ),
                  // 얼굴 2 (기본 크기 동그라미)
                  Positioned(
                    left: 545,
                    top: 468,
                    child: DragTarget<String>(
                      onAccept: (data) {
                        setState(() {
                          droppedEmotion2 = data;
                          isDropped2 = true; // 드랍된 후 플래그 변경
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return _buildEmotionCircle(droppedEmotion2, 70, 70, isDropped2); // 큰 동그라미
                      },
                    ),
                  ),
                  // 얼굴 3 (기본 크기 동그라미)
                  Positioned(
                    left: 910,
                    top: 550,
                    child: DragTarget<String>(
                      onAccept: (data) {
                        setState(() {
                          droppedEmotion3 = data;
                          isDropped3 = true; // 드랍된 후 플래그 변경
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return _buildEmotionCircle(droppedEmotion3, 80, 80, isDropped3); // 큰 동그라미
                      },
                    ),
                  ),
                  // 얼굴 4 (기본 크기 동그라미)
                  Positioned(
                    left: 885,
                    top: 190,
                    child: DragTarget<String>(
                      onAccept: (data) {
                        setState(() {
                          droppedEmotion4 = data;
                          isDropped4 = true; // 드랍된 후 플래그 변경
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return _buildEmotionCircle(droppedEmotion4, 70, 70, isDropped4); // 큰 동그라미
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

  // 점선 외곽선이 있는 원형 위젯
  Widget _buildEmotionCircle(String emotion, double width, double height, bool isDropped) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white, // 원형 안에 흰색 배경 추가
        shape: BoxShape.circle,
        border: isDropped
            ? Border.all(color: Colors.red, width: 2) // 드랍 후 빨간 실선
            : Border.all(color: Colors.transparent, width: 0), // 드랍 전 점선
      ),
      child: isDropped
          ? Center(
        child: Text(
          emotion.isNotEmpty ? emotion : 'Here!',
          style: TextStyle(
            fontSize: width * 0.6, // 드랍된 감정 이모티콘일 때만 크기 증가
          ),
        ),
      )
          : CustomPaint(
        painter: DashedCirclePainter(), // 드랍 전 점선
        child: Center(
          child: Text(
            emotion.isNotEmpty ? emotion : 'Here!',
            style: TextStyle(fontSize: 15), // 드랍 전 'Here!' 문구 폰트 크기
          ),
        ),
      ),
    );
  }
}

// CustomPainter로 점선 원 그리기
class DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var path = Path();
    path.addOval(Rect.fromLTWH(0, 0, size.width, size.height));

    double dashWidth = 5;
    double dashSpace = 5;
    double distance = 0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        pathMetric.getTangentForOffset(distance);
        var extractPath = pathMetric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(extractPath, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}