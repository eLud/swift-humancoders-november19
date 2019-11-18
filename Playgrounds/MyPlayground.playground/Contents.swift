import UIKit

var str = "Hello, playground"
str = "Hello"

var version: Float = 5.1
let test = 5.21234567898765432
version = Float(test)
version
//test = 5.3 //Cannot assign to value: 'test' is a 'let' constant

let a = 4
let b = 2
let c = Float(a) / Float(b)

var gender: String

if version == 1.0 {
    gender = "M"
} else {

}

//print(gender)

let 😰💣💣🎉🎊: Int = 0
print(😰💣💣🎉🎊)


guard 😰💣💣🎉🎊 == 0, version > 5 else { fatalError() }

//: # Classes et structures

struct Training: Equatable {
    let theme: String
    let duration: Int
    var isFull: Bool
    let trainer: Trainer
}

struct Trainer: Equatable {
    fileprivate var firstName: String

    // Func with no parameter nor return
    func train() {
        print("I train")
    }

    // Func with parameters no return
    func train(in training: Training, during duration: Int) {
        print("I train in \(training) during \(duration) days.")
    }

    func train(in training: Training, during duration: Double) {
        print("I train in \(training) during \(duration) days.")
    }

    func program(for training: Training) -> String {
        return "a program"
    }
}

let me = Trainer(firstName: "Ludovic")
var t1 = Training(theme: "iOS avec Swift", duration: 5, isFull: false, trainer: me)

me.train()
me.train(in: t1, during: 50)

print(me.firstName)

t1.isFull = true

class Meeting {
    let theme: String
    let duration: Int
    var isFull: Bool
    let presenter: Presenter

    init(theme: String, duration: Int, presenter: Presenter) {
        self.theme = theme
        self.duration = duration
        self.isFull = false
        self.presenter = presenter
    }
}
class Presenter: Equatable {

    static func == (lhs: Presenter, rhs: Presenter) -> Bool {
        return lhs.firstName == rhs.firstName
    }

    fileprivate let firstName: String

    //Constructeur
    init(name: String) {
        firstName = name
    }
}

let p1 = Presenter(name: "Ludovic")
let m1 = Meeting(theme: "SwiftUI", duration: 3, presenter: p1)

print(p1.firstName)
m1.isFull = true

//t1.isFull == true
var t2 = t1
t1.isFull = false
t2.isFull

//m1.isFull == true
var m2 = m1
m1.isFull = false
m2.isFull

t1 == t2
m1 === m2
