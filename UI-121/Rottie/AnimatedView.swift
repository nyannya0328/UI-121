//
//  AnimatedView.swift
//  
//
//  Created by にゃんにゃん丸 on 2021/02/08.
//

import SwiftUI
import Lottie

struct AnimatedView: UIViewRepresentable {
    @Binding var show : Bool
    func makeUIView(context: Context) -> AnimationView {
        
        let view = AnimationView(name: "sending-email", bundle: .main)
        view.play { (statas) in
            if statas{
                
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)){
                    
                    show.toggle()
                }
                
            }
        }
        
        return view
        
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
    }
}

