//
//  ContentView.swift
//  UI-121
//
//  Created by にゃんにゃん丸 on 2021/02/07.
//

import SwiftUI
import GoogleSignIn
import Lottie




struct ContentView: View {
    @ObservedObject var info : AppDelegate
    
    var body: some View {
        
        Home()
//        Button(action: {
//
//            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
//
//            GIDSignIn.sharedInstance()?.signIn()
//
//        }, label: {
//            Text("Button")
//        })
       
    }
}



  
    

