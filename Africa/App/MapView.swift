import SwiftUI
import MapKit

struct MapView: View {

    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude:16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)

        return MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    }()

    let locations: [NationalParkLocation] = Bundle.main.toModel("locations.json")

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
//            MapPin(coordinate: item.location, tint: .accentColor)
//            MapMarker(coordinate: item.location, tint: .accentColor)

            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            }
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
