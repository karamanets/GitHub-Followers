//
//  ColorsModel.swift
//  LearnColors
//
//  Created by Alex Karamanets on 29.12.2022.
//

import SwiftUI

extension MainView {
    
    @MainActor class ColorsViewModel: ObservableObject {
        
        @Published var colors = ColorsModel()
        @Published var selectedColor = Color.red
    }
}
//                         🔱
struct ColorsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
