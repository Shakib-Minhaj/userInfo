package userinfo

class UserFormController {

    def index() {

    }

    def add() {

    }

    def addSuccess() {
        def addStudent = new RegDB(name:params.name, age:params.age, countryName:params.countryName, stateName:params.stateName, divisionName:params.divisionName, currentLocationTextBox:params.currentLocationTextBox) //info from add.gsp
        addStudent.save()                  //saving into database
        render "Registration Successful"
    }

    def countryDropDown(long countryId) {
        Country country = Country.get(countryId)
        def states = []
        if ( country != null ) {
            states = State.findAllByCountry(country, [order:'name'])
        }
        render g.select(id:'subCategory', name:'subCategory.id',
                from:states, optionKey:'id', noSelection:['':'-Choose State-']
        )
    }

}
