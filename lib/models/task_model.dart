class TaskModel {
  String id;
  String title;
  String descrption;
  DateTime dateTime;
  bool isDone;
  TaskModel(
      { this.id='',
      required this.descrption,
      required this.dateTime,
      this.isDone = false,
      required this.title});
}
