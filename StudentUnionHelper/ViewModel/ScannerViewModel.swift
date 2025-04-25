//
//  ScannerViewModel.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/24/25.
//

import SwiftUI

class ScannerViewModel: ObservableObject {
    @Published var currentLocation: Location?
    
    
    private let dummyLocations:
    [String: Location] = ["Main_Entrance": Location(id: "01", name: "Main_Entrance", coordinates: CGPoint(x:1,y:1))]
                          
    func setLocation (from id: String)
    {
        // grab the location from the qr code
        currentLocation = dummyLocations[id]
    }
}
