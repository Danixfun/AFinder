//
//  MapRemoteDataManager.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation




class MapRemoteDataManager:MapRemoteDataManagerInputProtocol {
    
    // MARK: Properties
    var remoteRequestHandler: MapRemoteDataManagerOutputProtocol?
    var token = ""
    var tokenHttpBody: Data {
        Data("grant_type=client_credentials&client_id=\(client_id)&client_secret=\(client_secret)".utf8)
    }
    var bearer: String {
        "Bearer \(token)"
    }
    
    /// Normally, we get both clientId and clientSecret from an external server. In this case - and to speed up testing - I have included them here. Please use them with maturity.
    let client_id = "FmoKSdrMksCAoAAxTaWhF0FmXubXuZWr"
    let client_secret = "5v5AAlWUYEdPM5F5"
    let session = URLSession.shared
    
    
    
    // MARK: Functions
    func findAirports() {
        self.requestToken(completion: {token in
            // Do something with the token
            if let foundToken = token{
                self.token = foundToken
                self.fetchAirports(completion: {airports in
                    if let foundAirports = airports {
                        //
                    }
                    else{

                    }
                })
            }
            else{
                // return error to interactor
            }
        })
    }
    
    private func fetchAirports(completion: @escaping ([Airport]?)->Void){
        
        var url = URLComponents(string: "https://test.api.amadeus.com/v1/reference-data/locations/airports")!
        url.queryItems = [
            URLQueryItem(name: "latitude", value: "32.728295"),
            URLQueryItem(name: "longitude", value: "-117.069553"),
            URLQueryItem(name: "radius", value: "500")
        ]
  
        var request = URLRequest(url: url.url!)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        request.setValue(self.bearer, forHTTPHeaderField: "authorization")
        
        session.dataTask(with: request){(data, response, error) in
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                print("An error has ocurred while fetching token: \(error!)")
                completion?(nil)
                return
            }
            
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let airportData = try decoder.decode(Airport.self, from: data)
                    print(airportData)
                }
                catch{
                    print("Error parsing json: \(error.localizedDescription)")
                    completion?(nil)
                }
            }
            else{
                print("Error en respuesta del servidor: \(response.statusCode)")
                completion?(nil)
            }
            
        }.resume()
        
        
    }
    
    // MARK: Private functions
    private func requestToken(completion: @escaping (String?)->Void) {
        var request = URLRequest(url: URL(string: "https://test.api.amadeus.com/v1/security/oauth2/token")!)
        
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        request.httpBody = self.tokenHttpBody
        
        session.dataTask(with: request){(data, response, error) in
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                print("An error has ocurred while fetching token: \(error!)")
                completion(nil)
                return
            }
            
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let token = try decoder.decode(Token.self, from: data)
                    completion(token.access_token)
                }
                catch{
                    print("Error parsing json: \(error.localizedDescription)")
                    completion(nil)
                }
            }
            else{
                print("Error en respuesta del servidor: \(response.statusCode)")
                completion(nil)
            }
            
        }.resume()
        
    }
    
}
