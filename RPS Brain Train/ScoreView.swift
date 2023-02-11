//
//  ScoreView.swift
//  RPS Brain Train
//
//  Created by A11AN0.
//

import SwiftUI

struct ScoreView: View {
    var restartFunc: () -> Void
    var score: Int
   //correct way to pass functions down from parents
    @State private var isVisible = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("YOUR SCORE")
                .font(.largeTitle)
                .fontWeight(.light)
                .frame(maxWidth: .infinity, maxHeight: 120)
                .scaleEffect(1.3)

            Text("\(score)")
                .font(.largeTitle)
                .fontWeight(.light)
                .frame(maxWidth: .infinity, maxHeight: 120)
                .scaleEffect(2)
            //will need to put restart image here
            Spacer()
            Text("PLAY AGAIN?")
                .font(.largeTitle)
                .fontWeight(.light)
                .scaleEffect(1.1)
            HStack {
                Spacer()
                VStack {
                    SquareTile(image: "checkmark", isclear: true)
                    
                    
                        
                }
                .scaleEffect(0.8)
                .onTapGesture {
                    restartFunc()
                }
                Spacer()
                VStack {
                    SquareTile(image: "xmark", isclear: true)
                    
                }
                .scaleEffect(0.8)
                Spacer()
                //go back to title
                
            }
            Spacer()
        }
        .opacity(isVisible ? 1 : 0)
        .onAppear {
            withAnimation {
                self.isVisible = true
            }
            
        }
    }   
    
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        //will need to pass through the score here as a binding
        // will need to
        ScoreView( restartFunc: {}, score: 14)
    }
}
