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
    @State var showForm: Bool = false

    var body: some View {
        NavigationView {
            List(manager.list, rowContent: { (training) in
                NavigationLink(destination: TrainingDetailsView(training: training)) {
                    TrainingCellView(training: training)
                }.isDetailLink(true)
            })
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Trainings")
                .navigationBarItems(trailing: Button(action: {
                    self.showForm.toggle()
                }, label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add")
                    }
                }))
                .sheet(isPresented: $showForm) {
                    ContentView().environmentObject(self.manager)
            }
        }
    }
}

struct TrainingListView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingListView().environmentObject(TrainingManager(demoData: true))
    }
}
