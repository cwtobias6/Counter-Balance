//
//  ContentView.swift
//  Counter Balance
//
//  Created by Christian Tobias on 10/20/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var count = UserDefaults.standard.integer(forKey: "CountTapped")
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Spacer()
                    
                    Button(action: {
                        self.count += 1
                        UserDefaults.standard.set(self.count, forKey: "CountTapped")
                        playHapticBump()

                    }) {
                        Image(systemName: "plus.circle")
                            .font(Font.system(size: 80.0))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if count > 0 {
                            self.count -= 1
                            UserDefaults.standard.set(self.count, forKey: "CountTapped")

                        }
                        playHapticBump()

                    }) {
                        Image(systemName: "minus.circle")
                            .font(Font.system(size: 80.0))
                            .foregroundColor(.white)

                    }
                    
                    Spacer()
                }
            }
            
            .navigationTitle("Count: \(count)")
            
        }
        
    }
    
    func playHapticBump() {
        if self.count == 0 {
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        } else {
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()

            
        }
        
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
