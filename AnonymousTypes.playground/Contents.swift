//: Playground - noun: a place where people can play

import UIKit


let x = "AnyObject()" as AnyObject

x.storyboard

class SomeClass {
    
    @objc var someProp: NSInteger = 0
    
    @objc func showSomething() {
        print("Something")
    }
    
}

x.showSomething?()

x.description

x.someProp



// define a class that is costly to make, so we want to cache it if possible
class ExpensiveObjectClass { }

// create a cache that holds those objects, keyed by an NSString
let cache = NSCache<NSString, ExpensiveObjectClass>()

// prepare to use an expensive object
let myObject: ExpensiveObjectClass

if let cachedVersion = cache.object(forKey: "CachedObject") {
    // use the cached version
    myObject = cachedVersion
} else {
    // create it from scratch then store in the cache
    myObject = ExpensiveObjectClass()
    cache.setObject(myObject, forKey: "CachedObject")
}




