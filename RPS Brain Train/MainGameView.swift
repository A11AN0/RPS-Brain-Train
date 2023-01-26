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
            Text("0:30")
            Text("DRAW AGAINST")
            SquareTile(size: 180)
            HStack {
                ForEach(0..<3){number in
                    Button {
                        print("hi")
                    } label: {
                        VStack {
                            SquareTile(size: 110)
                            Text("random")
                        }
                    }
                }
            }
            Text("3/10")
        }
          .navigationBarBackButtonHidden(true)
          .background(Color(.cyan))
    }
    
}


struct MainGameView_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView()
    }
}
