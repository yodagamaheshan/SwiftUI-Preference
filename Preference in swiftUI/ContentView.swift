//
//  ContentView.swift
//  Preference in swiftUI
//
//  Created by Heshan Yodagama on 2/7/20.
//  Copyright © 2020 Heshan Yodagama. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selectedMonth: Int = 3
    var body: some View {
        VStack {
            HStack {
                MonthView(dateName: "January", index: 1, selectedTabIndex: $selectedMonth)
                MonthView(dateName: "February", index: 2, selectedTabIndex: $selectedMonth)
                MonthView(dateName: "March", index: 3, selectedTabIndex: $selectedMonth)
                MonthView(dateName: "April", index: 4, selectedTabIndex: $selectedMonth)
            }
            HStack {
                MonthView(dateName: "May", index: 5, selectedTabIndex: $selectedMonth)
                MonthView(dateName: "June", index: 6, selectedTabIndex: $selectedMonth)
                MonthView(dateName: "Jule", index: 7, selectedTabIndex: $selectedMonth)
                MonthView(dateName: "August", index: 8, selectedTabIndex: $selectedMonth)
            }
            HStack {
                MonthView(dateName: "September", index: 9, selectedTabIndex: $selectedMonth)
                MonthView(dateName: "October", index: 10, selectedTabIndex: $selectedMonth)
                MonthView(dateName: "November", index: 11, selectedTabIndex: $selectedMonth)
                MonthView(dateName: "December", index: 12, selectedTabIndex: $selectedMonth)
            }
        }
    .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
