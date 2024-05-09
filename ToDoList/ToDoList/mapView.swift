//
//  mapView.swift
//  ToDoList
//
//  Created by h.kento on 2024/05/09.
//

import Foundation
import MapKit
import SwiftUI

struct mapView: View {

@State  var region = MKCoordinateRegion(
        center : CLLocationCoordinate2D(
            latitude: 33.67074628619078,  // 緯度
            longitude: 130.44462257951858 // 経度
        ),
        latitudinalMeters: 500.0, // 南北
        longitudinalMeters: 500.0 // 東西
    )
    
    var body: some View {
        // 地図を表示
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    mapView()
}
