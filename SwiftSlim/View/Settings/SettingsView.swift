//
//  SettingsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/15.
//

import SwiftUI

struct SettingsView: View {
    @Binding var selected: contentType
    
    private let supportItems: [SettingsType] = [
        .feedback, .privacy, .termsOfUse
    ]
    
    private let aboutItems: [SettingsType] = [
        .aboutUs, .acknowLedgements, .openSource
    ]
    
    private var developerName: String {
        NSLocalizedString("Developer", comment: "UserName")
    }
    
    private var developerInitial: String {
        String(developerName.prefix(1))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: 36) {
                accountSection
                
                settingsSection(
                    title: "Support",
                    items: supportItems
                )
                
                settingsSection(
                    title: "About",
                    items: aboutItems
                )
                
                versionSection
            }
            .padding(.bottom, 30)
            
        }
        .navigationTitle("Settings")
    }
}

private extension SettingsView {
    var versionSection: some View {
        HStack {
            Text(verbatim: Bundle.main.version + "（" +  Bundle.main.build + "）")
        }
        .modifier(NotesText())
    }
}

private extension SettingsView {
    var accountSection: some View {
        HStack(spacing: 20) {
            Text(verbatim: developerInitial)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(width: 68, height: 68)
                .background(avatarGradient)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Developer")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Free Account")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .cardStyle()
    }
    
    var avatarGradient: some ShapeStyle {
        LinearGradient(
            colors: [Color("Linear1"), Color("Linear2")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    @ViewBuilder
    func settingsSection(title: LocalizedStringKey, items: [SettingsType]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .modifier(PromptText())
            
            VStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.element) { index, item in
                    SettingsItemView(item: item)
                    
                    if index != items.count - 1 {
                        Divider()
                            .padding(.leading, 46)
                    }
                }
            }
            .cardStyle()
        }
    }
}

// MARK: - Row
struct SettingsItemView: View {
    @Environment(\.openURL) private var openURL
    let item: SettingsType

    var body: some View {
        rowContent
    }

    @ViewBuilder
    private var rowContent: some View {
        switch item.action {
        case .destination(let destination):
            NavigationLink(destination: destination) {
                itemView
            }

        case .url(let url):
            Link(destination: url) {
                itemView
            }

        case .email:
            Button {
                Email.sendFeedback(using: openURL)
            } label: {
                itemView
            }
            .buttonStyle(.plain)
        }
    }

    private var itemView: some View {
        HStack(spacing: 10) {
            Image(item.img)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundStyle(.white)
                .padding(6)
                .background(item.color)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

            Text(LocalizedStringKey(item.title))
                .foregroundStyle(Color("BlackColor"))

            Spacer()

            Image("right")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundStyle(.gray.opacity(0.8))
                .opacity(0.5)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .contentShape(Rectangle())
    }
}

// MARK: - Reusable Style
private extension View {
    func cardStyle() -> some View {
        self
            .background(Color("WhiteAndBlack"))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStorageManager.shared)
}
