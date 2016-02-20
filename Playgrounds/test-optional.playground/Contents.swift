class Person {
    
    private var _age: Int!
    
    var age: Int {
        
        get {
            if _age == nil {
                _age = 21
            }
            return _age
        }
        
    }
    
    func setAge(newAge: Int) {
        self._age = newAge
    }
}

var johnsmith = Person()
//print(johnsmith._age)
print(johnsmith.age)

