@groovy.transform.CompileStatic
class MyService {
    public String firstName(int id) {
        Person.get(id).firstName
    }
}
