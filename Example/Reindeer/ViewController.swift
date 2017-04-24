//
//  ViewController.swift
//  Reindeer
//
//  Created by Evilcome on 12/04/2015.
//  Copyright (c) 2015 Evilcome. All rights reserved.
//

import UIKit
import Reindeer
import Kingfisher
import SnapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var anotherBannerWrap: UIView!
    var anotherBanner: BannerPageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        anotherBanner = BannerPageViewController()
        
        if let anotherBanner = anotherBanner {
            anotherBannerWrap.addSubview(anotherBanner.view)
            anotherBanner.view.snp.makeConstraints { (make) -> Void in
                make.edges.equalTo(self.anotherBannerWrap)
            }
            
            anotherBanner.interval = 3
            
            anotherBanner.placeholderImage = UIImage(named: "placeholder")
            
            anotherBanner.setRemoteImageFetche({ (imageView, url, placeHolderImage) -> Void in
                imageView.kf.setImage(with: URL(string: url)!, placeholder: placeHolderImage, options: nil, progressBlock: nil, completionHandler: nil)
            })
            
            anotherBanner.images = [
                "https://cdn-ifnotalk-com.alikunlun.com/images/3/cd/cbf38bc67d58fb61c42a14f6b468c.jpg",
                UIImage(named: "reindeer-1"),
                UIImage(named: "reindeer-2")
            ]
            
            anotherBanner.startRolling()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let banner = segue.destination as? BannerPageViewController {
            
            // (Optional) Set the rolling interval, 0 means no auto-rolling
            banner.interval = 5
            
            // (Optional) Set placeholder image
            banner.placeholderImage = UIImage(named: "placeholder")
            
            // (Optional, Need with Remote Images) Set remote image fetcher
            banner.setRemoteImageFetche({ (imageView, url, placeHolderImage) -> Void in
                imageView.kf.setImage(with: URL(string: url)!, placeholder: placeHolderImage, options: nil, progressBlock: nil, completionHandler: nil)
            })
            
            // (Need) Set images
            banner.images = [
                "https://cdn-ifnotalk-com.alikunlun.com/images/3/cd/cbf38bc67d58fb61c42a14f6b468c.jpg",
                UIImage(named: "reindeer-1"),
                UIImage(named: "reindeer-2")
            ]
            
            // (Optional) Set banner tapped hander
            banner.setBannerTapHandler({ (index) -> Void in
                print("banner with index \(index) tapped.")
            })
            
            // (Optional) Start auto rolling
            banner.startRolling()
        }
    }

}

