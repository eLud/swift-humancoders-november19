//
//  TabBarView.swift
//  TrainingsSwiftUI
//
//  Created by Ludovic Ollagnier on 22/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import SwiftUI

struct TabBarInitialView: View {
    var body: some View {
        TabView {
            TrainingListView()
                .tabItem {
                Image(systemName: "list.bullet")
                Text("List")
            }
            Color.red
                .tabItem {
                Text("Red")
                Image(systemName: "circle")
            }
            .edgesIgnoringSafeArea(.top)

            Color.blue
                .tabItem {
                Text("Blue")
                Image(systemName: "square")
            }
            .edgesIgnoringSafeArea(.all)
        }.edgesIgnoringSafeArea(.top)

    }
}
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarInitialView().environmentObject(TrainingManager(demoData: true))
    }
}
