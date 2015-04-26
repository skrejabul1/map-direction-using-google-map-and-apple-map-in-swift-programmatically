//
//  UIView+LayoutHelper.swift

//  MyMapDirection
//
//  Created by Click Labs132 on 25/03/15.
//  Copyright (c) 2015 ClickLabs. All rights reserved.
//
import Foundation
import UIKit

/**
Extension of UIView for AutoLayout helper methods
*/
extension UIView {
    
    
    // Mark: - Fill
    
    func fillSuperView(edges: UIEdgeInsets) -> [NSLayoutConstraint] {
        
        var topConstraint: NSLayoutConstraint = self.addTopConstraint(toView: self.superview, relation: .Equal, constant: edges.top)
        var leftConstraint: NSLayoutConstraint = self.addLeftConstraint(toView: self.superview, relation: .Equal, constant: edges.left)
        var bottomConstraint: NSLayoutConstraint = self.addBottomConstraint(toView: self.superview, relation: .Equal, constant: edges.bottom)
        var rightConstraint: NSLayoutConstraint = self.addRightConstraint(toView: self.superview, relation: .Equal, constant: edges.right)
        
        return [topConstraint, leftConstraint, bottomConstraint, rightConstraint]
    }
    
    
    // MARK: - Left Constraints
    
    func addLeftConstraint(toView view: UIView?, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Left, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    func addLeftConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addLeftConstraint(toView: view, attribute: .Left, relation: relation, constant: constant)
    }
    
    
    // MARK: - Right Constraints
    
    func addRightConstraint(toView view: UIView?, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Right, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    func addRightConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addRightConstraint(toView: view, attribute: .Right, relation: relation, constant: constant)
    }
    
    
    // MARK: - Top Constraints
    
    func addTopConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addTopConstraint(toView: view, attribute: .Top, relation: relation, constant: constant)
    }
    
    func addTopConstraint(toView view: UIView?, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Top, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    func addTopMarginConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addTopMarginConstraint(toView: view, attribute: .TopMargin, relation: relation, constant: constant)
    }
    
    func addTopMarginConstraint(toView view: UIView?, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .TopMargin, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Bottom Constraints
    
    func addBottomConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addBottomConstraint(toView: view, attribute: .Bottom, relation: relation, constant: constant)
    }
    
    func addBottomConstraint(toView view: UIView?, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Bottom, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    func addBottomMarginConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .BottomMargin, toView: view, attribute: .Bottom, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    func addBottomMarginConstraint(toView view: UIView?, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addBottomConstraint(toView: view, attribute: .BottomMargin, relation: relation, constant: constant)
    }
    
    
    // MARK: - Center X Constraint
    
    func addCenterXConstraint(toView view: UIView?) -> NSLayoutConstraint {
        
        return self.addCenterXConstraint(toView: view, relation: .Equal, constant: 0)
    }
    
    func addCenterXConstraint(toView view: UIView?, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addCenterXConstraint(toView: view, relation: .Equal, constant: constant)
    }
    
    func addCenterXConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .CenterX, toView: view, attribute: .CenterX, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Center Y Constraint
    
    func addCenterYConstraint(toView view: UIView?) -> NSLayoutConstraint {
        
        return self.addCenterYConstraint(toView: view, relation: .Equal, constant: 0)
    }
    
    func addCenterYConstraint(toView view: UIView?, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addCenterYConstraint(toView: view, relation: .Equal, constant: constant)
    }
    
    func addCenterYConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .CenterY, toView: view, attribute: .CenterY, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: - Width Constraints
    
    func addWidthConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Width, toView: view, attribute: .Width, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    func addWidthConstraint(relation relation1: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addWidthConstraint(toView: nil, relation: relation1, constant: constant)
    }
    
    
    // MARK: - Height Constraints
    
    func addHeightConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Height, toView: view, attribute: .Height, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
        
    }
    
    func addHeightConstraint(relation relation1: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addHeightConstraint(toView: nil, relation: relation1, constant: constant)
    }
    
    
    // MARK: - Private
    
    private func createConstraint(attribute attr1: NSLayoutAttribute, toView: UIView?, attribute attr2: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: attr1,
            relatedBy: relation,
            toItem: toView?,
            attribute: attr2,
            multiplier: 1.0,
            constant: constant)
        
        return constraint
    }
}
