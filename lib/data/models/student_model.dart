class StudentModelFields {
  static const String id = "_id";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String age = "age";
  static const String gender = "gender";
  static const String course = "course";
  static const String image = "image";
  static const String tableStudent = "tableStudent";
}

class StudentModel {
  int? id;
  final String firstName;
  final String lastName;
  final String age;
  final String gender;
  final String course;
  final String image;

  StudentModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.course,
    required this.image,
  });

  StudentModel copyWith({
    String? firstName,
    String? lastName,
    String? age,
    String? gender,
    String? course,
    String? image,
    int? id,
  }) {
    return StudentModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      image: image ?? this.image,
      gender: gender ?? this.gender,
      course: course ?? this.course,
      id: id ?? this.id,
    );
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      firstName: json[StudentModelFields.firstName] ?? "",
      lastName: json[StudentModelFields.lastName] ?? "",
      age: json[StudentModelFields.age] ?? "",
      gender: json[StudentModelFields.gender] ?? "",
      image: json[StudentModelFields.image] ?? "",
      course: json[StudentModelFields.course] ?? "",
      id: json[StudentModelFields.id] ?? 0,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      StudentModelFields.firstName: firstName,
      StudentModelFields.lastName: lastName,
      StudentModelFields.age: age,
      StudentModelFields.gender: gender,
      StudentModelFields.image: image,
      StudentModelFields.course: course
    };
  }

  @override
  String toString() {
    return '''
      firstName: $firstName
      lastName: $lastName
      image: $image
      age: $age
      gender: $gender
      course: $course
      id: $id, 
    ''';
  }
}
