//
//  PeerToPeerView.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 5/8/25.
//

import SwiftUI
import Foundation

struct PeerToPeerView: View {
    @StateObject private var controller = PeerToPeerController()
    @State private var messageToSend: String = ""
    @State private var selectedCard: PECSCard? = nil

    var body: some View {
        VStack(spacing: 20) {
            Text("Talk to Staff")
                .font(.title2)
                .fontWeight(.bold)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(defaultPECSCards) { card in
                    Button(action: {
                        selectedCard = card
                    }) {
                        VStack {
                            Image(systemName: card.systemImageName)
                                .font(.largeTitle)
                            Text(card.label)
                                .font(.caption)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)

            List(controller.receivedMessages, id: \.self) { msg in
                Text(msg)
            }

            Spacer()
        }
        .padding()
        .onAppear { controller.start() }
        .onDisappear { controller.stop() }
        .sheet(item: $selectedCard) { card in
            VStack(spacing: 20) {
                Text("Send Message")
                    .font(.headline)
                Image(systemName: card.systemImageName)
                    .font(.largeTitle)
                Text(card.label)
                    .font(.title2)
                Button("Confirm Send") {
                    controller.send(card.label)
                    selectedCard = nil
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                Button("Cancel") {
                    selectedCard = nil
                }
                .padding()
            }
            .padding()
        }
    }
}
