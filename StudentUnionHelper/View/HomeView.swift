//
//  HomeView.swift
//  StudentUnionHelper
//
//  Created by Connor Kindall on 5/1/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Student Union Helper")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 50)

                Text("Helping nonverbal students navigate the BSU Student Union Building.")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding(.horizontal, 40)

                Spacer()

                VStack(spacing: 20) {
                    NavigationLink(destination: MainView()) {
                        Label("Open Scanner", systemImage: "qrcode.viewfinder")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
                    NavigationLink(destination: PeerToPeerView())
                    {
                        Label("Talk to Staff", systemImage: "person.2.circle")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }

                    NavigationLink(destination: HelpView()) {
                        Label("Help / Info", systemImage: "info.circle")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
                }

                Spacer()

                Text("© 2025 Boise State University")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
            }
            .background(Color(.systemGroupedBackground))
            .edgesIgnoringSafeArea(.all)
        }
    }
}
