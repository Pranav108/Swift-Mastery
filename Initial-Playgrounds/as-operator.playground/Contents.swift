
//type check operator (is) to check whether an instance is of a certain subclass type


// Casting doesn’t actually modify the instance or change its values. The underlying instance remains the same
// it’s simply treated and accessed as an instance of the type to which it has been cast.

let str : String?

class Animal{
    var info = "I'm Animal"
}

class Dog : Animal{
    var dogName : String
    init(dogName : String) {
        self.dogName = dogName
    }
}

class Cat : Animal{
    var catName : String
    init(catName : String) {
        self.catName = catName
    }
}

var animal = Animal()
var dog = Dog(dogName: "dogDog")
var cat : Cat?
cat = Cat(catName: "catDog")
print(cat)

var anm = dog as Animal // Convertible
var anm2 = animal as? Dog // non-Convertible
print(anm)
print(anm2)

if let petCat = cat as! Animal {
    print(petCat)
    print("cat can be converted to Animal")
}else{
    print("cat cannot be converted to Animal")
}

if let animal = animal as? Cat{
    print(animal)
    print("animal can be converted to Cat")
}else{
    print("animal cannot be converted to Animal")
}
