//
//  ProductView.swift
//  SwiftUIDeepLink
//
//  Created by Rushi on 27/06/26.
//

import SwiftUI

struct ProductView: View {

    let id: String

    var body: some View {

        VStack(spacing: 25) {

            Image(systemName: "cart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .foregroundColor(.blue)

            Text("Product Screen")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Product ID")

            Text(id)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.blue)

            Divider()

            Text("""
This screen was opened using a Deep Link.

The Product ID was extracted from the incoming URL and passed safely using NavigationStack.
""")
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle("Product")
    }
}

#Preview {

    NavigationStack {

        ProductView(id: "101")
    }
}
