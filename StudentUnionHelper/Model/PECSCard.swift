//
//  PECSCard.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 5/8/25.
//

import Foundation

struct PECSCard: Identifiable, Hashable {
    let id = UUID()
    let label: String
    let systemImageName: String
}

let defaultPECSCards: [PECSCard] = [
    PECSCard(label: "Yes", systemImageName: "checkmark.circle"),
    PECSCard(label: "No", systemImageName: "xmark.circle"),
    PECSCard(label: "All Done", systemImageName: "trash"),
    PECSCard(label: "Stop", systemImageName: "hand.raised.fill"),
    PECSCard(label: "Wait", systemImageName: "hourglass"),
    PECSCard(label: "Bathroom", systemImageName: "toilet"),
    PECSCard(label: "Water", systemImageName: "drop"),
    PECSCard(label: "Food", systemImageName: "fork.knife"),
    PECSCard(label: "Break", systemImageName: "pause.circle"),
    PECSCard(label: "Tired", systemImageName: "zzz"),
    PECSCard(label: "Happy", systemImageName: "smiley"),
    PECSCard(label: "Bad", systemImageName: "exclamationmark.triangle"),
    PECSCard(label: "Help", systemImageName: "questionmark.circle"),
    PECSCard(label: "Quiet", systemImageName: "speaker.slash"),
    PECSCard(label: "Listen", systemImageName: "ear"),
    PECSCard(label: "Play", systemImageName: "gamecontroller"),
    PECSCard(label: "Inside", systemImageName: "house"),
    PECSCard(label: "Outside", systemImageName: "sun.max")
]
