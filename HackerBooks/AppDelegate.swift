//
//  AppDelegate.swift
//  HackerBooks
//
//  Created by Ramiro García Salazar on 29/11/15.
//  Copyright © 2015 Ramiro García Salazar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var bibilioteca: Library?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        tddPaPobres()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func tddPaPobres(){
        
        if let urlImage = NSURL(string: "https://en.wikipedia.org/wiki/Darth_Vader"),
            urlPDF = NSURL(string: "https://en.wikipedia.org/wiki/Darth_Vader"){
        
                let libro = Book(title: "titulo", authors: ["autor", "Autor2"], tags: ["tag1","tag2"], urlImage: urlImage, urlPDF: urlPDF)
                
                print(libro)
        }
        
        do{
            if let url = NSURL(string: Library.URL_JSON),
            data = NSData(contentsOfURL: url),
            libros = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray
            {
                bibilioteca = Library(books: decode(bookArray: libros))
                
                print("countBooks -> \(bibilioteca?.countBooks)")
                print("bookCountForTag -> \(bibilioteca?.bookCountForTag("data mining"))")
                print("booksForTag -> \(bibilioteca?.booksForTag("data mining"))")
                print("countBooks -> \(bibilioteca?.countBooks)")
                
            }
        }catch{
            print("Error: Parseando el JSON")
        }
    }
}

