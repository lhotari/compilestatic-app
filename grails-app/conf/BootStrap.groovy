class BootStrap {

    def init = { servletContext ->
        new Person(firstName:'Groovy', lastName:'Tester', age:99).save(flush:true, failOnError:true)
        new Person(firstName:'Reino', lastName:'Tossu', age:50).save(flush:true, failOnError:true)
        new Person(firstName:'Heimo', lastName:'Vesa', age:45).save(flush:true, failOnError:true)

    }
    def destroy = {
    }
}
