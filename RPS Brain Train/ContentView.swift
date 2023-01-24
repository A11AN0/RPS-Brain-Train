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
        VStack {
            Text("RBS Brain Train")//Title
            
            /*
             Will tell the user what their chosen
             item must do against the randomised option
             - this will also be random
             */
            Text("Draw/Win/Lose against")
            
            //This will be the randomised optio
            VStack {
                Text("Symbol 0")//images
                Text("Rock/paper/scissors")//label
            }
            
            
            //This will be the options of choices that the user has
            HStack {
                //Each element here will be a button
                VStack {
                    Text("Symbol 1")//images
                    Text("Rock")//label
                }
                VStack {
                    Text("Symbol 2")//image
                    Text("Paper")//label
                }
                VStack {
                    Text("Symbol 3")//image
                    Text("Scicssors")//label
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
