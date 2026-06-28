//
//  HomeView.swift
//  SwiftUIDeepLink
//
//  Created by Rushi on 27/06/26.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject private var router: AppRouter

    var body: some View {

        NavigationStack(path: $router.path) {

            ScrollView {

                VStack(spacing: 25) {

                    Image(systemName: "link.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.blue)

                    Text("SwiftUI Deep Linking")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("""
                        This project demonstrates how to implement Deep Linking in SwiftUI using:
                        
                        • Custom URL Schemes
                        • Universal Links
                        • NavigationStack
                        • Type-safe Routing
                        """)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.secondary)

                    Divider()

                    VStack(alignment: .leading, spacing: 12) {

                        Text("Supported Custom URL Schemes")
                            .font(.headline)

                        DeepLinkRow(link: "deeplink://product/101")

                        DeepLinkRow(link: "deeplink://profile/john")

                        DeepLinkRow(link: "deeplink://settings")
                    }

                    Divider()

                    VStack(alignment: .leading, spacing: 12) {

                        Text("Supported Universal Links")
                            .font(.headline)

                        DeepLinkRow(link: "https://test.com/product/101")

                        DeepLinkRow(link: "https://test.com/profile/john")

                        DeepLinkRow(link: "https://test.com/settings")
                    }

                    Divider()

                    Text("Waiting for a Deep Link...")
                        .font(.headline)
                        .foregroundColor(.blue)

                }
                .padding()
            }
            .navigationTitle("Home")
            .navigationDestination(for: Route.self) { route in

                switch route {

                case .product(let id):
                    ProductView(id: id)

                case .profile(let id):
                    ProfileView(id: id)

                case .settings:
                    SettingsView()
                }
            }
        }
    }
}

#Preview {

    HomeView()
        .environmentObject(AppRouter())
}
