//
//  KeyboardViewController.swift
//  CustomKeyboard
//
//  Created by Koray Gültürk on 08/10/14.
//  Copyright (c) 2014 Koray Gültürk. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController
{
    var nextKeyboardButton: UIButton!
    var deleteButton: UIButton!
    var hideKeyboardButton: UIButton!
    var customInterface: UIView!
    var siseBebe:UIImage!
    var siseEge:UIImage!
    var siseIst:UIImage!
    var siseKebap:UIImage!
    var siseTeveccu:UIImage!
    var siseUy:UIImage!
    var kapakBebe:UIImage!
    var kapakEge:UIImage!
    var kapakKebap:UIImage!
    var kapakTeveccu:UIImage!
    var kapakUy:UIImage!
    var collectionView:UICollectionView!
    var keyboardV:KeyboardV!
    
    override func updateViewConstraints()
    {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
    
        let bundle = NSBundle(forClass: self.dynamicType)
        var keyboardV = bundle.loadNibNamed("CustomKeyboardView", owner: nil, options: nil)[0] as KeyboardV
        
        self.view = keyboardV
        keyboardV.siseIcon.addTarget(self, action: "siseIconAction", forControlEvents: UIControlEvents.TouchUpInside)
        keyboardV.deleteButton.addTarget(self, action: "didTapDelete", forControlEvents: UIControlEvents.TouchUpInside)
        keyboardV.siseIconKebap.addTarget(self, action: "siseKebapAction", forControlEvents: UIControlEvents.TouchUpInside)
        keyboardV.siseIconTeveccu.addTarget(self, action: "siseTeveccuAction", forControlEvents: UIControlEvents.TouchUpInside)
        keyboardV.siseIconGari.addTarget(self, action: "siseGariAction", forControlEvents: UIControlEvents.TouchUpInside)
        keyboardV.siseIconUy.addTarget(self, action: "siseUyAction", forControlEvents: UIControlEvents.TouchUpInside)
        keyboardV.kapakIconUy.addTarget(self, action: "kapakIconUyAction", forControlEvents: UIControlEvents.TouchUpInside)
        keyboardV.kapakIcon.addTarget(self, action: "kapakIconAction", forControlEvents: UIControlEvents.TouchUpInside)
        keyboardV.kapakIcon2.addTarget(self, action: "kapakIcon2Action", forControlEvents: UIControlEvents.TouchUpInside)
        keyboardV.kapakIcon3.addTarget(self, action: "kapakIcon3Action", forControlEvents: UIControlEvents.TouchUpInside)
        keyboardV.kapakIcon4.addTarget(self, action: "kapakIcon4Action", forControlEvents: UIControlEvents.TouchUpInside)
        
        addKeyboardButtons()
    }
    
    func siseUyAction()
    {
        var pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.persistent = true
        pasteboard.image = siseUy
    }
    
    func siseGariAction()
    {
        var pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.persistent = true
        pasteboard.image = siseEge
    }
    
    func kapakIconUyAction()
    {
        var pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.persistent = true
        pasteboard.image = kapakUy
    }
    
    func kapakIcon2Action()
    {
        var pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.persistent = true
        pasteboard.image = kapakEge
    }
    
    func kapakIcon3Action()
    {
        var pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.persistent = true
        pasteboard.image = kapakKebap
    }
    
    func kapakIcon4Action()
    {
        var pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.persistent = true
        pasteboard.image = kapakTeveccu
    }
    
    func kapakIconAction()
    {
        var pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.persistent = true
        pasteboard.image = kapakBebe
    }
    
    func siseTeveccuAction()
    {
        var pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.persistent = true
        pasteboard.image = siseTeveccu
    }
    
    func siseKebapAction()
    {
        var pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.persistent = true
        pasteboard.image = siseKebap
    }
    
    func siseIconAction()
    {
        var pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.persistent = true
        pasteboard.image = siseBebe
    }
    
    func addKeyboardButtons()
    {
        siseBebe = UIImage(named: "bebe_yazi.png")
        siseEge = UIImage(named: "gari_yazi.png")
        siseKebap = UIImage(named: "kebap_yazi.png")
        siseTeveccu = UIImage(named: "tevecunuz_yazi.png")
        siseUy = UIImage(named: "uy_yazi.png")
        
        kapakBebe = UIImage(named: "bebe_yazi_2.png")
        kapakEge = UIImage(named: "gari_yazi_2.png")
        kapakKebap = UIImage(named: "kebap_yazi_2.png")
        kapakTeveccu = UIImage(named: "tevecunuz_yazi2.png")
        kapakUy = UIImage(named: "uy_yazi_2.png")
        
        addNextKeyboardButton()
        addHideKeyboardButton()
    }
    
    func addNextKeyboardButton()
    {
        nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        
        nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        nextKeyboardButton.sizeToFit()
        nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        view.addSubview(nextKeyboardButton)
        
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: +10.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item:nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -10.0)
        view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }
    
    func addHideKeyboardButton()
    {
        hideKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        
        hideKeyboardButton.setTitle("Hide Keyboard", forState: .Normal)
        hideKeyboardButton.sizeToFit()
        hideKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        hideKeyboardButton.addTarget(self, action: "dismissKeyboard", forControlEvents: .TouchUpInside)
        
        view.addSubview(hideKeyboardButton)
        
        var rightSideConstraint = NSLayoutConstraint(item: hideKeyboardButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -10.0)
        var bottomConstraint = NSLayoutConstraint(item: hideKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -10.0)
        view.addConstraints([rightSideConstraint, bottomConstraint])
    }
    
    func didTapDelete()
    {
        var proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.deleteBackward()
    }
   
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func textWillChange(textInput: UITextInput)
    {
        
    }
    
    override func textDidChange(textInput: UITextInput)
    {
        var textColor: UIColor
        var proxy = textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
}

struct Position
{
    var x:CGFloat
    var y:CGFloat
}

