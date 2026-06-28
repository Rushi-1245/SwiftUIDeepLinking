//
//  ProfileView.swift
//  SwiftUIDeepLink
//
//  Created by Rushi on 27/06/26.
//

import SwiftUI

struct ProfileView: View {
    
    let id: String
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .foregroundColor(.green)
            
            Text("Profile Screen")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Username")
            
            Text("@\(id)")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.green)
            
            Divider()
            
            Text("""
This screen was opened using a Deep Link.

The Profile identifier was parsed from the URL and used for navigation.
""")
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Profile")
    }
}

#Preview {
    
    NavigationStack {
        
        ProfileView(id: "john")
    }
}
