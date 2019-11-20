struct Training: Equatable {

    // Enums can have rawValue : String, Characters, Int / Double / Float
    enum Style: Int {
        // We can refine the rawValue by making it explicit
        case onSite = 0
        case remote = 1

        //Enums can have functions, even inits
        func test() -> String {
            switch self {
            case .onSite:
                return "sur site"
            case .remote:
                return "a distance"
            }
        }
    }

    let theme: String
    let duration: Int
    var isFull: Bool
    var trainer: Trainer? // Optional<Trainer>
    let style: Style
}

struct Trainer: Equatable {
    fileprivate var firstName: String

    // Func with no parameter nor return
    func train() {
        print("I train")
    }

    /// Func with parameters no return
    func train(in training: Training, during duration: Int) {
        print("I train in \(training) during \(duration) days.")
    }

    func train(in training: Training, during duration: Double) {
        print("I train in \(training) during \(duration) days.")
    }

    func program(for training: Training) -> String? {

        guard training.trainer == self else { return nil }
        return "a program"
    }
}

/// This manages trainings
class TrainingManager {

    var trainings: [Training] = [] // Array<Training>

    func add(_ training: Training) {
        trainings.append(training)
    }

    /// Removes a training
    /// - Parameter training: the Training to remove
    func remove(_ training: Training) {
        guard let index = trainings.firstIndex(of: training) else { return }
        trainings.remove(at: index)
    }
}

var training1 = Training(theme: "iOS", duration: 5, isFull: false, trainer: nil, style: .onSite)

print(training1.style.test())

//rawValue can be getted
training1.style.rawValue

//Enums can be built using rawValues
Training.Style(rawValue: 3)

let me = Trainer(firstName: "Ludovic")
training1.trainer = me

let capName = training1.trainer?.firstName.uppercased()
// let completeName = "M." + capName! // ! : force-unwrap operator
let completeName = "M." + (capName ?? "No Trainer") // ?? : nil coalescing operator

let completeName2: String
if capName != nil { // test against nil
    completeName2 = "M. \(capName!)"
} else {
    completeName2 = "No trainer yet"
}

let completeName3: String
if let trainerName = capName { // if-let syntax (Optional binding)
    completeName3 = "M. \(trainerName)"
} else {
    completeName3 = "No trainer yet"
}

let count = capName?.count

guard let trainerName = capName else { fatalError() } // if-let syntax (Optional binding)
trainerName


let testArray = ["A", "b"]
let testSet: Set<String> = []

testArray.contains("A")
testSet.contains("A")
