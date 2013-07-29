class Face implements Serializable {
    Long id
    Long version
    String name
    Nose nose
    Person person
    static hasOne = [nose: Nose]
    static belongsTo = [person:Person]

    static constraints = {
        person nullable:true
    }
}
