//
//  PasswordView.swift
//  PasswordGenerator
//
//  Created by Miroslav Mali on 2.8.21..
//

import SwiftUI

struct PasswordView: View {
    
    @ObservedObject private var manager: PasswordManager
    
    init(manager: PasswordManager) {
        self.manager = manager
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("blueLight"), Color("blackDark")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("lock")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                Text("SafePass")
                    .font(.system(size: 36))
                    .italic()
                    .fontWeight(.semibold)
                    .padding(.top ,-20)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                Spacer()
                VStack {
                    Text("Click to copy")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .italic()
                        .fontWeight(.regular)
                        .shadow(color: .secondary, radius: 1, x: 1, y: 1)
                    ZStack {
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("yellowDark"), Color("yellowLight")]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 250, height: 50, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color("blackButton"), radius: 3, x: 2, y: 2)
                        Text(manager.generatePassword())
                            .foregroundColor(.white)
                            .font(.system(size: 28))
                            .italic()
                            .fontWeight(.regular)
                            .shadow(color: Color("blackButton"), radius: 1, x: 1, y: 1)
                    }
                }.padding(.bottom, 120)
            }
        }
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView(manager: PasswordManager())
    }
}
