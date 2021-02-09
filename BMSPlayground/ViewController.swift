//
//  ViewController.swift
//  BMSPlayground
//
//  Created by Nemi Shah on 08/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var coloredView: UIView!
    var viewModel: ViewModel = ViewModel()
    var observerId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModelObserver()
    }
    
    private func setViewModelObserver() {
        observerId = viewModel.action.observe(observer: {
            [weak self] newValue, oldValue in
            
            switch (newValue) {
            
            case .noop:
                break
                
            case .redClicked:
                self?.setColor(color: UIColor(red: 0.93, green: 0.31, blue: 0.37, alpha: 1).cgColor)
            case .greenClicked:
                self?.setColor(color: UIColor(red: 0.2, green: 0.78, blue: 0.35, alpha: 1).cgColor)
            case .blueClicked:
                self?.setColor(color: UIColor(red: 0.3, green: 0.53, blue: 0.94, alpha: 1).cgColor)
            }
        })
    }
    
    private func setColor(color: CGColor) {
        UIView.animate(withDuration: 0.35, animations: {
            self.coloredView.layer.backgroundColor = color
        })
    }
    
    deinit {
        if let _observerId: Int = observerId {
            viewModel.action.removeObserver(forId: _observerId)
        }
    }
    
    @IBAction func redClicked() {
        viewModel.onRedClicked()
    }
    
    @IBAction func greenClicked() {
        viewModel.onGreenClicked()
    }
    
    @IBAction func blueClicked() {
        viewModel.onBlueClicked()
    }
}

