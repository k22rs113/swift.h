//
//  mapView.swift
//  ToDoList
//
//  Created by h.kento on 2024/05/09.
//

import Foundation
import MapKit
import SwiftUI

struct Place: Identifiable {
    let coordinate: CLLocationCoordinate2D
    let id = UUID()
}

struct mapView: View {
    
    @State  var region = MKCoordinateRegion(
        center : CLLocationCoordinate2D(
            latitude: 33.67074628619078,  // 緯度
            longitude: 130.44462257951858 // 経度
        ),
        latitudinalMeters: 1000.0, // 南北
        longitudinalMeters: 1000.0 // 東西
    )
    
    var body: some View {
        // 地図を表示
        Map(coordinateRegion: $region,
            annotationItems: [
                Place(
                    coordinate: CLLocationCoordinate2D(
                        latitude: 33.673826066305054,
                        longitude: 130.44072814286878
                    )
                )
            ],
            annotationContent: {item in
            MapMarker(coordinate: item.coordinate,
                      tint: Color.red)
        }
        )
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    mapView()
}
