import Foundation
import UIKit
import PlaygroundSupport

public class Indomie: UIView {
    
    var frameWidth = 500
    var frameHeight = 500
    
    let introLabel = UILabel()
    
    let indomieImage = UIImageView()
    let doodleImage = UIImageView()
    let indonesiaImage = UIImageView()
    let priceTagImage = UIImageView()
    let starImage = UIImageView()
    let cookButton = UIButton()
    
    var instructionProcess = 0
    
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
        
        introLabel.text = "Hi! My Name is Alvin."
        introLabel.textColor = UIColor.black
        introLabel.frame = CGRect(x: 20, y: 35, width: 500, height: 50)
        introLabel.font = UIFont(name: "Arial", size: 20)
        introLabel.alpha = 0
        self.addSubview(introLabel)
        
        indomieImage.image = UIImage(named: "Indomie.png")
        indomieImage.frame = CGRect(x: 510, y: 80, width: 300, height: 300)
        indomieImage.contentMode = .scaleAspectFit
        indomieImage.alpha = 1
        self.addSubview(indomieImage)

        priceTagImage.image = UIImage(named: "pricetag.png")
        priceTagImage.frame = CGRect(x: 100, y: 320, width: 100, height: 100)
        priceTagImage.contentMode = .scaleAspectFit
        priceTagImage.alpha = 0
        self.addSubview(priceTagImage)
        
        starImage.image = UIImage(named: "5star.png")
        starImage.frame = CGRect(x: 250, y: 300, width: 130, height: 130)
        starImage.contentMode = .scaleAspectFit
        starImage.alpha = 0
        self.addSubview(starImage)
        
        cookButton.setTitle("Cook", for: .normal)
        cookButton.backgroundColor = UIColor.gray
        cookButton.frame = CGRect(x: 350, y: 420, width: 120, height: 50)
        cookButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        cookButton.layer.cornerRadius = 14.0
        cookButton.alpha = 0.0
        cookButton.addTarget(self, action: #selector(cookButtonPressed), for: .touchUpInside)
        self.addSubview(cookButton)
        cookButton.isHidden = true
                
        animateInstruction()
        setupIndonesia()
    }
    
    func setupIndonesia() {
        self.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        indonesiaImage.image = UIImage(named: "indonesia_map.png")
        indonesiaImage.frame = CGRect(x: 510, y: 0, width: 480, height: 480)
        indonesiaImage.contentMode = .scaleAspectFit
        indonesiaImage.alpha = 1
        self.addSubview(indonesiaImage)
    }
    
    func animateInstruction() {
        if(instructionProcess == 0) {
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 1
            })
            { (completion) in
                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (time) in
                    self.instructionProcess = 1
                    self.animateInstruction()
               })
           }
        }
        if(instructionProcess == 1) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 0
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 1
                self.introLabel.text = "I am from Indonesia."
                self.animateIndonesiaOnScreen()
            })
            { (completion) in
                Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: { (time) in
                    self.instructionProcess = 2
                    self.animateInstruction()
                    self.animateIndonesiaOffScreen()
                })
            }
        }
        if(instructionProcess == 2) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 0
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 1
                self.introLabel.text = "Today I will introduce one of my favorite food."
            })
            { (completion) in
                Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: { (time) in
                    self.instructionProcess = 3
                    self.animateInstruction()
                })
            }
        }
        if(instructionProcess == 3) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 0
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 1
                self.introLabel.text = "It is Indomie."
                self.animateIndomieOnScreen()
            })
            { (completion) in
                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (time) in
                    self.instructionProcess = 4
                    self.animateInstruction()
                })
            }
        }
        if(instructionProcess == 4) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 0
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 1
                self.introLabel.text = "Indomie is instant noodle produced by Indonesia."
            })
            { (completion) in
                Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: { (time) in
                    self.instructionProcess = 5
                    self.animateInstruction()
                })
            }
        }
        if(instructionProcess == 5) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 0
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 1
                self.introLabel.text = "At a cheap price, which is only $0.17."
                self.priceTagImage.alpha = 1
            })
            { (completion) in
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
                    self.instructionProcess = 6
                    self.animateInstruction()
                })
            }
        }
        if(instructionProcess == 6) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 0
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 1
                self.introLabel.text = "Indomie has a 5 star taste."
                self.starImage.alpha = 1
            })
            { (completion) in
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
                    self.instructionProcess = 7
                    self.animateInstruction()
                })
            }
        }
        
        if(instructionProcess == 7) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 0
                self.cookButton.isHidden = false
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.introLabel.alpha = 1
                self.introLabel.text = "Now I will teach you how to cook Indomie."
                self.priceTagImage.alpha = 0
                self.starImage.alpha = 0
                self.cookButton.alpha = 1
            })
        }
    }
    
    func animateIndonesiaOnScreen() {
        UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            self.indonesiaImage.frame = CGRect(x: 10, y: 0, width: 480, height: 480)
        }))
    }
    
    func animateIndonesiaOffScreen() {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            self.indonesiaImage.frame = CGRect(x: -510, y: 0, width: 480, height: 480)
        }))
    }
    
    func animateIndomieOnScreen() {
        UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            self.indomieImage.frame = CGRect(x: 100, y: 80, width: 300, height: 300)
        }))
    }
    
    @objc func cookButtonPressed(sender: UIButton) {
        self.removeFromSuperview()
        let unwrapView = Unwrap(scene: self)
        PlaygroundPage.current.liveView = unwrapView
    }
}
