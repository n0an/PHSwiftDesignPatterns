//: Playground - noun: a place where people can play

import UIKit


@objc protocol MoviePlayerDelegate {
    @objc optional func movieShouldPause() -> Bool
    func movieWillEnd()
}

struct MoviePlayer {
    var delegate: MoviePlayerDelegate?
    
    func pausePressed() -> Bool {
        return delegate?.movieShouldPause?() ?? true
    }
}




protocol Identifiable {
    associatedtype IDType
    var id: IDType { get set }
}


struct Person: Identifiable {
//    typealias IDType = String
    var id: String
}

struct WebPage: Identifiable {
//    typealias IDType = URL
    var id: URL
}


//let taylor: Identifiable = Person(id: "555-55-5555")



protocol SomeProto {
    var id: Int { get set }
}

extension SomeProto {
    var id: Int {
        return 5
    }
}

// ============================================================

protocol Item {
    var name: String { get set }
}

protocol Purchasable: Item {
    var price: Decimal { get set }
    func purchase()
}

protocol Printable: Item {
    var printFile: URL { get set }
    func printOut()
}

protocol Borrowable: Item {
    var borrowers: [String] { get set }
    mutating func lend(to: String)
}

protocol Listenable: Item {
    var audioFile: URL { get set }
    func playPreview()
}

extension Purchasable {
    func purchase() {
        print("Bought \(name)!")
    }
}

extension Printable {
    func printOut() {
        print("Printing…")
    }
}

extension Borrowable {
    mutating func lend(to person: String) {
        borrowers.append(person)
    }
}

extension Listenable {
    func playPreview() {
        print("Previewing…")
    }
}

struct Book: Purchasable, Printable, Borrowable {
    var name: String
    var price: Decimal
    var printFile: URL
    var borrowers: [String]
}

struct AudioBook: Purchasable, Listenable, Borrowable {
    var name: String
    var price: Decimal
    var audioFile: URL
    var borrowers: [String]
}


struct Magazine: Purchasable {
    var name: String
    var price: Decimal
}





protocol ListDelegate: AnyObject {
    func item(_ item: String, didUpdate quantity: Int)
}

struct ItemDetailController {
    weak var delegate: ListDelegate?
}














