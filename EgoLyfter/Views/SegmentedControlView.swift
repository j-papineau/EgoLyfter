//
//  SegmentedControlView.swift
//  EgoLyfter
//
//  Created by Joel on 7/11/23.
//

import SwiftUI

enum ListSection:String, CaseIterable{
    case templates = "Templates"
    case history = "History"
}

struct SegmentedControlView: View {
    
//    init(){
//        UISegmentedControl.appearance().selectedSegmentTintColor
//    }
    
    @State var segmentSelection: ListSection = .templates
    
    var body: some View {
        Picker("", selection: $segmentSelection){
            ForEach(ListSection.allCases, id: \.self){ option in
                Text(option.rawValue)
            }
        }.pickerStyle(SegmentedPickerStyle())
            .padding()
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView()
    }
}
