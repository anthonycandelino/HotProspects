//  EditProspectView.swift
//
//  HotProspects
//
//  Created by Anthony Candelino on 2024-09-26.
//

import SwiftUI
import SwiftData

struct EditProspectView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var prospect: Prospect
    @State private var originalName: String
    @State private var originalEmailAddress: String
    @State private var animateOnLoad = false
    
    init(prospect: Prospect) {
        self.prospect = prospect
        _originalName = State(initialValue: prospect.name)
        _originalEmailAddress = State(initialValue: prospect.emailAddress)
    }
    
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Spacer()
                    Text("Changes are saved automatically")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Image(systemName: "checkmark.icloud.fill")
                        .symbolEffect(.breathe.pulse.byLayer, options: .repeat(3), value: animateOnLoad)
                    Spacer()
                }
                .padding(0)
                .listRowBackground(Color.clear)
                
                Section("Edit name") {
                    TextField("Name", text: $prospect.name)
                }
                
                Section("Edit email") {
                    TextField("Email Address", text: $prospect.emailAddress)
                }
                
                if hasChanges() {
                    Section {
                        HStack {
                            Spacer()
                            Button() {
                                prospect.name = originalName
                                prospect.emailAddress = originalEmailAddress
                            } label: {
                                HStack {
                                    Text("Undo Changes")
                                    Image(systemName: "arrow.uturn.backward")
                                }
                            }
                            .foregroundStyle(.white)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 15)
                            .background(Capsule().fill(.blue))
                            .shadow(radius: 5)
                            Spacer()
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle("Edit Prospect")
        }
        .onAppear() {
            animateOnLoad = true
        }
    }
    
    func hasChanges() -> Bool {
        originalName != prospect.name || originalEmailAddress != prospect.emailAddress
    }
}

#Preview {
    EditProspectView(prospect: Prospect(name: "Name", emailAddress: "email@example.com", isContacted: false))
}
