package userinfo

class BootStrap {

    def init = { servletContext ->
        if (Country.count() == 0) {
            Country bangladesh = new Country(name: 'Bangladesh').save()
            new State(country: bangladesh, name: 'North Bengal').save()
            new State(country: bangladesh, name: 'South Bengal').save()
            new State(country: bangladesh, name: 'Middle Bengal').save()
            Country usa = new Country(name: 'USA').save()
            new State(country: usa, name: 'New York').save()
            new State(country: usa, name: 'California').save()
            new State(country: usa, name: 'Texas').save()
            Country canada = new Country(name: 'Canada').save()
            new State(country: canada, name: 'Alberta').save()
            new State(country: canada, name: 'British Columbia').save()
            new State(country: canada, name: 'Manotoba').save()
        }
    }
    def destroy = {
    }
}
