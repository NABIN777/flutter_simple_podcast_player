import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podtalk/features/splash/presentation/state/splash_view_model.dart';

import '../../../../config/routers/app_route.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.popAndPushNamed(context, AppRoute.dashRoute);
      ref.read(splashViewModelProvider.notifier).init(context);
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const Text(
                  'Podtalk',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                const Text('version : 1.0.0')
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width / 4,
            child: const Text(
              'Developed by: Nabin Khanal',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
