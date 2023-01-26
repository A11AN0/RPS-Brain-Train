//
//  ContentView.swift
//  RPS Brain Train
//
//  Created by A11AN0
/*
 RPS Brain Train (rock-paper-scissors) brain training
 is a brain teaser app which asks players to either win,
 lose or draw at a game of rock paper scissors. It will have a
 set number of rounds (likely 10ish) and will be times. The more rounds the user
 goes through, the faster the timer will run - giving the user less time to select
 a response, and really stimulating the brain lol.
 
 */
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationView {
                TitleView()
            }
            
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
