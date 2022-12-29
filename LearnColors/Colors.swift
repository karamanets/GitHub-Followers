//
//  Colors.swift
//  LearnColors
//
//  Created by Alex Karamanets on 29.12.2022.
//

import SwiftUI

struct Colors: View {
    
    @ObservedObject var colors: ColorBase
    
    var body: some View {
        
        ScrollView (.horizontal) {
            HStack {
                ForEach(colors.colors, id: \.self) { item in
                    Circle()
                        .frame(width: 58, height: 58)
                        .foregroundColor(item)
                        
                }
            }
        }
    }
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Colors(colors: ColorBase())
    }
}
