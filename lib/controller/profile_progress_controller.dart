import 'package:get/get.dart';

class ProfileProgressController extends GetxController {
  final RxInt _currentStep = 1.obs;
  final int totalSteps = 5;

  int get currentStep => _currentStep.value;
  double get progress => _currentStep.value / totalSteps;
  int get percentage => ((_currentStep.value / totalSteps) * 100).toInt();

  void setStep(int step) {
    if (step >= 1 && step <= totalSteps) {
      _currentStep.value = step;
    }
  }

  final RxInt profileStrength = 95.obs;
}