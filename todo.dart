class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [

      ToDo(id: '01', todoText: 'Talk To The Doctor', ),
      ToDo(id: '02', todoText: 'Class on 8:30', ),
      ToDo(id: '03', todoText: 'Text Ahmad ', ),

    ];
  }
}