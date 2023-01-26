//
//  MainGameView.swift
//  RPS Brain Train
//
//  Created by A11AN0.
//

import SwiftUI

struct MainGameView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("0:30")
                .font(.largeTitle)
                .fontWeight(.light)
            
            Text("DRAW AGAINST")
                .font(.largeTitle)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity)
                .padding(5)
                .background(Color(.systemGray5))
            Spacer()
            VStack {
                SquareTile(size: 180)
                Text("RANDOM")
                    .font(.title)
            }
            Spacer()
            HStack {
                ForEach(0..<3){number in
                    Button {
                        print("hi")
                    } label: {
                        VStack {
                            SquareTile(size: 110)
                            Text("RANDOM")
                                .font(.title3)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            Spacer()
            Text("3/10")
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
