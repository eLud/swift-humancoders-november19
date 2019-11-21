//
//  Training.swift
//  Trainings
//
//  Created by Ludovic Ollagnier on 19/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

struct Training: Equatable, Identifiable {

    // Enums can have rawValue : String, Characters, Int / Double / Float
    enum Style: Int, CaseIterable, Identifiable {
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

        var id: Style {
            return self
        }
    }

    let theme: String
    let duration: Int
    var isFull: Bool
    var trainer: Trainer? // Optional<Trainer>
    let style: Style

    let id: UUID = UUID()
}
