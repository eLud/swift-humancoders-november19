//
//  TrainingManager.swift
//  Trainings
//
//  Created by Ludovic Ollagnier on 19/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

/// This manages trainings
class TrainingManager: Codable {

    var trainings: [Training] = [] // Array<Training>

    init(demoData: Bool = false) {
        if demoData {
            let me = Trainer(firstName: "Ludovic")
            trainings.append(Training(theme: "iOS avec Swift", duration: 5, isFull: false, trainer: me, style: .onSite))
            trainings.append(Training(theme: "SwiftUI pour développeur iOS", duration: 3, isFull: false, trainer: me, style: .onSite))
            trainings.append(Training(theme: "Kotlin", duration: 3, isFull: false, trainer: nil, style: .onSite))
            trainings.append(Training(theme: "Android", duration: 4, isFull: false, trainer: nil, style: .remote))
        }
    }

    var list: [Training] {
        return trainings
    }

    func add(_ training: Training) {
        trainings.append(training)
        NotificationCenter.default.post(name: Notification.Name("modelUpdated"), object: self, userInfo: ["added":training])

        try? save()
    }

    func shuffle() {
        trainings.shuffle()
        NotificationCenter.default.post(name: Notification.Name("modelUpdated"), object: self)
    }

    /// Removes a training
    /// - Parameter training: the Training to remove
    func remove(_ training: Training) {
        guard let index = trainings.firstIndex(of: training) else { return }
        trainings.remove(at: index)
        NotificationCenter.default.post(name: Notification.Name("modelUpdated"), object: self)
    }

    func save() throws {

        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase

        let plistEncoder = PropertyListEncoder()
//        plistEncoder.outputFormat = .xml

        // Traiter l'erreur comme un optional
        if let jsonData = try? jsonEncoder.encode(self) {
            print("json : ", String(data: jsonData, encoding: .utf8)!)

            let fm = FileManager.default
            let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
            if let url = urls.first {
                let finalURL = url.appendingPathComponent("manager.json")
                do {
                    print(finalURL)
                    try jsonData.write(to: finalURL)
                } catch {
                    print(error)
                }
            }
        }

        // Remonter l'erreur (patate chaude) implique que la mathode throws
        let plistData = try plistEncoder.encode(self)
        print("plist : ", plistData)

        // Traiter l'erreur
//        do {
//            let plistData = try plistEncoder.encode(self)
//        } catch {
//            print(error)
//        }

    }

    func restore(data: Data) {
        let decoder = JSONDecoder()
        if let manager = try? decoder.decode(TrainingManager.self, from: data) {
            print(manager)
        }
    }

}
