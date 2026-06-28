//
//  DeepLinkParser.swift
//  SwiftUIDeepLinking
//
//  Created by Rushi on 28/06/26.
//

import Foundation

struct DeepLinkParser {

    /// Converts an incoming URL into a Route.
    func parse(url: URL) -> Route? {

        guard let components = URLComponents(
            url: url,
            resolvingAgainstBaseURL: true
        ) else {
            return nil
        }

        //----------------------------------------
        // Custom URL Scheme
        // deeplink://product/101
        //----------------------------------------

        if url.scheme?.lowercased() == "deeplink" {

            return parseCustomScheme(
                host: components.host,
                pathComponents: url.pathComponents
            )
        }

        //----------------------------------------
        // Universal Links
        // https://test.com/product/101
        //----------------------------------------

        if url.scheme?.lowercased() == "https",
           components.host == "test.com" {

            return parseUniversalLink(
                pathComponents: url.pathComponents
            )
        }

        return nil
    }
}

// MARK: - Private Methods

private extension DeepLinkParser {

    func parseCustomScheme(
        host: String?,
        pathComponents: [String]
    ) -> Route? {

        guard let host,
              let type = DeepLinkType(rawValue: host)
        else {
            return nil
        }

        let id = pathComponents.last(where: { $0 != "/" })

        switch type {

        case .product:

            guard let id else { return nil }
            return .product(id: id)

        case .profile:

            guard let id else { return nil }
            return .profile(id: id)

        case .settings:

            return .settings
        }
    }

    func parseUniversalLink(
        pathComponents: [String]
    ) -> Route? {

        let paths = pathComponents.filter { $0 != "/" }

        guard let first = paths.first,
              let type = DeepLinkType(rawValue: first)
        else {
            return nil
        }

        switch type {

        case .product:

            guard paths.count > 1 else { return nil }
            return .product(id: paths[1])

        case .profile:

            guard paths.count > 1 else { return nil }
            return .profile(id: paths[1])

        case .settings:

            return .settings
        }
    }
}

