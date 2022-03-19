//
//  ContentView.swift
//  SwitfUI T22
//
//  Created by M Fadli Zein on 19/03/22.
//

import SwiftUI

struct ContentView: View {
    @GestureState var press = false
    @State var show = false
    
    var body: some View {
        Image(systemName: "camera.fill")
            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            .frame(width: 60.0, height: 60.0)
            .background(show ? .black : .blue)
            .mask(Circle())
            .scaleEffect(press ? 2 : 1)
            .animation(.spring())
            .gesture(
                LongPressGesture(minimumDuration: 0.5).updating($press){
                    currentState, gestureState, transaction in gestureState = currentState
                }
                .onEnded{ value in
                    show.toggle()
                }
            )
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
