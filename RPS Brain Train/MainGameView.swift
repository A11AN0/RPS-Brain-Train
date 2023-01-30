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
        "rock": ["win against": "scissors", "draw with": "rock", "lose to":"paper"],
        "paper": ["win against": "rock", "draw with": "paper", "lose to":"scissors"],
        "scissors": ["win against": "paper", "draw with": "scissors", "lose to":"rock"],
    ]
    
    private let maxRounds = 15;
    private let matchPairingDictionary = matchPairs
    @State private var shuffledItemsArr = itemChoice.shuffled()
    @State private var shuffledResultsArr = randomResult.shuffled()
    @State private var shuffledSingleItem = itemChoice.shuffled()[0]
    @State private var numberOfRounds = 1;
    @State private var timeRemaining = 30;
    @State private var readyToPlay = false; /*moved to parent so timer will start only when GameTimer button is clicked */
    @State private var score = 0; //will be set by recordChoice() each time the user makes a choice
    @State private var chosenItem = "" // will be set each time the user chooses
    @State private var desiredResult = randomResult.shuffled()[0] // will be set each time the user chooses
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    func resetRound() {
        numberOfRounds += 1
        shuffledItemsArr = MainGameView.itemChoice.shuffled()
        shuffledResultsArr = MainGameView.randomResult.shuffled()
        shuffledSingleItem = MainGameView.itemChoice.shuffled()[0]
        desiredResult = MainGameView.randomResult.shuffled()[0]
    }
    
    func recordChoice() {
        let correctChoice = MainGameView.matchPairs[shuffledSingleItem]?[desiredResult]
        let currentChoice = chosenItem
        
        if correctChoice == currentChoice {
            score += 10 * numberOfRounds + (50 - timeRemaining)
        }
        else {
            score -= score > 0 ? (10 * timeRemaining/10) :  0
        }
        //will need to find a way to match they types with what they win/lose against
        
    }
    

    var body: some View {
        VStack {
            VStack(spacing: 0) {
                /*
                 needed to use binding for readyToPlay state, as it
                is modified by GameTimer - kinda cool - because this is
                 how children views can modify the state of their parent views
                 */
                
                GameTimer(isReady: $readyToPlay, timeRemainder: timeRemaining)
                    .onReceive(timer){ _ in
                        if timeRemaining > 0 && readyToPlay {
                            timeRemaining -= 1
                        }
                    }
                
                if readyToPlay {
                    Text("\(desiredResult.uppercased())")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding(5)
                        .background(Color(.systemGray5))
                }
                
            }
            
            if readyToPlay {
                Spacer()
                VStack {
                    SquareTile(size: 180)
                    Text(shuffledSingleItem.uppercased())
                        .font(.title)
                }
                Spacer()
                HStack {
                    ForEach(0..<3){number in
                        Button {
                            chosenItem = shuffledItemsArr[number]
                            recordChoice()
                            resetRound()
                            
                        } label: {
                            VStack {
                                SquareTile(size: 110)
                                Text(shuffledItemsArr[number].uppercased())
                                    .font(.title3)
                                
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                Spacer()
                HStack {
                    Text("\(numberOfRounds)/\(maxRounds)")
                        .font(.largeTitle)
                        .fontWeight(.light)
                    Text("\(score)")
                    Text("\(correctItem)")
                }
                
                Spacer()
            }
            
        }
          .navigationBarBackButtonHidden(true)
          
    }
}


struct MainGameView_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView()
    }
}
