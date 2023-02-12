//import SwiftUI
//import Foundation
//import YandexMapsMobile
//import CoreLocation
//
//struct YandexMapsView: UIViewRepresentable {
//    
//    // Listen to changes on the locationManager
//    @ObservedObject var locationManager = LocationManager()
//    let TARGET_LOCATION = YMKPoint(latitude: 56.81591413907636, longitude: 60.635496104088254)
//    private var imageProvider = UIImage(named: "SearchResult")!
//    
//    func makeUIView(context: Context) -> YMKMapView {
//        let mapView = YMKMapView(frame: CGRect.zero)
//        
////        mapView.mapWindow.map.move(
////                   with: YMKCameraPosition(target: TARGET_LOCATION, zoom: 5, azimuth: 0, tilt: 0),
////                   animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 1),
////                   cameraCallback: nil)
//        
//        
//        let cameraPosition = YMKCameraPosition(
//            target: CLUSTER_CENTERS[0],
//            zoom: 15,
//            azimuth: 0,
//            tilt: 0
//        )
//        mapView.mapWindow.map.move(with: cameraPosition)
//        
//        let userLocationViewController = UserLocationViewController()
//        userLocationViewController.collection = mapView.mapWindow.map.mapObjects.addClusterizedPlacemarkCollection(with: userLocationViewController)
//
//        userLocationViewController.points = createPoints()
//        userLocationViewController.collection?.addPlacemarks(with: userLocationViewController.points, image: self.imageProvider, style: YMKIconStyle())
//        
//        
//        let mapKit = YMKMapKit.sharedInstance()
//        let userLocationLayer = mapKit.createUserLocationLayer(with: mapView.mapWindow)
//        userLocationLayer.setVisibleWithOn(true)
//        userLocationLayer.isHeadingEnabled = true
//        userLocationLayer.setObjectListenerWith(userLocationViewController)
//
//        userLocationViewController.collection?.clusterPlacemarks(withClusterRadius: 60, minZoom: 30)
//        return mapView
//    }
//    
//    func randomDouble() -> Double {
//        return Double(arc4random()) / Double(UINT32_MAX)
//    }
//
//    private let CLUSTER_CENTERS: [YMKPoint] = [
//        YMKPoint(latitude: 56.838, longitude: 60.597),
//    ]
//
//    private let PLACEMARKS_NUMBER = 20
//
//    func createPoints() -> [YMKPoint]{
//        var points = [YMKPoint]()
//        points.append(YMKPoint(latitude: 56.8398028299233, longitude: 60.5939761442353))
//        points.append(YMKPoint(latitude: 56.81580976267397, longitude: 60.63549983497034))
//        points.append(YMKPoint(latitude: 56.8130998386272, longitude: 60.65261115730017))
//        points.append(YMKPoint(latitude: 56.825145707072124, longitude: 60.50057381044864))
//        return points
//    }
//
//         
//    func updateUIView(_ mapView: YMKMapView, context: Context) {
//        
//    }
//}
//
//class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
//
//    // Publish the user's location so subscribers can react to updates
//    @Published var lastKnownLocation: CLLocation? = nil
//    private let manager = CLLocationManager()
//
//    override init() {
//        super.init()
//        manager.requestWhenInUseAuthorization()
//        manager.delegate = self
//    }
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse {
//            self.manager.startUpdatingLocation()
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // Notify listeners that the user has a new location
//        self.lastKnownLocation = locations.last
//    }
//}
//
//struct MapView: View {
//    var body: some View {
//        YandexMapsView().edgesIgnoringSafeArea(.all).onAppear {
//            
//        }
//    }
//}
//
//
//class UserLocationViewController: UIViewController, YMKUserLocationObjectListener, YMKClusterListener, YMKClusterTapListener {
//    
//    var collection: YMKClusterizedPlacemarkCollection?
//    var points: [YMKPoint] = [] // Fill the array with any points
//
//    private let FONT_SIZE: CGFloat = 15
//    private let MARGIN_SIZE: CGFloat = 3
//    private let STROKE_SIZE: CGFloat = 3
//    
//    func onClusterTap(with cluster: YMKCluster) -> Bool {
//        true
//    }
//
//    func onClusterAdded(with cluster: YMKCluster) {
//        cluster.appearance.setIconWith(clusterImage(cluster.size))
//        cluster.addClusterTapListener(with: self)
//    }
//    
//    func clusterImage(_ clusterSize: UInt) -> UIImage {
//        let scale = UIScreen.main.scale
//        let text = (clusterSize as NSNumber).stringValue
//        let font = UIFont.systemFont(ofSize: FONT_SIZE * scale)
//        let size = text.size(withAttributes: [NSAttributedString.Key.font: font])
//        let textRadius = sqrt(size.height * size.height + size.width * size.width) / 2
//        let internalRadius = textRadius + MARGIN_SIZE * scale
//        let externalRadius = internalRadius + STROKE_SIZE * scale
//        let iconSize = CGSize(width: externalRadius * 2, height: externalRadius * 2)
//
//        UIGraphicsBeginImageContext(iconSize)
//        let ctx = UIGraphicsGetCurrentContext()!
//
//        ctx.setFillColor(UIColor.red.cgColor)
//        ctx.fillEllipse(in: CGRect(
//            origin: .zero,
//            size: CGSize(width: 2 * externalRadius, height: 2 * externalRadius)));
//
//        ctx.setFillColor(UIColor.white.cgColor)
//        ctx.fillEllipse(in: CGRect(
//            origin: CGPoint(x: externalRadius - internalRadius, y: externalRadius - internalRadius),
//            size: CGSize(width: 2 * internalRadius, height: 2 * internalRadius)));
//
//        (text as NSString).draw(
//            in: CGRect(
//                origin: CGPoint(x: externalRadius - size.width / 2, y: externalRadius - size.height / 2),
//                size: size),
//            withAttributes: [
//                NSAttributedString.Key.font: font,
//                NSAttributedString.Key.foregroundColor: UIColor.black])
//        let image = UIGraphicsGetImageFromCurrentImageContext()!
//        return image
//    }
//    
//    func onObjectAdded(with view: YMKUserLocationView) {
//        
//    }
//    
//    func onObjectRemoved(with view: YMKUserLocationView) {
//        
//    }
//    
//    func onObjectUpdated(with view: YMKUserLocationView, event: YMKObjectEvent) {
//        
//    }
//}
