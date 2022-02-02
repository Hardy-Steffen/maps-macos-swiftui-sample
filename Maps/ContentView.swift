//
//  ContentView.swift
//  Maps
//
//  Originally created by Jordan Singer on 7/13/20.
//  Forked and updated by Alexander Steffen in 2022. https://hardysteffen.com

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:  45.531508, longitude:  -73.586392), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    var body: some View {
        NavigationView {
            Sidebar()
            Map(coordinateRegion: $region)
        }
        .navigationTitle("Montréal, QC")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: { }) {
                    Image(systemName: "sidebar.left")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "location")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "map")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "view.3d")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "binoculars")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "arrowshape.turn.up.right.circle")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "plus")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    }
}

struct Sidebar: View {
    @State private var search = ""
    
    var body: some View {
        VStack {
            SearchField(text: $search)
                .padding(.horizontal)
            
            List {
                Text("Google Maps")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                VStack(alignment: .leading, spacing: 0) {
                    FavoriteView(title: "Home", subtitle: "Nearby", icon: "house.fill", color: .blue)
              
               
                }
                .padding(.bottom)
                

            }
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 192, idealWidth: 192, maxWidth: 192, maxHeight: .infinity)
    }
}

struct FavoriteView: View {
    var title: String
    var subtitle: String
    var icon: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .frame(width: 32, height: 32)
                .foregroundColor(color)
                .overlay(
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                )
            
            VStack(alignment: .leading) {
                Text(title)
                Text(subtitle)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 6)
    }
}

struct SearchField: NSViewRepresentable {
    @Binding var text: String

    func makeNSView(context: Context) -> NSSearchField {
        let textField = NSSearchField()
        return textField
    }
    func updateNSView(_ nsView: NSSearchField, context: Context) {
        nsView.stringValue = text
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
