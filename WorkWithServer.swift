//
//  File.swift
//  Cursometr
//
//  Created by test on 12.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

struct Ranges{
    let sourceBuyPriceNow:Double
    let sourceSalePriceNow:Double
    
    init(sourceBuyPriceNow: Double, sourceSalePriceNow:Double){
        self.sourceSalePriceNow = sourceSalePriceNow
        self.sourceBuyPriceNow = sourceBuyPriceNow
    }
}

struct Source{
    let sourceId:Int
    let sourceName: String
    let sourceRanges:[Ranges]
   
    init(sourceId:Int, sourceName:String, sourceRanges:[Ranges]){
        self.sourceId = sourceId
        self.sourceName = sourceName
        self.sourceRanges = sourceRanges
        
        //print(self)
    }
    
}

struct subscribedDataStruct{
    let currencyId:Int
    let currencyName: String
    let currencyFullName: String
    let arrayOfSources: [Source]
    
    init(currencyId:Int, currencyName:String, currencyFullName: String, arrayOfSources: [Source]){
        self.currencyId = currencyId
        self.currencyName = currencyName
        self.currencyFullName = currencyFullName
        self.arrayOfSources = arrayOfSources
    }
}

struct WorkWithServer {

    static let authorizationRequestPath = "http://currency.btc-solutions.ru:8080/Api/Account"
    static let currencyListPath = "http://currency.btc-solutions.ru:8080/api/CurrencyList"
    static let subsribedCurrencyList = "http://currency.btc-solutions.ru:8080/api/CurrencySubscription?Lang=0"
    
    enum SerializationError:Error{
        case missing(String)
        case invalid(String,Any)
    }
    
    
    static func getSubscribedData(OnSuccess: @escaping ([subscribedDataStruct]) -> ()) -> (){
        
        let url = subsribedCurrencyList
        
        let jar = HTTPCookieStorage.shared
        let cookieHeaderField = ["Set-Cookie": "key=value"]
        let cookies = HTTPCookie.cookies(withResponseHeaderFields: cookieHeaderField, for: URL(string:url)!)
        jar.setCookies(cookies, for: URL(string:url)!, mainDocumentURL: URL(string:url)!)
        var dataArray:[subscribedDataStruct] = []
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        var sourceDataArray:[Source] = []
        var rangesArray:[Ranges] = []
        let task = URLSession.shared.dataTask(with: request){(data:Data?, response:URLResponse?, error:Error?) in
            if let data = data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        //print(json)
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
                                                rangesArray.append(Ranges.init(sourceBuyPriceNow: sourceBuyPriceNow!, sourceSalePriceNow: sourceSalePriceNow!))
                                                
                                            }
                                            sourceDataArray.append(Source.init(sourceId: sourceId!, sourceName: sourceName!, sourceRanges:rangesArray))
                                            rangesArray = []
                                        }
                                    }
                                    dataArray.append(subscribedDataStruct.init(currencyId: subId!, currencyName: name!, currencyFullName: fullName!, arrayOfSources: sourceDataArray))

                                    sourceDataArray = []
                                }
                            }
                        }
                        
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
                OnSuccess(dataArray)
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
  
static func getAllDataFromServer(){
    let url = currencyListPath
    let parameters =  ["geoFilter": ["geoIds": []],"lang": 0] as [String : Any]
    let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])

    
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
                    print(json)
                }
            }
            catch{
                print(error.localizedDescription)
            }
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
