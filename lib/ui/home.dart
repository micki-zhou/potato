import 'dart:math';

import 'package:flutter/material.dart';
import 'package:potato/model/ParticleModel.dart';
import 'package:potato/model/ParticlePainter.dart';
import 'package:potato/model/Particles.dart';
import 'package:simple_animations/simple_animations/rendering.dart';

class HomePage extends StatefulWidget {
  final int numberOfParticles = 25;

  // HomePage(this.numberOfParticles);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Random random = Random();

  final List<ParticleModel> particles = [];

  @override
  void initState() {
    List.generate(widget.numberOfParticles, (index) {
      particles.add(ParticleModel(random));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Rendering(
      startTime: Duration(seconds: 30),
      onTick: _simulateParticles,
      builder: (context, time) {
        return CustomPaint(
          painter: ParticlePainter(particles, time),
        );
      },
    );
  }

  _simulateParticles(Duration time) {
    particles.forEach((particle) => particle.maintainRestart(time));
  }
}
