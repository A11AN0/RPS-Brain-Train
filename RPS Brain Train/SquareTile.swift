//
//  SquareTile.swift
//  RPS Brain Train
//
//  Created by Allan Odunga on 26/1/2023.
//

import SwiftUI

struct SquareTile: View {
    var text = ""
    var size = 150
    
    var body: some View {
        Text(text)
            .font(.system(size: 40))
            .padding(.trailing)
            .frame(width: CGFloat(size), height: CGFloat(size))
            .background(Color(.lightGray))
            .cornerRadius(10)
    }
    
}

