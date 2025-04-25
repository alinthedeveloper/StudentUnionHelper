//
//  NavView.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/24/25.
//  what is shown to the user after scanning a QR code
//  shows navigation info based on current location
import SwiftUI
import CoreLocation


struct NavView: View {
    @EnvironmentObject var viewModel: NavViewModel
    
    var body: some View {
        VStack {
            if let location = viewModel.currentLocation {Text("You're at: \(location.name)")
            }
            else {
                Text("Scan a QR code to begin")
            }
        }
    }
}
