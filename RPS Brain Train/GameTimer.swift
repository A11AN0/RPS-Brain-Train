//
//  GameTimer.swift
//  RPS Brain Train
//
//  Created by A11AN0
//

import SwiftUI


struct GameTimer: View {
    @Binding var isReady: Bool
    /*had to make this a binding because, when toggled - this needs to affect the state of it's parent MainGameView :)*/
    var timeRemainder:Int

    var body: some View {
        
        
        /*
         Figured out, that ternary operators cannot have different return types :O, which is why I ended up using the if/else statements to return the different views for when isReady is either toggled to true or false
            - the animation is also pretty cool lol
         
         */
        
        VStack {
            if isReady {
                Text("0:\(String(format: "%02d", timeRemainder))")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(timeRemainder <= 10 ? .red : .primary)
                    .frame(maxWidth: .infinity, maxHeight: 120)
            } else {
                VStack {
                    Spacer()
                    Text("ARE YOU READY?")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .frame(maxWidth: .infinity, maxHeight: 120)
                    Spacer()
                }
            }
                  
        }
        .onTapGesture {
            withAnimation {
                if isReady == false {
                    isReady.toggle()
                }
            }
            
        }
        .background(Color( isReady ? .clear :  .systemGreen))
        
            

        
        
        
        
        
    }
}

struct GameTimer_Previews: PreviewProvider {
    static var previews: some View {
        
        //Can use .constant() simply simulate a false binding for isReady, change false to true to see what view looks like when isReady is toggled to true
        GameTimer(isReady: .constant(false), timeRemainder: 15)
        
    }
}



//struct GameTimer_Previews: PreviewProvider {
//    @State var testIsReady = true
//
//    static var previews: some View {
//        GameTimer(isReady: $testIsReady, timeRemainder: 15)
//    }
//}
