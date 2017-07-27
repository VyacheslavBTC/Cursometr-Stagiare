//
//  File.swift
//  Cursometr
//
//  Created by test on 12.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

struct Ranges{
    let sourceBuyPriceNow: Double
    let sourceSalePriceNow: Double
    
    init(sourceBuyPriceNow: Double, sourceSalePriceNow: Double){
        self.sourceSalePriceNow = sourceSalePriceNow
        self.sourceBuyPriceNow = sourceBuyPriceNow
    }
}

struct SourceSubscribedData{
    let id: Int
    let name: String
    let ranges: [Ranges]
   
    init(id: Int, name: String, ranges: [Ranges]){
        self.id = id
        self.name = name
        self.ranges = ranges

    }
    
}
struct sourceCommonData{
    let id :Int
    let name: String
    let subscribed: Bool
    let geoId: String?
    let locationName: String?
    
    init(id: Int, name: String, subscribed: Bool, geoId:String? = nil, locationName:String? = nil){
        self.id = id
        self.name = name
        self.subscribed = subscribed
        self.geoId = geoId
        self.locationName = locationName
    }
}

struct allCurrenciesWithSources{
    let id: Int
    let name: String
    let fullName: String
    let enable: Bool
    let sources: [sourceCommonData]
    
    init(id:Int, name:String, fullName: String, sources: [sourceCommonData], enable: Bool){
        self.id = id
        self.name = name
        self.fullName = fullName
        self.enable = enable
        self.sources = sources
    }
}

struct subscribedDataStruct{
    let id: Int
    let name: String
    let fullName: String
    let sources: [SourceSubscribedData]
    
    init(id: Int, name: String, fullName: String, sources: [SourceSubscribedData]){
        self.id = id
        self.name = name
        self.fullName = fullName
        self.sources = sources
    }
}

public class ServerRequest {

    static let authorizationRequestPath = "http://currency.btc-solutions.ru:8080/Api/Account"
    static let currencyListPath = "http://currency.btc-solutions.ru:8080/api/CurrencyList"
    static let subsribedCurrencyList = "http://currency.btc-solutions.ru:8080/api/CurrencySubscription?Lang=0"
    
    
    enum SerializationError:Error{
        case missing(String)
        case invalid(String,Any)
    }
    
    
    static func obtainSubscribedData(OnSuccess: @escaping ([subscribedDataStruct]) -> ()) -> (){
        
        let url = subsribedCurrencyList
        
        let jar = HTTPCookieStorage.shared
        let cookieHeaderField = ["Set-Cookie": "key=value"]
        let cookies = HTTPCookie.cookies(withResponseHeaderFields: cookieHeaderField, for: URL(string:url)!)
        jar.setCookies(cookies, for: URL(string:url)!, mainDocumentURL: URL(string:url)!)
        var subscribedData:[subscribedDataStruct] = []
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        var sourceData:[SourceSubscribedData] = []
        var ranges:[Ranges] = []
        let task = URLSession.shared.dataTask(with: request){(data:Data?, response:URLResponse?, error:Error?) in
            if let data = data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        if let subscriptionCategories = json["subscriptionCategories"] as? [[String:Any]]{
                            
                            for var subItem in subscriptionCategories{
                                
                                let subId = subItem["id"] as? Int
                                let name = subItem["name"] as? String
                                let fullName = subItem["fullName"] as? String
                                
                                if let sourcesArray = subItem["sources"] as? [[String:Any]]{
                                    for var sourceItem in sourcesArray{
                                        
                                        let sourceId = sourceItem["id"] as? Int
                                        let sourceName = sourceItem["name"] as? String
                                        

                                        if let rangesItemArray = sourceItem["ranges"] as? [[String:Any]]{
                                            for var rangesItem in rangesItemArray{
                                                let sourceBuyPriceNow = rangesItem["buyPriceNow"] as? Double
                                                let sourceSalePriceNow = rangesItem["salePriceNow"] as? Double
                                                ranges.append(Ranges.init(sourceBuyPriceNow: sourceBuyPriceNow!, sourceSalePriceNow: sourceSalePriceNow!))
                                                
                                            }
                                            sourceData.append(SourceSubscribedData.init(id: sourceId!, name: sourceName!, ranges:ranges))
                                            ranges = []
                                        }
                                    }
                                    subscribedData.append(subscribedDataStruct.init(id: subId!, name: name!, fullName: fullName!, sources: sourceData))

                                    sourceData = []
                                }
                            }
                        }
                        
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
                OnSuccess(subscribedData)
            }
            
        }
        task.resume()
    }

    
    static func setCookies(response: URLResponse) {
        if let httpResponse = response as? HTTPURLResponse {
            if let headerFields = httpResponse.allHeaderFields as? [String: String] {
                let cookies = HTTPCookie.cookies(withResponseHeaderFields: httpResponse.allHeaderFields as! [String:String], for: response.url!)
                 for cookie in cookies {
                    HTTPCookieStorage.shared.setCookie(cookie)
                }
            }
        }
    }
  
static func obtainAllDataFromServer(OnSuccess: @escaping ([allCurrenciesWithSources]) -> ()) -> (){
    let url = currencyListPath
    let parameters =  ["geoFilter": ["geoIds": []],"lang": 0] as [String : Any]
    let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
    var sourcesList:[sourceCommonData] = []
    var currencyWithSources:[allCurrenciesWithSources] = []
    let jar = HTTPCookieStorage.shared
    let cookieHeaderField = ["Set-Cookie": "key=value"]
    let cookies = HTTPCookie.cookies(withResponseHeaderFields: cookieHeaderField, for: URL(string:url)!)
    jar.setCookies(cookies, for: URL(string:url)!, mainDocumentURL: URL(string:url)!)

    var request = URLRequest(url: URL(string: url)!)
    request.httpMethod = "POST"
    request.httpBody = httpBody
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.dataTask(with: request){(data:Data?, response:URLResponse?, error:Error?) in
        if let data = data{
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                    if let currencies = json["currencies"] as? [[String: Any]]{
                        
                        for var currency in currencies{
                            
                        let id  = currency["id"] as? Int
                        let name = currency["name"] as? String
                        let fullName = currency["fullName"] as? String
                        let enable = currency["enable"] as? Bool
                            
                        if let sources = currency["sources"] as? [[String: Any]]{
                            
                            for var source in sources{
                                
                            let sourceId = source["id"] as? Int
                            let name = source["name"] as? String
                            let subscribed = source["subscribed"] as? Bool
                            let geoId = source["geoId"] as? String
                            let locationName = source["locationName"] as? String
                                
                            sourcesList.append(sourceCommonData.init(id: sourceId!, name: name!, subscribed: subscribed!, geoId:geoId, locationName:locationName))
                                }
                            
                            }
                            currencyWithSources.append(allCurrenciesWithSources.init(id: id!, name: name!, fullName: fullName!, sources: sourcesList, enable: enable!))
                            sourcesList = []
                        }
                    }
                }
            }
            catch{
                print(error.localizedDescription)
            }
            OnSuccess(currencyWithSources)
        }
        
    }
    task.resume()
}


static func authorizationStart(onSuccess:@escaping () -> ()) ->() {
    
        let url = authorizationRequestPath
        let parameters = ["userId" : "12"]
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request){(data:Data?, response:URLResponse?, error:Error?) in
            if let data = data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        setCookies(response: response!)
                        print("asd")
                        onSuccess()
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            }
            
        }
        task.resume()

    }
}
