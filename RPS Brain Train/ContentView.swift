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
    @State private var gameIsOver = false; //will probably be a binding too lol
    @State private var gameScore = 0; // will be a binding
    
    
    let title = TitleView()
    let mainGame = MainGameView()
    let end = ScoreView()
    
    var body: some View {
            NavigationView {
                NavigationLink(destination: mainGame) {
                    if gameIsOver {
                        end
                    } else {
                        title
                    }
                }
                .buttonStyle(PlainButtonStyle())
                

            }   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
