class Task {
  final String text;
  bool finished;

  Task({this.text, this.finished = false});

  void toggleFinish() {
    finished = !finished;
  }
}
