//
//  SwiftUIDeepLinkingApp.swift
//  SwiftUIDeepLinking
//
//  Created by Rushi on 28/06/26.
//

import SwiftUI

@main
struct SwiftUIDeepLinkingApp: App {
    @StateObject private var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(router)
                .onOpenURL { url in
                    router.handle(url: url)
                }
        }
    }
}
