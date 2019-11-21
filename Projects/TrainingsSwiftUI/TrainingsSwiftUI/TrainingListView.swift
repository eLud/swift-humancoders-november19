//
//  TrainingListView.swift
//  TrainingsSwiftUI
//
//  Created by Ludovic Ollagnier on 21/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import SwiftUI

struct TrainingListView: View {

    @EnvironmentObject var manager: TrainingManager

    var body: some View {
        List(manager.list, rowContent: { (training) in
            TrainingCellView(training: training)
        })
            .listStyle(GroupedListStyle())
    }
}

struct TrainingListView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingListView().environmentObject(TrainingManager(demoData: true))
    }
}
