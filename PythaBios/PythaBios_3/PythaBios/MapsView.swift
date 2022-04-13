//
//  MapsView.swift
//  PythaBios
//
//  Created by alessio on 26/10/21.
//

import SwiftUI
import MapKit


struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


struct MapsView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.845019, longitude: 14.285044), span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7))
    var body: some View {
        

          let annotations = [
              City(name: "Parco Virgiliano", coordinate: CLLocationCoordinate2D(latitude: 40.799260, longitude: 14.180473)),
              City(name: "Villa Floridiana", coordinate: CLLocationCoordinate2D(latitude: 40.839421, longitude: 14.229635)),
              City(name: "Parco dei Camaldoli", coordinate: CLLocationCoordinate2D(latitude: 40.863648, longitude: 14.197455)),
              City(name: "Parco Capodimonte", coordinate: CLLocationCoordinate2D(latitude: 40.872273, longitude: 14.253404)),
              City(name: "Riserva Naturale degli Astroni", coordinate: CLLocationCoordinate2D(latitude: 40.840219, longitude: 14.159161)),
              City(name: "Villa Comunale napoli", coordinate: CLLocationCoordinate2D(latitude: 40.832565, longitude: 14.234374)),
              City(name: "Mostra d’Oltremare", coordinate: CLLocationCoordinate2D(latitude: 40.825441, longitude: 14.186890)),
              City(name: "Orto Botanico", coordinate: CLLocationCoordinate2D(latitude: 40.862452, longitude: 14.263416)),



              City(name: "Villa Pignatelli", coordinate: CLLocationCoordinate2D(latitude: 40.825014, longitude: 14.328071))
          ]
        ScrollView{
            Text("Maps")
            Map(coordinateRegion: $region, annotationItems: annotations) {
                 MapPin(coordinate: $0.coordinate)
             }
             .frame(width: 408, height: 730)
        }
           
    }
}

struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
