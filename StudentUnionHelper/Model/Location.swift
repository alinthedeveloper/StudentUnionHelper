//
//  Location.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 4/24/25.
//  Holds information about each scannable location

import CoreGraphics

struct Location: Codable, Identifiable {
    var id: String
    var name: String
    var coordinates: CGPoint
}
