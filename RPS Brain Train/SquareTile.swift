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
    var image = ""
    var scaleSize = 5
    var isclear = false
    
    
    var body: some View {
        if image.count > 0 {
            if isclear {
                HStack {
                    Image(systemName: image)
                        .scaleEffect(CGFloat(scaleSize))
                }
                .frame(width: CGFloat(size), height: CGFloat(size))
                .cornerRadius(10)
            }
            else {
                HStack {
                    Image(systemName: image)
                        .scaleEffect(CGFloat(scaleSize))
                }
                .frame(width: CGFloat(size), height: CGFloat(size))
                .background(.thinMaterial)
                .cornerRadius(10)
            }
            
            
            
        }
        else
        {
            Text(text)
                .font(.system(size: 40))
                .padding(.trailing)
                .frame(width: CGFloat(size), height: CGFloat(size))
                .background(.thinMaterial)
                .cornerRadius(10)
        }
        
            
        
            
    }
    
}

struct SquareTile_Previews: PreviewProvider {
    static var previews: some View {
        SquareTile()
    }
}
