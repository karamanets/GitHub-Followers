//
//  Data.swift
//  LearnColors
//
//  Created by Alex Karamanets on 29.12.2022.
//

import SwiftUI

class ColorBase: ObservableObject, Identifiable {
    
    var id = UUID()
    
    @Published var colors = [Color.red,   Color.pink,   Color.orange, Color.brown,
                             Color.mint,  Color.indigo, Color.blue,   Color.yellow,
                             Color.black, Color.white,  Color.purple, Color.gray,
                             Color.green]
}

