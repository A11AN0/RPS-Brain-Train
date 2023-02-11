//
//  MainGameView.swift
//  RPS Brain Train
//
//  Created by A11AN0.
//

import SwiftUI




struct MainGameView: View {
    static let itemChoice = ["rock", "paper", "scissors"]
    static let randomResult = ["win against", "draw with", "lose to"]
    
    //DICTIONARIES, below is type annotation example for this set
    static let matchPairs = [
        "rock": ["win against": "paper", "draw with": "rock", "lose to":"scissors"],
        "paper": ["win against": "scissors", "draw with": "paper", "lose to":"rock"],
        "scissors": ["win against": "rock", "draw with": "scissors", "lose to":"paper"],
    ]
    
    private let maxRounds = 15;
    private let matchPairingDictionary = matchPairs
    @State private var shuffledItemsArr = itemChoice.shuffled()
    @State private var shuffledResultsArr = randomResult.shuffled()
    @State private var shuffledSingleItem = itemChoice.shuffled()[0]
    @State private var rightChoice = "";
    @State private var numberOfRounds = 1;
    @State private var timeRemaining = 30;
    @State private var readyToPlay = false; /*moved to parent so timer will start only when GameTimer button is clicked */
    @State private var gameHasEnded = false;
    @State private var score = 0; //will be set by recordChoice() each time the user makes a choice
    @State private var chosenItem = "" // will be set each time the user chooses
    @State private var desiredResult = randomResult.shuffled()[0] // will be set each time the user chooses
    @State private var signalColor = Color.clear
    @State private var gameTexIstHidden = false;
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    //will use when game ends
    func endGame() {
        gameTexIstHidden = true
        readyToPlay = false
        gameHasEnded = true
        
        // will need to think about what tot do with the desired result title
    }
    
    func evaluateEndGame() {
        //this will be put into the onReceive, !gameHasEnded will make sure that this only runs once
        if !gameHasEnded {
            if timeRemaining == 0 {
                endGame()
                
            }
            
            //I will need to put something for when the buttons are pressed
            if numberOfRounds == maxRounds + 1 {
                endGame()
            }
        }
        
    }
    
    func resetRound() {
        numberOfRounds += 1
        shuffledItemsArr = MainGameView.itemChoice.shuffled()
        shuffledResultsArr = MainGameView.randomResult.shuffled()
        shuffledSingleItem = MainGameView.itemChoice.shuffled()[0]
        desiredResult = MainGameView.randomResult.shuffled()[0]
    }
    
    //to reset entire game
    //will need to embed this within gameTimer
    func restartGame() {
        gameTexIstHidden = false
        timeRemaining = 30
        score = 0
        numberOfRounds = 1
        gameHasEnded = false
    }
    
   
    
    func recordChoice() {
        let correctChoice = MainGameView.matchPairs[shuffledSingleItem]?[desiredResult] ?? "NA"
        let currentChoice = chosenItem
        
        if correctChoice == currentChoice {
            score += 10 * numberOfRounds + (50 - timeRemaining)
            
            withAnimation(.easeInOut) {
                signalColor = Color(red: 0, green: 1, blue: 0, opacity: 0.5)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeInOut) {
                        signalColor = Color.clear
                    }
                }

            }
            
        }
        else {
            score -= score > 0 ? (10 * timeRemaining/10) :  0
            
            withAnimation(.easeInOut) {
                signalColor = Color(red: 1, green: 0, blue: 0, opacity: 0.5)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeInOut) {
                        signalColor = Color.clear
                    }
                }
            }
            
        }
        rightChoice = correctChoice
        
    }
    

    var body: some View {
        
        let desiredResultTitle = desiredResult.uppercased()
        
        
        VStack {
            VStack(spacing: 0) {
                /*
                 needed to use binding for readyToPlay state, as it
                is modified by GameTimer - kinda cool - because this is
                 how children views can modify the state of their parent views
                 */
                if !gameHasEnded {
                    GameTimer(isReady: $readyToPlay, timeRemainder: timeRemaining)
                        .onReceive(timer){ _ in

                            if readyToPlay {
                                timeRemaining -= timeRemaining > 0 ? 1 : 0
                                evaluateEndGame()
                            }
                                
                        }
                }
                else
                {
                    //correct way to pass functions down to children
                    ScoreView(restartFunc: {restartGame()}, score: score)
                }
                
                
                if readyToPlay {
                    Text(desiredResultTitle)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding(5)
                        .background(.thinMaterial)
                        
                }
                
            }
            
            if readyToPlay {
                Spacer()
                VStack {
                    SquareTile(size: 180)
                    Text(shuffledSingleItem.uppercased())
                        .font(.title)
                        .opacity(gameTexIstHidden ? 0 : 1)
                }
                Spacer()
                HStack {
                    ForEach(0..<3){number in
                        Button {
                            chosenItem = shuffledItemsArr[number]
                            recordChoice()
                            resetRound()
                            evaluateEndGame()
                            
                        } label: {
                            VStack {
                                SquareTile(size: 110)
                                Text(shuffledItemsArr[number].uppercased())
                                    .font(.title3)
                                    .opacity(gameTexIstHidden ? 0 : 1)
                                
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                Spacer()
                Text("\(numberOfRounds)/\(maxRounds)")
                    .font(.largeTitle)
                    .fontWeight(.light)
                Spacer()
            }
            
        }
          .navigationBarBackButtonHidden(true)
          .background(signalColor)
          
    }
}


struct MainGameView_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView()
    }
}
