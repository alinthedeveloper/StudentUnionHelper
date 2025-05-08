//
//  PeerToPeerController.swift
//  StudentUnionHelper
//
//  Created by Grant Olson on 5/8/25.
//

import Foundation
import MultipeerConnectivity

/// Manages peer discovery and data exchange
final class PeerToPeerController: NSObject, ObservableObject {
    // MARK: - Multipeer properties
    private let serviceType = "su-helper"
    private let myPeerID = MCPeerID(displayName: UIDevice.current.name)
    private let session: MCSession
    private let advertiser: MCNearbyServiceAdvertiser
    private let browser: MCNearbyServiceBrowser

    /// Published array of received messages
    @Published var receivedMessages: [String] = []

    override init() {
        // Initialize session
        session = MCSession(peer: myPeerID, securityIdentity: nil, encryptionPreference: .required)
        advertiser = MCNearbyServiceAdvertiser(peer: myPeerID,
                                               discoveryInfo: nil,
                                               serviceType: serviceType)
        browser = MCNearbyServiceBrowser(peer: myPeerID,
                                         serviceType: serviceType)

        super.init()

        session.delegate = self
        advertiser.delegate = self
        browser.delegate = self
    }
    func start() {
      advertiser.startAdvertisingPeer()
      browser.startBrowsingForPeers()
    }

    func stop() {
      advertiser.stopAdvertisingPeer()
      browser.stopBrowsingForPeers()
      session.disconnect()
    }
    func send(_ message: String) {
      guard !session.connectedPeers.isEmpty else { return }
      let data = Data(message.utf8)
      do {
        try session.send(data, toPeers: session.connectedPeers, with: .reliable)
      } catch {
        print("Send error: \(error.localizedDescription)")
      }
    }
}

    // MARK: - MCSessionDelegate
extension PeerToPeerController: MCSessionDelegate {
  func session(_ session: MCSession,
               peer peerID: MCPeerID,
               didChange state: MCSessionState) {
    print("Peer \(peerID.displayName) changed state to \(state.rawValue)")
  }

  func session(_ session: MCSession,
               didReceive data: Data,
               fromPeer peerID: MCPeerID) {
    let msg = String(decoding: data, as: UTF8.self)
    DispatchQueue.main.async {
      self.receivedMessages.append("\(peerID.displayName): \(msg)")
    }
  }

  // Unused delegate methods
  func session(_ session: MCSession,
               didReceive stream: InputStream,
               withName streamName: String,
               fromPeer peerID: MCPeerID) {}
  func session(_ session: MCSession,
               didStartReceivingResourceWithName resourceName: String,
               fromPeer peerID: MCPeerID,
               with progress: Progress) {}
  func session(_ session: MCSession,
               didFinishReceivingResourceWithName resourceName: String,
               fromPeer peerID: MCPeerID,
               at localURL: URL?,
               withError error: Error?) {}
}

// MARK: - MCNearbyServiceAdvertiserDelegate
extension PeerToPeerController: MCNearbyServiceAdvertiserDelegate {
  func advertiser(_ advertiser: MCNearbyServiceAdvertiser,
                  didReceiveInvitationFromPeer peerID: MCPeerID,
                  withContext context: Data?,
                  invitationHandler: @escaping (Bool, MCSession?) -> Void) {
    // Automatically accept all invitations
    invitationHandler(true, self.session)
  }
}

// MARK: - MCNearbyServiceBrowserDelegate
extension PeerToPeerController: MCNearbyServiceBrowserDelegate {
  func browser(_ browser: MCNearbyServiceBrowser,
               foundPeer peerID: MCPeerID,
               withDiscoveryInfo info: [String : String]?) {
    browser.invitePeer(peerID, to: session, withContext: nil, timeout: 30)
  }

  func browser(_ browser: MCNearbyServiceBrowser,
               lostPeer peerID: MCPeerID) {
    print("Lost peer: \(peerID.displayName)")
  }
}
