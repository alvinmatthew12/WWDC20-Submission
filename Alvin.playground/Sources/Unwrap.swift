import Foundation
import UIKit
import PlaygroundSupport

public class Unwrap: UIView {
    
    var frameWidth = 500
    var frameHeight = 500
    
    let indomieLabel = UILabel()
    let openLabel = UILabel()
    let rightWrap = UIImageView()
    let leftWrap = UIImageView()
    let rawNoodleTop = UIImageView()
    let openButton = UIButton()
    let doodleImage = UIImageView()
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        doodleImage.image = UIImage(named: "doodle.png")
        doodleImage.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        doodleImage.contentMode = .scaleAspectFit
        doodleImage.alpha = 0.5
        self.addSubview(doodleImage)
        
        openLabel.text = "← Click here to open"
        openLabel.textColor = UIColor.black
        openLabel.frame = CGRect(x: 300, y: 0, width: frameWidth, height: frameHeight)
        openLabel.font = UIFont(name: "Arial", size: 18)
        openLabel.alpha = 1
        self.addSubview(openLabel)
        
        indomieLabel.text = "Let's open the indomie wrapper and see what is inside."
        indomieLabel.textColor = UIColor.black
        indomieLabel.frame = CGRect(x: 45, y: -200, width: frameWidth, height: frameHeight)
        indomieLabel.font = UIFont(name: "Arial", size: 18)
        indomieLabel.alpha = 1
        self.addSubview(indomieLabel)
        
        rawNoodleTop.image = UIImage(named: "toprawnoodle.png")
        rawNoodleTop.frame = CGRect(x: 80, y: 105, width: 280, height: 280)
        rawNoodleTop.contentMode = .scaleAspectFit
        rawNoodleTop.alpha = 1
        self.addSubview(rawNoodleTop)
        
        rightWrap.image = UIImage(named: "rightwrap.png")
        rightWrap.frame = CGRect(x: 30, y: 100, width: 300, height: 300)
        rightWrap.contentMode = .scaleAspectFit
        rightWrap.alpha = 1
        self.addSubview(rightWrap)

        leftWrap.image = UIImage(named: "leftwrap.png")
        leftWrap.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
        leftWrap.contentMode = .scaleAspectFit
        leftWrap.alpha = 1
        self.addSubview(leftWrap)
        
        openButton.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
        openButton.addTarget(self, action: #selector(openButtonPressed), for: .touchUpInside)
        self.addSubview(openButton)
    }
    
    func performAnimation() {
        UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: {
            self.indomieLabel.isHidden = false
            self.indomieLabel.alpha = 1
        }, completion: nil)
    }
    
    func openWrapper() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.openLabel.alpha = 0
            self.leftWrap.frame = CGRect(x: 150, y: 100, width: 300, height: 300)
            self.rawNoodleTop.frame = CGRect(x: 105, y: 105, width: 280, height: 280)
        })
        
        UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
            self.indomieLabel.alpha = 0
            self.rawNoodleTop.alpha = 0
            self.leftWrap.alpha = 0
            self.rightWrap.alpha = 0
        }) { (completion) in
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (time) in
                 self.nextScreen()
             })
        }
    }
    
    @objc func openButtonPressed(sender: UIButton) {
        openWrapper()
    }
    
    func nextScreen() {
        self.removeFromSuperview()
        let cookView = Cook(scene: self)
        PlaygroundPage.current.liveView = cookView
    }
    
}

