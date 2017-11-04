//
//  FindController.swift
//  payEphone
//
//  Created by 윤영채 on 2017. 11. 4..
//  Copyright © 2017년 윤영채. All rights reserved.
//

import UIKit
import GoogleMaps

class FindController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    @IBOutlet weak var getMyLocation: UIImageView!
    
    @IBOutlet weak var findTableView: UITableView!
    var datas = [FindData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMyLocation.layer.zPosition = 100
        getMyLocation.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(asdf)))
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        findTableView.dataSource = self
        findTableView.delegate = self
        
//        let border = CALayer()
//        let width = CGFloat(1.0)
//        border.borderColor = UIColor.darkGray.cgColor
//        border.frame = CGRect(x: 24, y: findTableView.frame.size.height - width, width:  findTableView.frame.size.width - 48, height : findTableView.frame.size.height)
//        border.borderWidth = width
//        findTableView.layer.addSublayer(border)
//        findTableView.layer.masksToBounds = true
        
        datas.append(FindData(image: "",title: "남영역점",content: "200m, 도보 5분거리"))
        datas.append(FindData(image: "",title: "남영역점",content: "200m, 도보 5분거리"))
        datas.append(FindData(image: "",title: "남영역점",content: "200m, 도보 5분거리"))
        datas.append(FindData(image: "",title: "남영역점",content: "200m, 도보 5분거리"))
        datas.append(FindData(image: "",title: "남영역점",content: "200m, 도보 5분거리"))
        datas.append(FindData(image: "",title: "남영역점",content: "200m, 도보 5분거리"))
        datas.append(FindData(image: "",title: "남영역점",content: "200m, 도보 5분거리"))
    }
    
    @objc func asdf(){
        locationManager.requestLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FindController: CLLocationManagerDelegate {
    
    
    func setMap(_ coord: CLLocationCoordinate2D){
        mapView.isMyLocationEnabled = true
        
        let camera = GMSCameraPosition.camera(withLatitude: coord.latitude, longitude: coord.longitude, zoom: 14)
        mapView.camera = camera
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let location = locations.last {
            NSLog("User lat: \(location.coordinate.latitude), lon: \(location.coordinate.longitude)")
            setMap(location.coordinate)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}
extension FindController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FindTableViewCell", for: indexPath) as! FindTableViewCell
        let data = datas[indexPath.row]
        
        cell.titleImage.image = UIImage(named: data.image)
        cell.title.text = data.title
        cell.content.text = data.content
        
        return cell
    }
}

extension FindController: UITableViewDelegate{
    
}

class FindTableViewCell: UITableViewCell {
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.layer.borderWidth = 0.0
        
        let border = CALayer()
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 24, y: self.bounds.size.height - 1.0, width: self.bounds.width - 48, height: 1.0)
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class FindData{
    public var image: String = ""
    public var title: String = ""
    public var content: String = ""
    
    init(image: String, title: String, content: String) {
        self.image = image
        self.title = title
        self.content = content
    }
}
