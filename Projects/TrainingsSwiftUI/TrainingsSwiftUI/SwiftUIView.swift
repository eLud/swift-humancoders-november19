//
//  SwiftUIView.swift
//  TrainingsSwiftUI
//
//  Created by Ludovic Ollagnier on 22/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) { /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Content@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
