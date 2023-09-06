import 'package:bmi_calculator/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class EmptyResultsMessage extends StatefulWidget {
  const EmptyResultsMessage({
    super.key,
  });

  @override
  State<EmptyResultsMessage> createState() => _EmptyResultsMessageState();
}

class _EmptyResultsMessageState extends State<EmptyResultsMessage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: const Offset(0, -0.5),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: SlideTransition(
              position: _animation,
              child: Image.asset(AssetsManager.imageEmpty),
            ),
          ),
          Text(
            'no results saved =[',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
