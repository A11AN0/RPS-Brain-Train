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
    }  
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
