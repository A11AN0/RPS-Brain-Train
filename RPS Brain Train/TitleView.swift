//
//  TitleView.swift
//  RPS Brain Train
//
//  Created by A11AN0.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        NavigationLink(destination: MainGameView()) {
            SquareTile(text: "RPS\nBRAIN\nTRAIN")
        }
        .buttonStyle(PlainButtonStyle())
    }  
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
