//
//  ScannerViewModel.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/24/25.
//

import SwiftUI

class ScannerViewModel: ObservableObject {
    @Published var currentLocation: Location?
    
    
    private let dummyLocations: [String: Location] = [
        "01": Location(id: "01", name: "Main Entrance", coordinates: CGPoint(x: 1, y: 1)),
        "02": Location(id: "02", name: "Help Desk", coordinates: CGPoint(x: 1, y: 1)),
        "03": Location(id: "03", name: "Main Hall", coordinates: CGPoint(x: 1, y: 1)),
        "04": Location(id: "04", name: "Buster's Kitchen", coordinates: CGPoint(x: 1, y: 1))
    ]
                          
    func setLocation (from id: String)
    {
        // grab the location from the qr code
        currentLocation = dummyLocations[id]
    }
    
    func clearLocation() {
        currentLocation = nil
    }
}
