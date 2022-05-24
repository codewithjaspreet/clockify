import 'package:clockify/view/clock.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2D2F41),
        body: Container(
          padding: EdgeInsets.all(32),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Clockify',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Text(
                'Clockify',
                style: TextStyle(color: Colors.white, fontSize: 64),
              ),
              Clock(),
              Text(
                'Timezone',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.language, color: Colors.white),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'UTC',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          color: Color(0xFF2D2F41),
        ),
      ),
    );
  }
}
