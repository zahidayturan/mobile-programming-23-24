import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title = Container(
      padding: const EdgeInsets.all(28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              const Text('41'),
            ],
          ),
        ],
      ),
    );

    Widget text = Container(
      padding: const EdgeInsets.all(28),
      child: const Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        style: TextStyle(height: 1, fontSize: 14),
        textAlign: TextAlign.justify,
        softWrap: true,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MobilProg. 23-24 Ödev-1 Layout',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MobilProgr. 23-24 Ödev-1 / Layout'),
          backgroundColor: Colors.redAccent,
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
               height: 240,
               fit: BoxFit.cover),
            title,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButtonColumn(Colors.blueAccent, Icons.call, 'CALL'),
                _buildButtonColumn(Colors.blueAccent, Icons.near_me, 'ROUTE'),
                _buildButtonColumn(Colors.blueAccent, Icons.share, 'SHARE'),
              ],
            ),
            text,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
