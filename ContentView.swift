//
//  ContentView.swift
//  Dash
//
//  Created by Kerby Jean on 6/16/21.
//

import SwiftUI

struct ContentView: View {

    let arrays = [["A", "B", "C", "D"], ["E", "F", "G", "H"]]

    var body: some View {
        NavigationView {
            List {
                ForEach(arrays, id: \.self) { item in
                    NavigationLink( destination: DestinationView(items: Array(item[1..<item.count]))) {
                        Text(item.first!).font(.subheadline)
                    }
                }
            }
            .navigationBarTitle("Dash")
        }
    }
}

struct DestinationView : View {
    var items: [String]
    
    var body: some View {
        List {
            if self.items.count < 0 {
                Text("")
            } else {
                NavigationLink( destination: DestinationView(items: Array(items[1..<items.count]))) {
                    Text(items[0]).font(.subheadline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
