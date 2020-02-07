//
//  Button.swift
//  Preference in swiftUI
//
//  Created by Heshan Yodagama on 2/7/20.
//  Copyright © 2020 Heshan Yodagama. All rights reserved.
//

import SwiftUI

struct MonthView: View {
    
    var dateName: String
    var index: Int
    @Binding var selectedTabIndex: Int
    
    var body: some View {
        
        Text(dateName)
            .padding()
        .background(MonthBorder(show: selectedTabIndex == index))
            .onTapGesture {
                self.selectedTabIndex = self.index
        }
        
    }
}

struct MonthBorder: View {
    let show: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(lineWidth: 3.0).foregroundColor(show ? Color.red : Color.clear)
            .animation(.easeInOut(duration: 0.6))
    }
}
