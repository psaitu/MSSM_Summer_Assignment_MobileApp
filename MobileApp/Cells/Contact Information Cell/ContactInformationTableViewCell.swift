
import UIKit
import MapKit

class ContactInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var addressLabelLine1: UILabel!
    @IBOutlet weak var addressLabelLine2: UILabel!
    
    var delegate:ContactActionsProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func didTapGetDirections(_ sender: Any) {
        delegate?.didTapDirections()
    }
    
    func configure(_ delegate:ContactActionsProtocol) {
        
        self.delegate = delegate
        
        let addressLine1 = "837/1, 7th Main Rd, HAL 2nd Stage, Appareddipalya, Indiranagar"
        let addressLine2 = "Bangalore, India"
        
        self.addressLabelLine1.text = addressLine1
        self.addressLabelLine2.text = addressLine2
        
        let center = CLLocationCoordinate2D(latitude: 12.9725606, longitude: 77.637827)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        self.mapView.setRegion(region, animated: true)
        self.mapView.addAnnotation(annotation)
    }
}
