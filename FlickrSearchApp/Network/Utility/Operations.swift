//
//  Operations.swift
//  FlickrSearchApp
//
//  Created by Aman Taneja on 14/09/19.
//  Copyright © 2019 Aman Taneja. All rights reserved.
//

import Foundation

//Overriden Operation class to provide access to states of an operation. Can be used to monitor the current state in which an operation is.
class Operations: Operation {

    private var downloadURL: URL!
    
    override var isAsynchronous: Bool {
        get {
            return  true
        }
    }
    private var _executing = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isExecuting: Bool {
        return _executing
    }
    
    private var _finished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            didChangeValue(forKey: "isFinished")
        }
    }
    
    override var isFinished: Bool {
        return _finished
    }
    
    func executing(_ executing: Bool) {
        _executing = executing
    }
    
    func finish(_ finished: Bool) {
        _finished = finished
    }
    
    
    required init(downloadURL: URL) {
        self.downloadURL = downloadURL
    }
    
    override func main() {
        guard isCancelled == false else {
            finish(true)
            return
        }
        self.executing(true)
        //Asynchronous logic (eg: n/w calls) with callback
        
        self.performDownloadTask()
    }
    
    func performDownloadTask() {
        
        let downloadTask = URLSession.shared.downloadTask(with: self.downloadURL) { (location, response, error) in
            if let locationUrl = location, let _ = try? Data(contentsOf: locationUrl){
                
            }
            self.finish(true)
            self.executing(false)
        }
        downloadTask.resume()
    }
    
    
}

