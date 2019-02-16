import 'package:charity_game/utils/strings.dart';
import 'package:flutter/material.dart';

class DonatedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AnimatedMoney(),
                  Text(
                    Strings.donated_so_far,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedMoney extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedMoneyState();
}

class _AnimatedMoneyState extends State<AnimatedMoney>
    with SingleTickerProviderStateMixin {
  AnimationController animation;

  @override
  void initState() {
    super.initState();

    animation = AnimationController(
      duration: Duration(seconds: 2),
      lowerBound: 0.0,
      upperBound: 764.00,
      vsync: this,
    );

    animation.addListener(() {
      setState(() {});
    });

    animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${animation.value.toStringAsFixed(2)} \$",
      style: TextStyle(
        fontSize: 40.0,
      ),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }
}
