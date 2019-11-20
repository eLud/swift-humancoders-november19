//
//  ContentView.swift
//  TrainingsSwiftUI
//
//  Created by Ludovic Ollagnier on 19/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var theme: String = ""
    @State private var duration: Int = 0
    @State private var trainerName: String = ""
    @State private var isFull: Bool = false
    @State private var style: Training.Style = .onSite

    @EnvironmentObject var manager: TrainingManager

    var body: some View {
        NavigationView {
            Form {
                TextField("Theme", text: $theme)
                HStack {
                    Stepper("Duration", value: $duration)
                    Text("\(duration)")
                        .font(.largeTitle)
                        .opacity(0.3)
                }
                TextField("Trainer name", text: $trainerName)
                Toggle(isOn: $isFull) {
                    Text("Is Full ?")
                }
                Picker("Style", selection: $style) {
                    ForEach(Training.Style.allCases) { style in
                        Text(style.test()).tag(style)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                Section {
                    Button(action: {
                        self.saveContent()
                    }) {
                        Text("Save")
                    }
                }
            }
            .navigationBarTitle("New Training")
        } .navigationViewStyle(StackNavigationViewStyle())

    }

    func saveContent() {
        let training = Training(theme: theme, duration: duration, isFull: isFull, trainer: Trainer(firstName: trainerName), style: style)
        manager.add(training)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TrainingManager())
    }
}
