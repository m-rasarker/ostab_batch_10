void main()
{
  var persons= {
    'name': 'Mohammad Ruhul amin',
    'age': 46,
    'city' : 'Dhaka'


  };

  persons.addAll({'Coun': 'Bangla'});
print(persons);
var keylist =persons.keys;
var valList =persons.values;
print(keylist);
  print(valList);

  Set<String> name ={'ruhul','amin','sarker'};
  Set<String> name2 ={'sarker'};
  print(name.union(name2));


}