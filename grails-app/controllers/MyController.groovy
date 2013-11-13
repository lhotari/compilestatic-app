@groovy.transform.CompileStatic
class MyController {
    MyService myService
    
    def index() { 
        render(text:(Person.get(1).firstName + " " + Person.list().collect{Person p -> p.firstName}.toString()))
    }

    def add(Person p) {
        p.save(flush:true, failOnError:true)
        render text:p.id
    }

    def firstName(int id) {
        if(id < 1) id=1
        render text: myService.firstName(id)
    }
    
    def modifyFirstName(int id) {
        if(id < 1) id=1
        myService.modifyFirstName(id)
        render text: Person.get(id).firstName
    }
}
