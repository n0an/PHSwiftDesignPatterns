//: Playground - noun: a place where people can play

import UIKit

// ========= KVC ============

struct Character {
    var name: String
    var city: City
}

struct City {
    var name: String
    var sights: [String]
}

let london = City(name: "London", sights: ["Tower of London", "Buckingham Palace"])
let bear = Character(name: "Paddington Bear", city: london)
let detective = Character(name: "Sherlock Holmes", city: london)
var spy = Character(name: "James Bond", city: london)

print(spy.city.name)

let characterName = \Character.name

print(bear[keyPath: characterName])
print(detective[keyPath: characterName])
print(spy[keyPath: characterName])

let cityName = \Character.city.name
print(spy[keyPath: cityName])

let exampleSight = \Character.city.sights[0]
let characterSight = spy[keyPath: exampleSight]
print(characterSight)


spy[keyPath: exampleSight] = "None"


print(spy.city.sights[0])

print(characterSight)

print(spy[keyPath: \Character.city.sights[0]])

// ========= KVO ============


class CoffeeShop: NSObject {
    @objc dynamic var remainingBeans = 10_000
}


let blueBottle = CoffeeShop()

blueBottle.observe(\.remainingBeans, options: .new) { (coffeShop, change) in
    
    print(coffeShop.remainingBeans)
}

blueBottle.remainingBeans -= 1
blueBottle.remainingBeans -= 5
blueBottle.remainingBeans -= 3


let vw = UIView()

let overver = vw.observe(\.isHidden, options: .new) { view, change in
    print(view.isHidden)
}

vw.isHidden = true
vw.isHidden = false
vw.isHidden = true

// ========= KeyPath for associatedtype ============


protocol Identifiable {
    associatedtype ID
    static var idKey: WritableKeyPath<Self, ID> { get }
}

struct Person: Identifiable {
    static let idKey = \Person.socialSecurityNumber
    var socialSecurityNumber: String
    var name: String
}

struct Book: Identifiable {
    static let idKey = \Book.isbn
    var isbn: String
    var title: String
}

func printID<T: Identifiable>(thing: T) {
    print(thing[keyPath: T.idKey])
}


let taylor = Person(socialSecurityNumber: "555-55-5555", name: "Taylor Swift")
printID(thing: taylor)













