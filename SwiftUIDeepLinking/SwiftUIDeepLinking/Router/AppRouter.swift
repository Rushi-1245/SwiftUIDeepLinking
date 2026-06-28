//
//  AppRouter.swift
//  SwiftUIDeepLink
//
//  Created by Rushi on 27/06/26.
//


import SwiftUI
import Combine

final class AppRouter: ObservableObject {

    @Published var path = NavigationPath()

    private let parser = DeepLinkParser()

    /// Handles incoming URL and navigates to the corresponding screen.
    func handle(url: URL) {

        guard let route = parser.parse(url: url) else {

            print("❌ Unsupported Deep Link")

            return
        }

        navigate(to: route)
    }

    /// Navigates to a destination.
    func navigate(to route: Route) {

        // Clear current navigation stack.
        path = NavigationPath()

        // Push new destination.
        path.append(route)
    }
}
