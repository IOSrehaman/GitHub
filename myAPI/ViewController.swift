//
//  ViewController.swift
//  myAPI
//
//  Created by Admin on 7/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    var responseDictionary:[String:String]?
    override func viewDidLoad() {
            super.viewDidLoad()
  
            
        }
        
    @IBAction func buttonTapped(_ sender: Any) {
        fetchData()
    }
    func fetchData(){
        let object = URLSession.shared
       // let session = URLSession(configuration: .default)
        let url = URL(string: "https://api.jsonserve.com/h89D3-")
        var request = URLRequest(url:url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "accept")
        let task = object.dataTask(with: request) {  data, response, error in
            guard let data = data else {
                print("error occured while accessing data")
                return
        }
         
            do{
              
                let welcomeObject = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: String]
                print(welcomeObject!)
              DispatchQueue.main.async{
                    self.responseDictionary = welcomeObject
                    let value = self.responseDictionary
             if let message = value?["foo"] as? String {
                        self.myLabel.text = "welcome \(message)"
                    
                        
                    }
                }
           } catch {
            print("error in decoding data")
            
            }
        }
        task.resume()
    }
   
                
        }
    
    

