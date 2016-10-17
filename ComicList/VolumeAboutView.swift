//
//  VolumeAboutView.swift
//  ComicList
//
//  Created by Guillermo Gonzalez on 03/10/2016.
//  Copyright © 2016 Guillermo Gonzalez. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

/// Displays the volume description
final class VolumeAboutView: UIView {

    @IBOutlet weak var WebAbout: UIWebView!{
        didSet{
            WebAbout.backgroundColor = UIColor(named: .background)
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = NSLocalizedString("ABOUT", comment: "")
            titleLabel.textColor = UIColor(named: .darkText)
        }
    }

    @IBOutlet private weak var aboutLabel: UILabel! {
        didSet {
            aboutLabel.textColor = UIColor(named: .darkText)
        }
    }

    /// Bindable observer for the about text
    var about: AnyObserver<String?> {
        return aboutLabel.rx.text
    }
    
    var dataForWeb: AnyObserver<String?>{
        return UIBindingObserver(UIElement: WebAbout){ WebAbout, dataForWeb in
            
            guard let _ = dataForWeb else{
                return
            }
            
            
            
            WebAbout.loadHTMLString(dataForWeb!, baseURL: nil)
            WebAbout.scrollView.isScrollEnabled = true
        }.asObserver()
    }

    
   
    
    
}
