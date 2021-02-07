//
//  OnboardingPageView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//

import UIKit

enum OnboardingSteps: CaseIterable {
    case StepOne
    case StepTwo
    case StepThree
    
    var storyboardId: String{
        switch self {
        case .StepOne:
            return "OnboardingStepOne"
        case .StepTwo:
            return "OnboardingStepTwo"
        case .StepThree:
            return "OnboardingStepThree"
        }
    }
    
    var id: Int{
        switch self {
        case .StepOne:
            return 0
        case .StepTwo:
            return 1
        case .StepThree:
            return 2
        }
    }
}

class OnboardingView: UIPageViewController {
    
    // MARK: Properties
    var presenter: OnboardingPresenterProtocol?
    lazy var firstStepViewController = {
        return stepsViewControllers.first as! UIViewController
    }()
    private var currentIndex: Int = 0
    private var steps:[OnboardingSteps] = OnboardingSteps.allCases
    private var stepsViewControllers = [OnboardingStepProtocol]()
    private let numberOfViews = 3
    
    // MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.presenter?.viewDidLayoutSubviews()
    }
    
}

extension OnboardingView: OnboardingViewProtocol {
    // TODO: implement view output methods
    func setUpViews(){
        if let stepOne = OBStepOneWireFrame.createOBStepOneModule(step: .StepOne) as? OnboardingStepProtocol {
            stepsViewControllers.append(stepOne)
        }
        
        if let stepTwo = OBStepTwoWireFrame.createOBStepTwoModule(step: .StepTwo) as? OnboardingStepProtocol {
            stepsViewControllers.append(stepTwo)
        }
        
        if let stepThree = OBStepThreeWireFrame.createOBStepThreeModule(step: .StepThree) as? OnboardingStepProtocol {
            stepsViewControllers.append(stepThree)
        }
        self.setViewControllers([firstStepViewController], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }
    
    /// corrects scrollview frame to allow for full-screen view controller pages
    func fixLayoutSubviews(){
        for subView in self.view.subviews {
            if subView is UIScrollView {
                subView.frame = self.view.bounds
            }
        }
        super.viewDidLayoutSubviews()
    }
}

// MARK: UIPageViewControllerDataSource
extension OnboardingView: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let stepViewController = viewController as? OnboardingStepProtocol
        
        guard var currentIndex = stepViewController?.index else {
            return nil
        }
        
        self.currentIndex = currentIndex
        
        if currentIndex == 0 {
            return nil
        }
        
        currentIndex -= 1
        
        return stepsViewControllers[currentIndex] as? UIViewController
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let stepViewController = viewController as? OnboardingStepProtocol
        
        guard var currentIndex = stepViewController?.index else {
            return nil
        }
        
        self.currentIndex = currentIndex
        
        if currentIndex == self.stepsViewControllers.count - 1 {
            return nil
        }
        
        currentIndex += 1
        
        return stepsViewControllers[currentIndex] as? UIViewController
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.stepsViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.currentIndex
    }
}

