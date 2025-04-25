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
    
    func updateLocation(from scannedCode: String)
    {
        
    }
}
