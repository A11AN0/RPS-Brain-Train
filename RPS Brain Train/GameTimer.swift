//
//  GameTimer.swift
//  RPS Brain Train
//
//  Created by A11AN0
//

import SwiftUI

struct GameTimer: View {
    var currentRound: Int
    @State private var timeRemaining = 30;
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("0:\(String(format: "%02d", timeRemaining))")
            .font(.largeTitle)
            .fontWeight(.light)
            .onReceive(timer){ time in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
            .foregroundColor(timeRemaining <= 10 ? .red : .primary)
    }
}

struct GameTimer_Previews: PreviewProvider {
    static var previews: some View {
        GameTimer(currentRound: 1)
    }
}
