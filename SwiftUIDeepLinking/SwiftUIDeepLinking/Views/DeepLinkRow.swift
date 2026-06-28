//
//  DeepLinkRow.swift
//  SwiftUIDeepLink
//
//  Created by Rushi on 27/06/26.
//

import SwiftUI

struct DeepLinkRow: View {

    let link: String

    var body: some View {

        HStack {

            Image(systemName: "link")

            Text(link)
                .font(.footnote)
                .textSelection(.enabled)

            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {

    DeepLinkRow(link: "deeplink://product/101")
        .padding()
}
