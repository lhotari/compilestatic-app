class Person implements Serializable, Comparable<Person> {
    static simpsons = where {
         lastName == "Simpson"
    }

    Long id
    Long version
    String firstName
    String lastName
    Integer age = 0
    Set<Pet> pets = [] as Set
    static hasMany = [pets:Pet]
    Face face

//    static peopleWithOlderPets = where {
//        pets {
//            age > 9
//        }
//    }
//    static peopleWithOlderPets2 = where {
//        pets.age > 9
//    }

    static Person getByFirstNameAndLastNameAndAge(String firstName, String lastName, int age) {
        find( new Person(firstName: firstName, lastName: lastName, age: age) )
    }

    static mapping = {
        firstName index:true
        lastName index:true
        age index:true
    }

    static constraints = {
        face nullable:true
    }

    @Override
    int compareTo(Person t) {
        age <=> t.age
    }
}

