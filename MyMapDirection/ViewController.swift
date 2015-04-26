//
//  ViewController.swift
//  MyMapDirection
//
//  Created by Click Labs132 on 25/03/15.
//  Copyright (c) 2015 ClickLabs. All rights reserved.
//

import UIKit
import MapKit
var kMargin : CGFloat = 20

var tableview: UITableView = UITableView()
var textfieldTo:UITextField = UITextField()
var textfieldFrom:UITextField = UITextField()
var google:UIButton = UIButton()
var textView:UITextView = UITextView()
var textfieldToCurrentLocation:UITextField = UITextField()
var current : UILabel = UILabel()
var apple:UIButton = UIButton()
var manager = CLLocationManager()

class ViewController: UIViewController, UITextFieldDelegate, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
  var mapView:MKMapView? = MKMapView()
    var tableData = NSArray()
    var latdelta = CLLocationDegrees()
    var londelta = CLLocationDegrees()
    
    var mapManager = MapManager()
    
    var locationManager: CLLocationManager!

    convenience init(frame:CGRect)
    {
    self.init(nibName: nil, bundle: nil)
       
        mapView?.frame = CGRectMake(0, 70, 380, 300)
      
        view.addSubview(mapView!)
        

        tableview.frame = CGRectMake(0, 500, 380, 400)
        
        view.addSubview(tableview)
        
        textfieldTo.frame = CGRectMake(0, 420, 120, 20)
        textfieldTo.placeholder =  "To"
        
         view.addSubview(textfieldTo)
        
        textfieldFrom.frame = CGRectMake(150, 420, 120, 20)
        textfieldFrom.placeholder =  "From"
        
        view.addSubview(textfieldFrom)
        
        google.frame = CGRectMake(280, 420, 100, 20)
        google.backgroundColor = UIColor.grayColor()
        google.setTitle("Google", forState: .Normal)
        
        google.addTarget(self, action: "googlesearch:", forControlEvents: UIControlEvents.TouchUpInside)
        
        view.addSubview(google)
        
        
        textfieldToCurrentLocation.frame = CGRectMake(160, 460, 120, 20)
        textfieldToCurrentLocation.placeholder =  "To"
        
        view.addSubview(textfieldToCurrentLocation)
        
        current.frame = CGRectMake(0, 460, 120, 20)
       // textView.placeholder =  "Enter Start Point"
        current.text = "Current Location"
        
        view.addSubview(current)
        
        apple.frame = CGRectMake(280, 460, 100, 20)
        apple.backgroundColor = UIColor.grayColor()
        apple.setTitle("Apple", forState: .Normal)
        
        apple.addTarget(self, action: "applesearch:", forControlEvents: UIControlEvents.TouchUpInside)
        
        view.addSubview(apple)
        var mapch: UIButton = UIButton()
        mapch.frame = CGRectMake(20, 490, 100, 20)
        mapch.backgroundColor = UIColor.grayColor()
        mapch.setTitle("Apple", forState: .Normal)
        
        mapch.addTarget(self, action: "mavview", forControlEvents: UIControlEvents.TouchUpInside)
        
        view.addSubview(mapch)
        
        
        
    }
    func mavview() {
        if self.mapView?.mapType == MKMapType.Standard {
            self.mapView?.mapType = MKMapType.Satellite
            
            
        } else {
            self.mapView?.mapType = MKMapType.Standard
            
        }

    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let address = "Hello Rejabu"
        textfieldTo.delegate = self
        textfieldFrom.delegate = self
        textfieldToCurrentLocation.delegate = self
        
        manager.delegate = self
       
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        self.mapView?.delegate = self
        self.mapView?.showsUserLocation = true
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var Latitude:CLLocationDegrees =  22.705981
        var Longitude:CLLocationDegrees = 88.388498
        self.latdelta = 1
        londelta = 1
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latdelta, londelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(Latitude, Longitude )
        var resion:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
         self.mapView?.setRegion(resion, animated: true)
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Kolkata"
        //annotation.image = UIImage(named:"1.jpg")
         self.mapView?.addAnnotation(annotation)
        var value = UILongPressGestureRecognizer(target: self, action: "action:")
        value.minimumPressDuration = 2
        self.mapView?.addGestureRecognizer(value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is MKPolyline {
            var polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blueColor()
            polylineRenderer.lineWidth = 5
            println("done")
            return polylineRenderer
        }
        
        return nil
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return tableData.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "direction")
        
        var idx:Int = indexPath.row
        
        
        var dictTable:NSDictionary = tableData[idx] as NSDictionary
        var instruction = dictTable["instructions"] as NSString
        var distance = dictTable["distance"] as NSString
        var duration = dictTable["duration"] as NSString
        var detail = "distance:\(distance) duration:\(duration)"
        
        
        cell.textLabel?.text = instruction
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = UIFont(name: "Helvetica Neue Light", size: 15.0)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        //cell.textLabel.font=  [UIFont fontWithName:"Helvetica Neue-Light" size:15];
        cell.detailTextLabel!.text = detail
        
        
        return cell
    }
    
    func googlesearch(sender: UIButton) {
        var origin = textfieldFrom.text
        var destination =  textfieldTo.text
        origin = origin?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        destination = destination?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if(origin == nil || (countElements(origin!) == 0) || destination == nil || countElements(destination!) == 0)
        {
            
            println("enter to and from")
            return
        }
        self.view.endEditing(true)
        
        mapManager.directionsUsingGoogle(from: origin!, to: destination!) { (route,directionInformation, boundingRegion, error) -> () in
            
            if(error != nil){
                
                println(error)
            }else{
                
                var pointOfOrigin = MKPointAnnotation()
                pointOfOrigin.coordinate = route!.coordinate
                pointOfOrigin.title = directionInformation?.objectForKey("start_address") as NSString
                pointOfOrigin.subtitle = directionInformation?.objectForKey("duration") as NSString
                
                var pointOfDestination = MKPointAnnotation()
                pointOfDestination.coordinate = route!.coordinate
                pointOfDestination.title = directionInformation?.objectForKey("end_address") as NSString
                pointOfDestination.subtitle = directionInformation?.objectForKey("distance") as NSString
                
                var start_location = directionInformation?.objectForKey("start_location") as NSDictionary
                var originLat = start_location.objectForKey("lat")?.doubleValue
                var originLng = start_location.objectForKey("lng")?.doubleValue
                
                var end_location = directionInformation?.objectForKey("end_location") as NSDictionary
                var destLat = end_location.objectForKey("lat")?.doubleValue
                var destLng = end_location.objectForKey("lng")?.doubleValue
                
                var coordOrigin = CLLocationCoordinate2D(latitude: originLat!, longitude: originLng!)
                var coordDesitination = CLLocationCoordinate2D(latitude: destLat!, longitude: destLng!)
                
                pointOfOrigin.coordinate = coordOrigin
                pointOfDestination.coordinate = coordDesitination
                if let web = self.mapView {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        web.addOverlay(route!)
                        web.addAnnotation(pointOfOrigin)
                        web.addAnnotation(pointOfDestination)
                        web.setVisibleMapRect(boundingRegion!, animated: true)
                        tableview.delegate = self
                        tableview.dataSource = self
                        self.tableData = directionInformation?.objectForKey("steps") as NSArray
                        tableview.reloadData()
                        
                    }
                    
                }
                
            }
        }

    }
    
    func applesearch(sender: UIButton) {
        
        var destination =  textfieldToCurrentLocation.text
        
        if(destination == nil || countElements(destination!) == 0)
        {
            
            println("enter to and from")
            return
        }
        
        self.view.endEditing(true)
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        
        if (locationManager.respondsToSelector(Selector("requestWhenInUseAuthorization"))) {
            
            locationManager.requestAlwaysAuthorization() // add in plist NSLocationAlwaysUsageDescription
            locationManager.requestWhenInUseAuthorization() // add in plist NSLocationWhenInUseUsageDescription
            
        }
        
        var location = self.mapView?.userLocation
        
        var from = location?.coordinate
        

    }
    func getDirectionsUsingApple() {
        
        var destination =  textfieldToCurrentLocation.text
        mapManager.directionsFromCurrentLocation(to: destination!) { (route, directionInformation, boundingRegion, error) -> () in
            
            if (error? != nil) {
                
                println(error!)
            }else{
                
                if let web = self.mapView? {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        
                        web.addOverlay(route!)
                        web.setVisibleMapRect(boundingRegion!, animated: true)
                        
                        tableview.delegate = self
                        tableview.dataSource = self
                        self.tableData = directionInformation?.objectForKey("steps") as NSArray
                        tableview.reloadData()
                        
                    }
                    
                }
            }
            
        }
        
        
    }

    func locationManager(manager: CLLocationManager!,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            var hasAuthorised = false
            var locationStatus:NSString = ""
            var verboseKey = status
            switch status {
            case CLAuthorizationStatus.Restricted:
                locationStatus = "Restricted Access"
            case CLAuthorizationStatus.Denied:
                locationStatus = "Denied access"
            case CLAuthorizationStatus.NotDetermined:
                locationStatus = "Not determined"
            default:
                locationStatus = "Allowed access"
                hasAuthorised = true
            }
            
            
            
            if(hasAuthorised == true){
                
                getDirectionsUsingApple()
                
            }else {
                
                println("locationStatus \(locationStatus)")
                
            }
            
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return true;
    }
    
    
   
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }


}

