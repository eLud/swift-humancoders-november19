//
//  Trainer.swift
//  Trainings
//
//  Created by Ludovic Ollagnier on 19/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

struct Trainer: Equatable {
    var firstName: String

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
