//
//  SquareTile.swift
//  RPS Brain Train
//
//  Created by A11AN0.
//  COMMAND + \ to create breakpoints

import SwiftUI

struct SquareTile: View {
    var text = ""
    var size = 150
    
    var body: some View {
        Text(text)
            .font(.system(size: 40))
            .padding(.trailing)
            .frame(width: CGFloat(size), height: CGFloat(size))
            .background(Color(.systemGray5))
            .cornerRadius(10)
            
        
            
    }
    
}

struct SquareTile_Previews: PreviewProvider {
    static var previews: some View {
        SquareTile()
    }
}
