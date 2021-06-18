//
//  ViewModel.swift
//  Dash
//
//  Created by Kerby Jean on 6/18/21.
//

import Foundation

struct ViewModel {
    
    private var items: [String]?
    
    init() {
        let url = Bundle.main.url(forResource: "lineitems", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let items = try? decoder.decode([String].self, from: data)
        self.items = items ?? nil
    }
    
    func list() -> [[String.SubSequence]]? {
        guard let items = self.items else { return nil }
        var array = [String]()
        for (i, j) in items.enumerated() {
            if i > 0 && i != items.count - 1 {
                if !items[i + 1].contains(j) {
                    array.append(j)
                }
            }
        }
        return array.map {$0.split(separator: "-")}
    }
}
