//
//  HelpView.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 5/8/25.
//

import SwiftUI
import Accessibility
import AVFoundation

struct HelpView: View {
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                GroupBox(label: Label("About This App", systemImage: "info.circle")) {
                    Text("This is an accessibility-focused project made to help nonverbal students navigate through the BSU Student Union Building.")
                }

                Divider()

                Text("How to Use")
                    .font(.title2)
                    .fontWeight(.semibold)

                Label("Press the back button to return to the main menu.", systemImage: "arrow.left")
                    .accessibilityLabel("Press the back button in the top left to return to the main menu.")
                Label("Tap the 'Scanner' button and scan the QR code near your entrance.", systemImage: "qrcode.viewfinder")
                    .accessibilityLabel("Tap the Scanner button and scan the QR code near your current entrance.")
                Label("Follow the arrows on the screen to reach your destination.", systemImage: "arrow.triangle.turn.up.right.diamond")
                    .accessibilityLabel("Follow the arrows on the screen to reach your destination.")

                Divider()

                Text("Staff Communication")
                    .font(.title2)
                    .fontWeight(.semibold)

                Label("If you need help, nearby staff can connect to your device to offer assistance.", systemImage: "person.2.circle")
                    .accessibilityLabel("If you need help, nearby staff can connect to your device to offer assistance.")
                Label("Make sure Bluetooth is turned on to allow staff to reach you.", systemImage: "antenna.radiowaves.left.and.right")
                    .accessibilityLabel("Make sure Bluetooth is turned on to allow staff to reach you.")

                Button(action: {
                    let helpText = """
                    How to Use. Press the back button in the top left to return to the main menu.
                    Tap the Scanner button and scan the QR code near your current entrance.
                    Follow the arrows on the screen to reach your destination.

                    Staff Communication. If you need help, nearby staff can connect to your device to offer assistance.
                    Make sure Bluetooth is turned on to allow staff to reach you.
                    """
                    let utterance = AVSpeechUtterance(string: helpText)
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                    speechSynthesizer.speak(utterance)
                }) {
                    Label("Need More Help?", systemImage: "questionmark.circle")
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
        }
    }
}
