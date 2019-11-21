//
//  TrainingManager.swift
//  Trainings
//
//  Created by Ludovic Ollagnier on 19/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import SwiftUI
/// This manages trainings
class TrainingManager: ObservableObject {

    @Published var trainings: [Training] // Array<Training>

    init(demoData: Bool = false) {

        trainings = []
        
        if demoData {
            let me = Trainer(firstName: "Ludovic")
            trainings.append(Training(theme: "iOS avec Swift", duration: 5, isFull: false, trainer: me, style: .onSite))
            trainings.append(Training(theme: "SwiftUI pour développeur iOS", duration: 3, isFull: false, trainer: me, style: .onSite))
            trainings.append(Training(theme: "Kotlin", duration: 3, isFull: false, trainer: nil, style: .onSite))
            trainings.append(Training(theme: "Android", duration: 4, isFull: false, trainer: nil, style: .remote))

            simulateChanges()
        }
    }

    func simulateChanges() {
        let hugo = Trainer(firstName: "Hugo Lepetit")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.add(Training(theme: "Ruby", duration: 3, isFull: false, trainer: hugo, style: .onSite))
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
            self.add(Training(theme: "Ruby on rails", duration: 3, isFull: false, trainer: hugo, style: .remote))
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            self.add(Training(theme: "Tests avec Ruby on rails", duration: 3, isFull: false, trainer: hugo, style: .onSite))
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6)) {
            let removed = self.list[0]
            self.remove(removed)
            self.add(removed)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(7)) {
            self.trainings.shuffle()
        }
    }
    
    func add(_ training: Training) {
        trainings.append(training)
    }

    var list: [Training] {
        return trainings
    }

    /// Removes a training
    /// - Parameter training: the Training to remove
    func remove(_ training: Training) {
        guard let index = trainings.firstIndex(of: training) else { return }
        trainings.remove(at: index)
    }
}
