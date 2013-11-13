@groovy.transform.CompileStatic
class MyController {

    def index() {
        render text:Person.list().collect{Person p -> p.firstName}.toString()
    }

    def add(Person p) {
        p.save(flush:true, failOnError:true)
        render text:p.id
    }
}
