//
//  TitleView.swift
//  RPS Brain Train
//
//  Created by A11AN0.
//

import SwiftUI


struct TitleView: View {
//    @State private var tap = false;
    var body: some View {
         SquareTile(text: "RPS\nBRAIN\nTRAIN")
//            .scaleEffect(tap ? 0.9 : 1)
//            .onTapGesture {
//                withAnimation() {
//                    tap.toggle()
//                }
//            }
/*
 might be cool for background to turn green on tap before going to next view,
 will give it a try and see what happens XD - investigate possible methods for
 cirvumventing the NavigationLink thingie :)
 
 VStack {
     SquareTile(text: "RPS\nBRAIN\nTRAIN")
 }
 .background(Color(tap ? .systemGreen : .clear))
     .scaleEffect(tap ? 0.9 : 1)
     .onTapGesture {
         withAnimation() {
             tap.toggle()
         }
     }
 
 */
    }  
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
