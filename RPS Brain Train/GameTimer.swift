//
//  GameTimer.swift
//  RPS Brain Train
//
//  Created by A11AN0
//

import SwiftUI

struct GameTimer: View {
    
    var timeRemainder:Int
//    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    /*
     timer now in parent view - necessary to avoid pausing countdown at
     each external state change :|
     */
    
    var body: some View {
        Text("0:\(String(format: "%02d", timeRemainder))")
            .font(.largeTitle)
            .fontWeight(.light)
            .foregroundColor(timeRemainder <= 10 ? .red : .primary)
    }
}

struct GameTimer_Previews: PreviewProvider {
    static var previews: some View {
        GameTimer(timeRemainder: 15)
    }
}
