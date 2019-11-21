//
//  TrainingCellView.swift
//  TrainingsSwiftUI
//
//  Created by Ludovic Ollagnier on 21/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import SwiftUI

struct TrainingCellView: View {

    @State var training: Training

    var body: some View {
        VStack(alignment: .leading) {
            Text(training.theme)
            HStack {
                Text("\(training.duration) jours")
                if training.trainer != nil {
                    Text("avec \(training.trainer!.firstName)")
                }
            }.foregroundColor(Color.gray)
            if training.style == .remote {
                Spacer()
                Image(systemName: "desktopcomputer")
            }
        }
    }
}

struct TrainingCellView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingCellView(training: Training(theme: "Demo", duration: 5, isFull: true, trainer: nil, style: .onSite))
    }
}
