//
//  Route.swift
//  SwiftUIDeepLink
//
//  Created by Rushi on 27/06/26.
//

import Foundation

/// Defines all destinations that can be opened inside the app.
enum Route: Hashable {

    case product(id: String)
    case profile(id: String)
    case settings
}
