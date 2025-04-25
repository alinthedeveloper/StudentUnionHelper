//
//  NavViewModel.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/24/25.
//  Stores the Currently Scanned Location
//  Updates state when a QR code is scanned

import SwiftUI

class NavViewModel: ObservableObject {
    @Published var currentLocation: Location?
    
    
    private let dummyLocations:
    [String: Location] = ["Main_Entrance": Location(id: "01", name: "Main_Entrance", coordinates: CGPoint(x:1,y:1))]
                          
    func setLocation (from id: String)
    {
        // grab the location from the qr code
        currentLocation = dummyLocations[id]
    }
}
