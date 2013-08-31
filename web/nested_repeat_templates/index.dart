import 'dart:html';
import 'package:observe/observe.dart';
class Person {
  String name;
  Address address;
}

class Address {
  String city;
  String zip;
  List<Friend> friends= toObservable(new List<Friend>());
  String childRef;
}
class Friend{
  String fname;
  Address parentAddress;
}

main() {
  var person = new Person()
      ..name = 'Bob Smith'
      ..address = (new Address()
          ..city = 'Springfield'
          ..zip = '99999'
          ..childRef= 'look up from child'
          ..friends.add(new Friend()..fname= 'sed')
          ..friends.add(new Friend()..fname= 'awk')
      );
  person.address.friends[0].parentAddress=person.address;
  query('#tmpl').model = person;
  query('#tmpl2').model = person;
  query('#tmpl2a').model=person;
  query('#tmpl3').model = person.address.friends;
}