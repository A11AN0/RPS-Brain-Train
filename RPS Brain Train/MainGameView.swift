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
    @State private var shuffledItems = itemChoice.shuffled()
    @State private var shuffledResult = randomResult.shuffled()
    @State private var numberOfRounds = 1;

    var body: some View {
        VStack {
            Spacer()
            GameTimer(currentRound: numberOfRounds)
            Text("\(shuffledResult[Int.random(in: 0...2)].uppercased())")
                .font(.largeTitle)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity)
                .padding(5)
                .background(Color(.systemGray5))
            Spacer()
            VStack {
                SquareTile(size: 180)
                Text(shuffledItems[Int.random(in: 0...2)].uppercased())
                    .font(.title)
            }
            Spacer()
            HStack {
                ForEach(0..<3){number in
                    Button {
                        numberOfRounds += 1
                        shuffledItems.shuffle()
                        shuffledResult.shuffle()
                    } label: {
                        VStack {
                            SquareTile(size: 110)
                            Text(shuffledItems[number].uppercased())
                                .font(.title3)
                            
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            Spacer()
            Text("\(numberOfRounds)/10")
                .font(.largeTitle)
                .fontWeight(.light)
            Spacer()
        }
          .navigationBarBackButtonHidden(true)
//          .background(Color(.cyan))
    }
    
    
}


struct MainGameView_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView()
    }
}
