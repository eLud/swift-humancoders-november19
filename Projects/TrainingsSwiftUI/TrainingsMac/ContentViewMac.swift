//
//  ContentView.swift
//  TrainingsMac
//
//  Created by Ludovic Ollagnier on 22/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import SwiftUI

struct ContentViewMac: View {
    var body: some View {

        TabView {
            NavigationView {
                List {
                    NavigationLink(destination: Text("")) {
                        Text("A")
                    }
                    Text("A")
                    Text("A")
                    Text("A")
                    Text("A")
                }
            }
            .tabItem {
                Text("List")
            }
            Color.red
                .tabItem {
                    Text("Red")
            }
            .edgesIgnoringSafeArea(.top)

            Color.blue
                .tabItem {
                    Text("Blue")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewMac()
    }
}
