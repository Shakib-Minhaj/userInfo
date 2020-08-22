package userinfo

class RegDB {
    String name
    Integer age
    String countryName
    String stateName
    String divisionName
    String currentLocationTextBox

    static constraints = {
        name unique: true
    }
}
