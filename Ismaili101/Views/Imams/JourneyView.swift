import SwiftUI
import MapKit

struct JourneyView: View {
    @State private var filter: JourneyKind?
    @State private var focused: JourneyEvent?

    private var events: [JourneyEvent] {
        guard let filter else { return JourneyData.all }
        return JourneyData.all.filter { $0.kind == filter }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Where the community lived, under which powers, when it hid, and what it endured.")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.horizontal)

            MigrationMap(events: JourneyData.all, focused: focused)
                .frame(height: 260)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).strokeBorder(Color.primary.opacity(0.08)))
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    chip(nil, label: "All", symbol: "list.bullet")
                    ForEach(JourneyKind.allCases, id: \.self) { kind in
                        chip(kind, label: kind.rawValue, symbol: kind.symbol)
                    }
                }
                .padding(.horizontal)
            }

            LazyVStack(spacing: 12) {
                ForEach(events) { event in
                    JourneyCard(event: event, isFocused: focused == event) {
                        Haptics.tap()
                        withAnimation(.spring()) { focused = (focused == event) ? nil : event }
                    }
                }
            }
            .padding(.horizontal)
        }
    }

    private func chip(_ kind: JourneyKind?, label: String, symbol: String) -> some View {
        let selected = filter == kind
        return Button {
            Haptics.tap()
            withAnimation(.spring()) { filter = kind }
        } label: {
            Label(label, systemImage: symbol)
                .font(.subheadline.weight(.semibold))
                .padding(.horizontal, 12)
                .padding(.vertical, 7)
                .background(Capsule().fill(selected ? AnyShapeStyle(LinearGradient.brand) : AnyShapeStyle(.ultraThinMaterial)))
                .foregroundStyle(selected ? Color.white : Color.primary)
        }
        .buttonStyle(SpringButtonStyle())
    }
}

struct JourneyCard: View {
    let event: JourneyEvent
    let isFocused: Bool
    let tap: () -> Void

    private var tint: Color { event.kind == .hardship ? .red : (event.kind == .concealment ? .purple : .emerald) }

    var body: some View {
        Button(action: tap) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("\(event.order)")
                        .font(.caption.bold().monospacedDigit())
                        .foregroundStyle(.white)
                        .frame(width: 26, height: 26)
                        .background(Circle().fill(tint))
                    Text(event.years)
                        .font(.subheadline.weight(.bold).monospacedDigit())
                        .foregroundStyle(tint)
                    Spacer()
                    PillTag(text: event.kind.rawValue, color: tint)
                }
                Text(event.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Label(event.place, systemImage: "mappin.and.ellipse")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
                Label(event.ruledBy, systemImage: "building.columns")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(event.summary)
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                if let hardship = event.hardship {
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "exclamationmark.triangle.fill").foregroundStyle(.red)
                        Text(hardship)
                            .font(.subheadline)
                            .foregroundStyle(.primary)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.red.opacity(0.08), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
                if isFocused {
                    Label("Shown on the map above", systemImage: "map.fill")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(Color.gold)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .card()
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                .strokeBorder(isFocused ? Color.gold : .clear, lineWidth: 2))
        }
        .buttonStyle(SpringButtonStyle())
    }
}

// MARK: - Map with a route line (MKMapView, so it works on iOS 16)

struct MigrationMap: UIViewRepresentable {
    let events: [JourneyEvent]
    let focused: JourneyEvent?

    final class Pin: NSObject, MKAnnotation {
        let coordinate: CLLocationCoordinate2D
        let title: String?
        let subtitle: String?
        let number: Int
        let isHardship: Bool
        init(_ event: JourneyEvent) {
            coordinate = CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude)
            title = "\(event.order). \(event.title)"
            subtitle = event.years
            number = event.order
            isHardship = event.kind == .hardship
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        map.pointOfInterestFilter = .excludingAll
        map.addAnnotations(events.map(Pin.init))
        let coords = events.map { CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude) }
        map.addOverlay(MKPolyline(coordinates: coords, count: coords.count))
        map.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 30, longitude: 40),
                                         span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 110)),
                      animated: false)
        return map
    }

    func updateUIView(_ map: MKMapView, context: Context) {
        guard focused?.order != context.coordinator.lastFocus else { return }
        context.coordinator.lastFocus = focused?.order
        if let focused,
           let pin = map.annotations.compactMap({ $0 as? Pin }).first(where: { $0.number == focused.order }) {
            map.setRegion(MKCoordinateRegion(center: pin.coordinate,
                                             span: MKCoordinateSpan(latitudeDelta: 18, longitudeDelta: 18)),
                          animated: true)
            map.selectAnnotation(pin, animated: true)
        } else {
            map.selectedAnnotations.forEach { map.deselectAnnotation($0, animated: true) }
            map.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 30, longitude: 40),
                                             span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 110)),
                          animated: true)
        }
    }

    final class Coordinator: NSObject, MKMapViewDelegate {
        var lastFocus: Int?

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            guard let line = overlay as? MKPolyline else { return MKOverlayRenderer(overlay: overlay) }
            let renderer = MKPolylineRenderer(polyline: line)
            renderer.strokeColor = UIColor(red: 0.83, green: 0.69, blue: 0.22, alpha: 0.85)
            renderer.lineWidth = 2
            renderer.lineDashPattern = [6, 4]
            return renderer
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let pin = annotation as? Pin else { return nil }
            let view = mapView.dequeueReusableAnnotationView(withIdentifier: "pin") as? MKMarkerAnnotationView
                ?? MKMarkerAnnotationView(annotation: pin, reuseIdentifier: "pin")
            view.annotation = pin
            view.glyphText = "\(pin.number)"
            view.markerTintColor = pin.isHardship
                ? .systemRed
                : UIColor(red: 0.10, green: 0.53, blue: 0.33, alpha: 1)
            view.canShowCallout = true
            view.displayPriority = .required
            return view
        }
    }
}
