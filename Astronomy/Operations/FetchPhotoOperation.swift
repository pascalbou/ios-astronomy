//
//  FetchPhotoOperation.swift
//  Astronomy
//
//  Created by krikaz on 5/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class FetchPhotoOperation: ConcurrentOperation {
    var photoReference: MarsPhotoReference?
    var image: UIImage?
    private var dataTask = URLSessionDataTask()
    
    init(photoReference: MarsPhotoReference) {
        self.photoReference = photoReference
    }
    
    override func start() {
        state = .isExecuting
        
        guard let url = photoReference?.imageURL.usingHTTPS else { return }
        
        dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                NSLog("Error loading image: \(error)")
                return
            }
            
            if let data = data {
                self.image = UIImage(data: data)
                self.state = .isFinished
            }
        }
        dataTask.resume()

    }
    
    override func cancel() {
        dataTask.cancel()
    }

}
