//
//  RootView.swift
//  SwiftUI App(Homework for OTUS)
//
//  Created by Идель Юсупов on 05.12.2020.
//

import SwiftUI

struct RootView: View {
    
    @State private var switchTab = 0
    @State var isModal: Bool = false
    
    var body: some View {
        TabView(selection: $switchTab) {
            VStack(spacing: 20) {
                Spacer()
                Text("Press that damn button meatbag!")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.black)
                    .background(
                        Color.yellow
                            .shadow(radius: 10, y: 5))
                
                Image("Bender").resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                
                Button(action: {
                    switchTab = switchTab + 1
                }, label: {
                    Text("Press Button")
                        .font(.title)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 2))
                })
                .shadow(radius: 10, y: 5)
                Spacer()
            }
            .font(.largeTitle)
            
            .tabItem {
                Image(systemName: "house.fill")
                Text("First Tab")
            } .tag(0)
            
            NavigationView {
                List(listOfNames, id: \.self) { names in
                    CustomRow(content: names)
                }
                .navigationBarTitle(Text("Futurama Character"))
            }
            
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Second Tab")
            } .tag(1)
            
            VStack(spacing: 50) {
                Text("Open window in modal form")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.black)
                    .background(
                        Color.yellow
                            .shadow(radius: 10, y: 5))
                
                Button(action: {
                    self.isModal = true
                }, label: {
                    Text("Press Button")
                        .font(.title)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 2))
                })
                .sheet(isPresented: $isModal, content: {
                    ZStack {
                        Color.black
                        Image("BenderTheOffender")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .ignoresSafeArea(edges: .bottom)
                })
                .shadow(radius: 10, y: 5)
            }
            .tabItem {
                Image(systemName: "rectangle.fill.badge.plus")
                Text("Therd Tab")
            } .tag(2)
        }
        .accentColor(.green)
        .font(.title)
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

