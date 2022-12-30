//
//  Main.swift
//  LearnColors
//
//  Created by Alex Karamanets on 29.12.2022.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        
        ZStack ( alignment: .bottom) {
            
            LinearGradient(colors: [.indigo, .mint], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Learn colors")
                    .font(.system(size: 23) .monospaced() .bold())
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
                Circle()
                    .foregroundColor(vm.selectedColor)
                    .padding(.horizontal)
                    .shadow(color: .black, radius: 6, x: 3, y: 3)
                    .overlay(Circle()
                        .stroke(Color.black.opacity(0.9), lineWidth: 0.9)
                        .shadow(color: .black, radius: 5, x: -3, y: 0) )
                HStack {
                    Text("This color is :")
                        .font(.system(size: 22) .monospaced())
                        .foregroundColor(Color.black)
                        .padding(.top, 30)
                    
                    Text("\(vm.selectedColor.description)")
                        .font(.system(size: 22) .monospaced() .bold() )
                        .foregroundColor(Color.black)
                        .padding(.top, 30)
                }
                Spacer(minLength: 250)
            }
            ScrollView (.horizontal) {
                HStack {
                    ForEach(vm.colors.colors, id:\.self) { item in
                        Circle()
                            .frame(width: 58, height: 58)
                            .foregroundColor(item)
                            .scaleEffect(vm.selectedColor == item ? 1.1 : 1)
                            .opacity(vm.selectedColor == item ? 1 : 0.9)
                            .onTapGesture { withAnimation {vm.selectedColor = item } }
                            .shadow(color: .black, radius: 2, x: 3, y: 3)
                            .overlay(Circle()
                                .stroke(Color.black.opacity(0.4), lineWidth: 0.6)
                                .scaleEffect(vm.selectedColor == item ? 1.1 : 1)
                                .shadow(color: .black, radius: 3, x: -3, y: 0) )
                    }
                }
                .padding()
                .padding(.bottom)
            }
        }
    }
}
//                      🔱
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
