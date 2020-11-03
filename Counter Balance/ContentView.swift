//
//  ContentView.swift
//  Counter Balance
//
//  Created by Christian Tobias on 10/20/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var counter = Counter()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Button(action: {
                        counter.increment()
                        playHapticBump()
                    }) {
                        Image(systemName: "plus.circle")
                            .font(Font.system(size: 80.0))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        counter.decrement()
                        playHapticBump()

                    }) {
                        Image(systemName: "minus.circle")
                            .font(Font.system(size: 80.0))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Count: \(counter.count)")
        }
    }
    
    func playHapticBump() {
        if counter.count == 0 {
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        } else {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
