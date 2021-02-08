//
//  Home.swift
//  UI-121
//
//  Created by にゃんにゃん丸 on 2021/02/08.
//

import SwiftUI
import GoogleSignIn

let gra = LinearGradient(gradient: .init(colors: [.red,.blue]), startPoint: .center, endPoint: .top)

struct Home: View {
   @State var show = false
    @State var phno = ""
    var body: some View {
        
        VStack {
            ZStack{
                AngularGradient(gradient: .init(colors: [.orange,.green]), center: .center)
                    .ignoresSafeArea()
                
                VStack{
                    
                    AnimatedView(show: $show)
                        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2)
                        //.padding(.bottom,30)
                    
                    VStack{
                        
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 15, content: {
                                
                                Text("Login")
                                    .font(.title)
                                    .foregroundColor(.black)
                                
                                Text("Enter your PHNO")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                
                               
                                
                                
                                
                            })
                            .padding()
                            Spacer(minLength: 15)
                        }
                        VStack{
                            
                            HStack(spacing:15){
                                
                                Text("+1")
                                    .bold()
                                    .foregroundColor(.black)
                                
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: 1, height: 18)
                                
                                
                                TextField("Enter", text: $phno)
                            
                            }
                            Divider()
                                .background(Color.gray)
                        }
                        .padding(.vertical)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Verify your number")
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                                .padding(.vertical,10)
                                .frame(width: UIScreen.main.bounds.width - 30)
                                .background(Color.green)
                                .clipShape(Capsule())
                            
                        })
                        
                        HStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 1)
                            
                            Text("or")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 1)
                            
                        }
                        .padding(.vertical)
                        
                        
                        HStack{
                            Button(action: {
                                
                                GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                                GIDSignIn.sharedInstance()?.signIn()
                                
                            }, label: {
                                HStack{
                                    
                                    Image("g")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                    
                                    Text("Google Login")
                                        .font(.caption)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.gray)
                                    
                                }
                                .padding(.vertical,10)
                                .frame(width: ((UIScreen.main.bounds.width - 80) / 2))
                                .background(gra)
                                .clipShape(Capsule())
                            })
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                HStack{
                                    
                                    Image("t")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                    
                                    Text("Twitter Login")
                                        .font(.caption)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.gray)
                                        
                                    
                                }
                                .padding(.vertical,10)
                                .frame(width: ((UIScreen.main.bounds.width - 80) / 2))
                                .background(gra)
                                .clipShape(Capsule())
                                .shadow(color: Color.orange.opacity(0.3), radius: 6, x: 6, y: 6)
                                .shadow(color: Color.green.opacity(0.3), radius: -6, x: -6, y: -6)
                            })
                            
                        }
                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                    .frame(height: show ? nil : 0)
                    .opacity(show ? 1 : 0)
                    
                    
                    
                    
                }
                
                
            }
        }
        .onTapGesture {
            UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true)
        }
        
      
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
