//
//  ContentView.swift
//  LoginUI2
//
//  Created by Al Amin on 16/6/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home2()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home2: View {
   @State private var index = 0
    var body: some View{
        GeometryReader{_ in
            VStack{
                Image("logo")
                .resizable()
                .frame(width: 60, height: 60)
                    
                ZStack {
                    Signup2(index: self.$index)
                        .zIndex(Double(self.index))
                    Login2(index: self.$index)
                }
            
                
            }
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}

struct Home: View {
    @State private var index = 0
    var body: some View{
        GeometryReader{_ in
            VStack{
                Image("logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                ZStack {
                    SignUPView(index: self.$index)
                        .zIndex(Double(self.index))
                    LoginView(index: self.$index)
                }
            }
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}

struct cshape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: 100))
        path.addLine(to: CGPoint(x: rect.width , y: 100))
        return path
    }
    
    
}

struct scshape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: 100))
        return path
    }
    
    
}

struct LoginView: View {
    @State private var email = ""
    @State private var pass = ""
    @Binding var index: Int
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack{
                HStack{
                    VStack (spacing: 10){
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                        
                        Capsule().fill(self.index == 0 ? Color.blue : Color.clear)
                        .frame(width: 100, height: 5)
                    }
                    Spacer(minLength: 0)
                }
                .padding(.top, 30)
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Email Address", text: self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$pass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack{
                    Spacer(minLength: 0)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Forget Password")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color2"))
                
            .clipShape(cshape())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .contentShape(cshape())
                .onTapGesture {
                    self.index = 0
                    print(self.index)
                }
                
            .cornerRadius(35)
                
            .padding(.horizontal, 20)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}

struct SignUPView: View {
    @State private var email = ""
    @State private var pass = ""
    @State private var repass = ""
    @Binding var index : Int
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack{
                HStack{
                    Spacer(minLength: 0)
                    VStack (spacing: 10){
                        Text("Signup")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                        .onTapGesture {
                            self.index = 1
                            print(self.index)
                        }
                        Capsule().fill(self.index == 1 ? Color.blue : Color.clear)
                        .frame(width: 100, height: 5)
                    }
                     
                }
                .padding(.top, 30)
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Email Address", text: self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$pass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$repass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 30)
                

            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color2"))
                
            .clipShape(scshape())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .contentShape(scshape())
                .onTapGesture {
                    self.index = 1
                }
            
            .cornerRadius(35)
            .padding(.horizontal, 20)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("SIGNUP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}

struct Login2: View {
    @State private var email = ""
    @State private var pass = ""
    @Binding var index: Int
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack{
                HStack{
                    VStack (spacing: 10){
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.semibold)
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    Spacer(minLength: 0)
                }
               // .padding(.bottom,60)
                .padding(.top,-20)
                VStack(spacing: 10){
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .foregroundColor(Color("Color1"))
                        TextField("Email Address", text: self.$email)
                    }
                    Divider()
                        .background(Color.white.opacity(0.7))
                }
                .padding()
                .padding(.top, 30)
                VStack(spacing: 10){
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$pass)
                    }
                    Divider()
                        .background(Color.white.opacity(0.7))
                }
                .padding()
                HStack{
                    Spacer(minLength: 0)
                    Text("Forget Password")
                        .foregroundColor(Color.white.opacity(0.6))
                }
                .padding(.top, 40)
                .padding(.bottom, 80)
            }
            .padding(.top, 60)
            .padding(.horizontal, 30)
            .background(Color("Color2"))
            .cornerRadius(40)
            .padding(.horizontal)
                
            .clipShape(cshape())
                .shadow(color: Color("Color"), radius: 5, x: 0, y: -5)
            .contentShape(cshape())
            .onTapGesture {
                self.index = 0
            }
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                
            }
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}
struct Signup2: View {
    @State private var email = ""
    @State private var pass = ""
    @State private var repass = ""
    @Binding var index: Int
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack{
                HStack{
                     Spacer(minLength: 0)
                    VStack (spacing: 10){
                        Text("Signup")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.semibold)
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                   
                }
                //.padding(.bottom,60)
                .padding(.top,-20)
                VStack(spacing: 10){
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .foregroundColor(Color("Color1"))
                        TextField("Email Address", text: self.$email)
                    }
                    Divider()
                        .background(Color.white.opacity(0.7))
                }
                .padding()
                .padding(.top, 30)
                VStack(spacing: 10){
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$pass)
                    }
                    Divider()
                        .background(Color.white.opacity(0.7))
                }
                .padding()
                VStack(spacing: 10){
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$pass)
                    }
                    Divider()
                        .background(Color.white.opacity(0.7))
                }
                .padding()
                //.padding(.top, 40)
                .padding(.bottom, 80)
            }
            .padding(.top, 60)
            .padding(.horizontal, 30)
            .background(Color("Color2"))
            .cornerRadius(40)
            .padding(.horizontal)
                
            .clipShape(scshape())
        .shadow(color: Color("Color"), radius: 5, x: 0, y: -5)
            .contentShape(scshape())
            .onTapGesture {
                self.index = 1
            }
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Signup")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                
            }
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}
