//
//  SettingsView.swift
//  SwiftUIDeepLink
//
//  Created by Rushi on 27/06/26.
//


import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            Image(systemName: "gearshape.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .foregroundColor(.orange)
            
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("""
This screen demonstrates a Deep Link that does not require any parameters.

Example:

deeplink://settings

or

https://test.com/settings
""")
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Settings")
    }
}

#Preview {

    NavigationStack {

        SettingsView()
    }
}
