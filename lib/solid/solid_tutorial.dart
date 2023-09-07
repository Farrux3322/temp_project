//---------------S.O.L.I.D-----------------------

/*
Obyekga yo'naltirilgan dasturlashda SOLID bu dasturiy taminot dizaynini
tushunarli moslashuvchan uzoq vaqt xizmat ko'rsatadigan qilish uchun
mo'ljallangan beshta dizayn tammoyillari uchun mnemonik qisqartmasi


 */

//------------------SINGLE RESPONSIBILITY PRINCIPLE-------------------

/*

Yagona javobgarlik tamoyili

har bir class/metodni faqat bitta javobgarligi bo'lishi kerak

 */



// Bu xato sababi xar bir class malum vazifanigina bajarishi kerak bu yerda loguot va registor metodlari boshqa class ga opchiqilishi kerak
class User{
  final String username;
  final String password;

  void userRegisterInGoogle(){}

  void userLogOut(){}
}
// bu tog'ri yo'l
class User{
  final String username;
  final String password;
}
class Auth{
  void userRegisterInGoogle(){}

  void userLogOut(){}
}

//-----------------------OPEN-CLOSED PRINCIPLE--------------------

/*

Ochiq yopiqlik prinsipi

ishlab turgan class ga yangi funksiyalarni qo'shish avvalgilarini o'zgartirmagan xolda

 */

abstract class Area {
  const Area();

  double computeArea();
}

class Rectangle extends Area {
  final double width;
  final double height;
  const Rectangle(this.width, this.height);

  @override
  double computeArea() => width * height;
}

class Circle extends Area {
  final double radius;
  const Circle(this.radius);

  @override
  double computeArea() => radius * radius * pi;
}

class AreaCalculator {
  double calculate(Area shape) => shape.computeArea();
}

//-------------------------LISKOV SUBSTITUTION PRINCIPLE-------------------

/*

Liskov Almashtirish

Ota class objectlarini dasturni buzmasdan subclass object lari bilan almashtirishga imkon beradi
Buning uchun barcha classlar ota class ga o'xshab harakat qilishi kerak

 */

abstract class Shape {
  double area();
}

class Rectangle implements Shape {
  double width;
  double height;

  double area() {
    return width * height;
  }
}

class Square implements Shape {
  double side;

  double area() {
    return pow(side, 2);
  }
}


//--------------------------Interface Segregation Principle------------------

abstract class Area {
  double area();
}

abstract class Perimeter {
  double perimeter();
}

class Rectangle implements Area, Perimeter {
  double width;
  double height;

  double area() {
    return width * height;
  }

  double perimeter() {
    return 2 * (width + height);
  }
}

class Circle implements Areaand {
  double radius;

  double area() {
    return pi * pow(radius, 2);
  }
}


//---------------------Dependency Inversion Principle (DIP)---------------------

abstract class UserRepository {
  void save(User user);
}

class FirebaseUserRepository implements UserRepository {
  void save(User user) {
    // save user to Firebase
  }
}

class UserService {
  UserRepository userRepository;

  UserService(this.userRepository);

  void saveUser(User user) {
    userRepository.save(user);
  }
}

