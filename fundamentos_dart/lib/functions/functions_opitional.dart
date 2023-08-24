void main(List<String> args) {
  printName("Rebeca");
  printName("Jose", lastname: "Silva");

}

printName(String name, {String? lastname} ) {
  print("My name is $name");
  if (lastname != null) {
    print("My lastname is $lastname");
    print(" $name $lastname");
  }
}

