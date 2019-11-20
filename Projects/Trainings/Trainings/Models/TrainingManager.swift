//
//  TrainingManager.swift
//  Trainings
//
//  Created by Ludovic Ollagnier on 19/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

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
