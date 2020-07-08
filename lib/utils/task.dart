class Task {
  String taskMessage;
  String date;
  int id;

  Task({this.taskMessage, this.date, this.id});

  Map<String, dynamic> toMap() {
    return {'taskMessage': this.taskMessage, 'date': this.date, 'id': this.id};
  }

  Task.fromMap(Map<String, dynamic> map) {
    taskMessage = map['taskMessage'];
    date = map['date'];
    id = map['id'];
  }
}
