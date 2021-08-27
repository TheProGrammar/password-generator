//
//  ContentView.swift
//  PasswordGenerator
//
//  Created by Miroslav Mali on 2.8.21..
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var manager = PasswordManager()
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationView() {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color("blueLight"), Color("blackDark")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("lock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200, alignment: .center)
                        .padding(.top, 20)
                    Text("SafePass")
                        .font(.system(size: 36))
                        .italic()
                        .fontWeight(.semibold)
                        .padding(.top ,-20)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                    Spacer(minLength: 50)
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: screenWidth * 0.68, height: 45, alignment: .center)
                            .foregroundColor(.init(red: 0.75, green: 0.76, blue: 0.78, opacity: 0.2))
                        Toggle(isOn: $manager.includeNumbers.animation()) {
                            Text("Include numbers")
                                .font(.system(size: 18))
                                .italic()
                                .fontWeight(.light)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 1, x: 0.5, y: 0.5)
                        }
                        .padding(.horizontal, 80)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: screenWidth * 0.68, height: 45, alignment: .center)
                            .foregroundColor(.init(red: 0.75, green: 0.76, blue: 0.78, opacity: 0.2))
                        Toggle(isOn: $manager.includeCharacters.animation()) {
                            Text("Include special characters")
                                .font(.system(size: 18))
                                .italic()
                                .fontWeight(.light)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 1, x: 0.5, y: 0.5)
                        }
                        .padding(.horizontal, 80)
                    }
                    Spacer()
                    ZStack{
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("yellowDark"), Color("yellowLight")]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 200, height: 50, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color("blackButton"), radius: 3, x: 2, y: 2)
                        generateButton(manager: manager)
                    }
                    Spacer(minLength: 100)
                }
            }
        }
        .accentColor(.white)
    }
}

struct generateButton: View {
    
    @ObservedObject var manager: PasswordManager
    
    var body: some View {
        NavigationLink(destination: PasswordView(manager: manager)) {
            Text("Generate")
                .font(.system(size: 28))
                .italic()
                .fontWeight(.semibold)
                .frame(width: 200, height: 50, alignment: .center)
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(color: Color("blackButton"), radius: 1, x: 1, y: 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
