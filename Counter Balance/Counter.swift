//
//  Counter.swift
//  Counter Balance
//
//  Created by Christian Tobias on 11/3/20.
//

import Foundation

class Counter:ObservableObject {
    @Published var count = UserDefaults.standard.integer(forKey: "CountTapped")
    
    func increment() {
        self.count += 1
        UserDefaults.standard.set(self.count, forKey: "CountTapped")
    }
    
    func decrement() {
        if self.count > 0 {
            self.count -= 1
            UserDefaults.standard.set(self.count, forKey: "CountTapped")
        }
    }
}
