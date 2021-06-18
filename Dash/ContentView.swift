//
//  ContentView.swift
//  Dash
//
//  Created by Kerby Jean on 6/16/21.
//

import SwiftUI


struct ContentView: View {
        
    var viewModel = ViewModel()
    
    var body: some View {
            NavigationView {
                List {
                    if viewModel.list() != nil {
                        ForEach(viewModel.list()!, id: \.self) { item in
                            NavigationLink( destination: DestinationView(items: Array(item[1..<item.count]))) {
                                Text(item.first!).font(.subheadline)
                            }
                        }
                    }
                }
                .navigationBarTitle("Dash")
            }
        }
    }

    struct DestinationView : View {
        var items: [Substring]
        var body: some View {
            List {
                if self.items.count > 0 {
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
