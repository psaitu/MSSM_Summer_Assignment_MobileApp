//
//  InformationCardViewController.swift
//  MobileApp
//
//  Created by Prabhu Saitu on 8/16/18.
//  Copyright © 2018 Prabhu Saitu. All rights reserved.
//

import UIKit
import MapKit

protocol ContactActionsProtocol {
    func didTapDirections()
}

class InformationCardViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
        registerNibs()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLayoutSubviews() {
        
    }

    func registerNibs() {
        
        let brandingHeaderCell = UINib(nibName: "BrandingTableViewCell", bundle: nil)
        tableView.register(brandingHeaderCell, forCellReuseIdentifier: "BRANDING_HEADER")
        
        let imagesCell = UINib(nibName: "ImagesTableViewCell", bundle: nil)
        tableView.register(imagesCell, forCellReuseIdentifier: "IMAGES")
        
        let timingsCell = UINib(nibName: "TimingsTableViewCell", bundle: nil)
        tableView.register(timingsCell, forCellReuseIdentifier: "TIMINGS")
        
        let appointmentCell = UINib(nibName: "AppointmentTableViewCell", bundle: nil)
        tableView.register(appointmentCell, forCellReuseIdentifier: "APPOINTMENT")
        
        let contactInfoCell = UINib(nibName: "ContactInformationTableViewCell", bundle: nil)
        tableView.register(contactInfoCell, forCellReuseIdentifier: "CONTACT_INFO")
        
        let aboutCellNib = UINib(nibName: "InfoAboutTableViewCell", bundle: nil)
        tableView.register(aboutCellNib, forCellReuseIdentifier: "ABOUT")
        
    }

}

extension InformationCardViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let brandingCell = tableView.dequeueReusableCell(withIdentifier: "BRANDING_HEADER", for: indexPath) as! BrandingTableViewCell
            return brandingCell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ABOUT", for: indexPath) as! InfoAboutTableViewCell
            cell.configure()
            return cell
        case 2:
            let imagesCell = tableView.dequeueReusableCell(withIdentifier: "IMAGES", for: indexPath) as! ImagesTableViewCell
            return imagesCell
        case 3:
            let timingsCell = tableView.dequeueReusableCell(withIdentifier: "TIMINGS", for: indexPath) as! TimingsTableViewCell
            return timingsCell
        case 4:
            let appointmentCell = tableView.dequeueReusableCell(withIdentifier: "APPOINTMENT", for: indexPath) as! AppointmentTableViewCell
            return appointmentCell
        case 5:
            let contactInfoCell = tableView.dequeueReusableCell(withIdentifier: "CONTACT_INFO", for: indexPath) as! ContactInformationTableViewCell
            contactInfoCell.configure(self)
            return contactInfoCell
        default:
            return UITableViewCell()
        }
    }
}

extension InformationCardViewController: ContactActionsProtocol {
    func didTapDirections() {
        
        let coordinate = CLLocationCoordinate2DMake(12.9725606, 77.637827)
        let region = MKCoordinateRegionMake(coordinate, MKCoordinateSpanMake(0.01, 0.02))
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: region.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: region.span)]
        mapItem.name = "Pallavi Naidu"
        mapItem.openInMaps(launchOptions: options)
        
        
        
    }
}

extension InformationCardViewController : UITableViewDelegate {}
