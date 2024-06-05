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
    //@State var posittion: MapCameraPosition = .automatic
    @State  var region = MKCoordinateRegion(
        center : CLLocationCoordinate2D(
            latitude: 33.67074628619078,
            longitude: 130.44462257951858
        ),
        latitudinalMeters: 750.0,
        longitudinalMeters: 750.0
    )
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: [
                Place(
                    coordinate: CLLocationCoordinate2D(
                        latitude: 33.673826066305054,
                        longitude: 130.44072814286878
                    )
                ),
                //オアシス
                Place(
                    coordinate: CLLocationCoordinate2D(
                        latitude: 33.66954866384091,
                        longitude: 130.44529495832367
                    )
                ),
                //クラブハウス
                Place(
                    coordinate: CLLocationCoordinate2D(
                        latitude: 33.67115441064561,
                        longitude: 130.4452513873343
                    )
                ),
                //アルテリア
                Place(
                    coordinate: CLLocationCoordinate2D(
                        latitude: 33.67123923509521,
                        longitude: 130.4434838116456
                    )
                ),
                //クオーレ
                Place(
                    coordinate: CLLocationCoordinate2D(
                        latitude: 33.670386522232924,
                        longitude: 130.44359914662658
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
