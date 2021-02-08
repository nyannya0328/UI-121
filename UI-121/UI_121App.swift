//
//  UI_121App.swift
//  UI-121
//
//  Created by にゃんにゃん丸 on 2021/02/07.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FirebaseCore
import FirebaseAuth


@main
struct UI_121App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView(info: self.delegate)
        }
    }
}
class AppDelegate : NSObject,UIApplicationDelegate,GIDSignInDelegate,ObservableObject{
    
    @Published var email = ""
   
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        return true
        
        
        
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        guard let user = user else {
            print(error.localizedDescription)
            
            return}
        
        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (result, err) in
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
                
            }
            self.email = (result?.user.email)!
            print(result?.user.email)
            
            }
        }
    
        
        
    }
    
   

