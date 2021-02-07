//
//  OBStepTwoView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

class OBStepTwoView: UIViewController, OnboardingStepProtocol {
    
    // MARK: Properties
    var presenter: OBStepTwoPresenterProtocol?
    var index: Int = 0
    var rangleCircle = RangeCircleView()
    var currentRange: Int = 10
    var currentRangeString: String {
        if currentRange == 1 {
            return "\(currentRange) km"
        }
        return "\(currentRange) kms"
    }
    
    // MARK: IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var rangeAnalogyView: UIView!
    @IBOutlet weak var rangeSlider: UISlider!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var nextButton: AFPrimaryButton!
    
    // MARK: IBAction
    @IBAction func rangeDidChange(_ sender: Any) {
        self.presenter?.rangeDidChange(sender: sender as! UISlider)
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.presenter?.viewDidLayoutSubviews()
    }
}

extension OBStepTwoView: OBStepTwoViewProtocol {
    // TODO: implement view output methods
    func setUpViews() {
        rangleCircle = RangeCircleView(frame: rangeAnalogyView.bounds, circleRadius: CGFloat(currentRange))
        rangeAnalogyView.addSubview(rangleCircle)
        rangleCircle.setNeedsDisplay()
        rangeAnalogyView.setNeedsDisplay()
    }
    
    func loadCurrentRange() {
        rangeSlider.value = Float(currentRange)
        self.rangeLabel.text = currentRangeString
    }
    
    func updateRangeView(km: Int, circleRadius: CGFloat) {
        self.currentRange = km
        self.rangeLabel.text = currentRangeString
        self.rangleCircle.circleRadius = circleRadius
    }
}

extension OBStepTwoView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


class RangeCircleView: UIView {
    
    // MARK: Properties
    var circleRadius:CGFloat = 10 {
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    lazy var circleSizes: [CGFloat] = {
        var temp = [CGFloat]()
        for i in (0...20).reversed(){
            temp.append(CGFloat(i+2))
        }
        return temp
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    init(frame: CGRect, circleRadius: CGFloat) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        self.circleRadius = circleRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Get the Graphics Context
        if let context = UIGraphicsGetCurrentContext() {
            
            // Set the circle outerline-width
            context.setLineWidth(5.0);
            
            // Set the circle outerline-colour
            context.setStrokeColor(UIColor.systemRed.cgColor)
            
            // Create Circle
            let center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
            let radius = (frame.size.width - 10) / circleSizes[Int(circleRadius)]
            context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
                
            // Draw
            context.strokePath()
        }
    }
    
    
    
}
