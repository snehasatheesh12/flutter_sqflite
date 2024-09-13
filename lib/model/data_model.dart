class StudentModel {
  final int? id;
  final String name;
  final String age;

  StudentModel({this.id, required this.name, required this.age});

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      age: map['age'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
