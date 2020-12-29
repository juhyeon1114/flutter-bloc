import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int _count = 0;
  
  final _countSubject = BehaviorSubject.seeded(0); // BehaviorSubject : stream을 지원함, .seeded(0) : 초기값 = 0

  void addCount() {
    _count++;
    _countSubject.add(_count);
  }

  Stream<int> get count$ => _countSubject.stream;
}