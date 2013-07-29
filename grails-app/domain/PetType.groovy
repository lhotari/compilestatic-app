class PetType implements Serializable {
    private static final long serialVersionUID = 1
    Long id
    Long version
    String name

    static belongsTo = Pet
}
