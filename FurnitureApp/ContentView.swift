//
//  ContentView.swift
//  FurnitureApp
//
//  Created by didin amarudin on 09/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var qty: Int = 0
    var body: some View {
       HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


