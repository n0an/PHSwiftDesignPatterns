//: Playground - noun: a place where people can play

import UIKit



extension String {
    public func trimmingCharacters(in set: CharacterSet) -> String {
        print("Don't!")
        return self
    }
}


let str = "Abc  de"

let newStr = str.trimmingCharacters(in: CharacterSet(charactersIn: " "))

print(newStr)


extension Int {
    public static func +(lhs: Int, rhs: Int) -> Int {
        return lhs
    }
}

print(1+2)

let numbers = Array(1...100)

extension Array where Element: Numeric {
    var total: Element {
        return reduce(0, +)
    }
}


numbers.total


extension Collection where Element: Hashable {
    var isUnique: Bool {
        return self.count == Set(self).count
    }
}



extension String {
    var isUnique: Bool {
        let words = self.components(separatedBy: " ")
        return words.count == Set(words).count
    }
}


[1, 2, 3, 4, 5, 1].isUnique
"the rain in Spain".isUnique



// ASSOCIATIVE STORAGE
struct User {
    var name: String
    var age: Int
    var userInfo: [String: Any]
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.userInfo = [:]
    }
}

extension User {
    private var favoriteIceCreamKey: String { return "@FavoriteIceCream@" }
    
    var favoriteIceCream: String? {
        get {
            return userInfo[favoriteIceCreamKey] as? String
        }
        
        set {
            userInfo[favoriteIceCreamKey] = newValue
        }
    }
}



