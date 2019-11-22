//
//  TrainingDetailsView.swift
//  TrainingsSwiftUI
//
//  Created by Ludovic Ollagnier on 22/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import SwiftUI

struct TrainingDetailsView: View {

    var training: Training

    var body: some View {
        VStack {
            Text(training.theme)
        }
    }
}

struct TrainingDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingDetailsView(training: Training.demoTraining)
    }
}
