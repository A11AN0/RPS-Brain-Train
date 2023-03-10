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
    @State private var firstGameOver = false; //will be changed when the first game is lost, and stay that way, so cannot return to title screen
    @State private var gameScore = 0; // will be a binding
    
    
    let title = TitleView()
    let mainGame = MainGameView()
    
    
    var body: some View {
            NavigationView {
                NavigationLink(destination: mainGame) {
                        title   
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
