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
    @State var rects: [CGRect] = Array<CGRect>(repeating: CGRect(), count: 13)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 3.0)
                .foregroundColor(Color.green)
                .frame(width: rects[selectedMonth].size.width, height: rects[selectedMonth].size.height)
                
                .offset(x:rects[selectedMonth].origin.x - 100, y:rects[selectedMonth].origin.y - 60)
                .animation(.easeInOut(duration: 1.0))
            
            
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
                        .border(Color.black, width: 2)
                    MonthView(dateName: "October", index: 10, selectedTabIndex: $selectedMonth)
                    MonthView(dateName: "November", index: 11, selectedTabIndex: $selectedMonth)
                    MonthView(dateName: "December", index: 12, selectedTabIndex: $selectedMonth)
                }
                
                
            }
            .onPreferenceChange(MyTextPreferenceKey.self, perform: { (preferences) in
                for p in preferences{
                    self.rects[p.viewIndex] = p.rect
                }
            })
                .padding()
        }.coordinateSpace(name: "myZstack")
            .border(Color.black, width: 2)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MonthView: View {
    
    var dateName: String
    var index: Int
    @Binding var selectedTabIndex: Int
    
    var body: some View {
        Text(self.dateName)
            .padding(10)
            .background(MyPreferrenceViewSetter(index: self.index))
            .onTapGesture {
                self.selectedTabIndex = self.index
        }
    }
}

struct MyPreferrenceViewSetter: View {
    let index: Int
    
    var body: some View {
        
        GeometryReader { (geometry) in
            Rectangle()
                .fill(Color.clear)
                .preference(key: MyTextPreferenceKey.self, value: [MyTextPreferenceData(viewIndex: self.index, rect: geometry.frame(in: .named("myZstack")))])
        }
    }
}

struct MyTextPreferenceData: Equatable{
    let viewIndex: Int
    let rect: CGRect
}

struct  MyTextPreferenceKey: PreferenceKey {
    
    typealias Value = [MyTextPreferenceData]
    
    static var defaultValue: [MyTextPreferenceData] = []
    
    static func reduce(value: inout [MyTextPreferenceData], nextValue: () -> [MyTextPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
    
    
}

