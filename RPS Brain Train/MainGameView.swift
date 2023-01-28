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
    private let maxRounds = 15;
    @State private var shuffledItemsArr = itemChoice.shuffled()
    @State private var shuffledResultsArr = randomResult.shuffled()
    @State private var shuffledSingleItem = itemChoice.shuffled()[0]
    @State private var numberOfRounds = 1;
    @State private var timeRemaining = 30;
    @State private var readyToPlay = false; /*moved to parent so timer will start only when GameTimer button is clicked */
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    func resetRound() {
        numberOfRounds += 1
        shuffledItemsArr = MainGameView.itemChoice.shuffled()
        shuffledResultsArr = MainGameView.randomResult.shuffled()
        shuffledSingleItem = MainGameView.itemChoice.shuffled()[0]
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
                    Text("\(shuffledResultsArr[0].uppercased())")
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
                Text("\(numberOfRounds)/\(maxRounds)")
                    .font(.largeTitle)
                    .fontWeight(.light)
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
