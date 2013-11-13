@groovy.transform.CompileStatic
class MyService {
    public String firstName(int id) {
        Person.get(id).firstName
    }
    
    public void modifyFirstName(int id) {
        // some dummy testing to ensure that @CompileStatic works properly
        Person.get(id).firstName = Person.get(id).firstName + "."
        Person.get(id).save(flush:true)
    }
}
