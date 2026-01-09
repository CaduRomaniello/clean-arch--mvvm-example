import 'dart:async';

class SplashViewModel {
  SplashViewModel();

  static const Duration animationDuration = Duration(seconds: 3);

  Timer? _animationTimer;
  Timer? _pollTimer;
  bool _animationCompleted = false;
  bool _initCompleted = false;
  bool _navigated = false;

  Future<void> start(void Function() onDone) async {
    _startAnimation();
    await _initialize();
    _tryFinish(onDone);
  }

  void _startAnimation() {
    _animationTimer = Timer(animationDuration, () {
      _animationCompleted = true;
    });
  }

  Future<void> _initialize() async {
    _initCompleted = true;
  }

  void _tryFinish(void Function() onDone) {
    _pollTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_navigated) {
        timer.cancel();
        return;
      }
      if (_animationCompleted && _initCompleted) {
        _navigated = true;
        timer.cancel();
        onDone();
      }
    });
  }

  void dispose() {
    _animationTimer?.cancel();
    _pollTimer?.cancel();
  }
}
