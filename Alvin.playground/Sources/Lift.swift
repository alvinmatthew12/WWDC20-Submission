import Foundation
import UIKit
import PlaygroundSupport

public class Lift: UIView {
    
    var frameWidth = 500
    var frameHeight = 500
    
    let instructionLabel = UILabel()
    
    let stoveBodyImage = UIImageView()
    let stoveButtonOff = UIButton()
    let stoveButtonOn = UIButton()
    
    let boiledWaterPanImage = UIImageView()
    let noodlePanImage = UIImageView()
    let drainerImage = UIImageView()
    let noodleDrainerImage = UIImageView()
    let doodleImage = UIImageView()
    
    let drainerFrame = CGRect(x: 50, y: 50, width: 140, height: 140)
    
    let panBody = UIView()
    
    var isDraggingBlock = 0
    var cookingProcess = 0
    
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
        
        instructionLabel.text = "The noodle is ready!"
        instructionLabel.textColor = UIColor.black
        instructionLabel.frame = CGRect(x: 45, y: -220, width: frameWidth, height: frameHeight)
        instructionLabel.font = UIFont(name: "Arial", size: 18)
        instructionLabel.alpha = 0
        instructionLabel.isHidden = true
        self.addSubview(instructionLabel)
        
        stoveBodyImage.image = UIImage(named: "stovebody.png")
        stoveBodyImage.frame = CGRect(x: -300, y: 305, width: 220, height: 180)
        stoveBodyImage.contentMode = .scaleAspectFit
        stoveBodyImage.alpha = 1
        self.addSubview(stoveBodyImage)
        
        stoveButtonOff.setImage(UIImage(named: "stovebuttonoff.png"), for: .normal)
        stoveButtonOff.frame = CGRect(x: 208, y: 410, width: 30, height: 40)
        stoveButtonOff.isEnabled = false
        stoveButtonOff.isHidden = true
        self.addSubview(stoveButtonOff)
        
        stoveButtonOn.setImage(UIImage(named: "stovebuttonon.png"), for: .normal)
        stoveButtonOn.frame = CGRect(x: -300, y: 410, width: 30, height: 40)
        stoveButtonOn.isEnabled = false
        self.addSubview(stoveButtonOn)
        
        noodlePanImage.image = UIImage(named: "noodlepan.png")
        noodlePanImage.frame = CGRect(x: -300, y: 220, width: 180, height: 180)
        noodlePanImage.contentMode = .scaleAspectFit
        noodlePanImage.alpha = 1
        self.addSubview(noodlePanImage)
        
        boiledWaterPanImage.image = UIImage(named: "boiledwaterpan.png")
        boiledWaterPanImage.frame = CGRect(x: 150, y: 220, width: 180, height: 180)
        boiledWaterPanImage.contentMode = .scaleAspectFit
        boiledWaterPanImage.alpha = 0
        boiledWaterPanImage.isHidden = true
        self.addSubview(boiledWaterPanImage)
        
        drainerImage.image = UIImage(named: "drainer.png")
        drainerImage.frame = CGRect(x: 50, y: 50, width: 140, height: 140)
        drainerImage.contentMode = .scaleAspectFit
        drainerImage.alpha = 0
        drainerImage.isHidden = true
        self.addSubview(drainerImage)
        
        noodleDrainerImage.image = UIImage(named: "noodledrainer.png")
        noodleDrainerImage.frame = CGRect(x: 50, y: 50, width: 140, height: 140)
        noodleDrainerImage.contentMode = .scaleAspectFit
        noodleDrainerImage.alpha = 0
        noodleDrainerImage.isHidden = true
        self.addSubview(noodleDrainerImage)
        
        panBody.frame = CGRect(x: 157, y: 282, width: 133, height: 120)
        panBody.contentMode = .scaleAspectFit
        self.addSubview(panBody)
        
        animateInstruction()
    }
    
    func animatePanOnScreen() {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            self.noodlePanImage.frame = CGRect(x: 150, y: 220, width: 180, height: 180)
            self.stoveButtonOn.frame = CGRect(x: 208, y: 410, width: 30, height: 40)
            self.stoveBodyImage.frame = CGRect(x: 115, y: 305, width: 220, height: 180)
        }))
    }
    
    func animateInstruction() {
        if(cookingProcess == 0) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.isHidden = false
                self.instructionLabel.alpha = 1
                self.animatePanOnScreen()
            }) { (completion) in
                Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: { (time) in
                   self.cookingProcess = 1
                   self.animateInstruction()
               })
           }
        }
        if(cookingProcess == 1) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Now, lift the noodles from the pan."
                self.drainerImage.isHidden = false
                self.drainerImage.alpha = 1
            }){ (completion) in
                 Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (time) in
                    self.cookingProcess = 2
                    self.animateInstruction()
                })
            }
        }
        if(cookingProcess == 2) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Drag the drainer to the pan."
            }, completion: nil)
        }
        if(cookingProcess == 3) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Well done."
            }) { (completion) in
              Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
                  self.animatePanOffScreen()
              })
            }
        }
    }
    
    func animatePanOffScreen() {
        noodlePanImage.isHidden = true
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            self.boiledWaterPanImage.center.x = self.frame.midX/2 - 300
            self.stoveButtonOff.center.x = self.frame.midX/2 - 300
            self.stoveBodyImage.center.x = self.frame.midX/2 - 300
        }), completion:{ (completion) -> Void in
            Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(self.nextScreen), userInfo: nil, repeats: false)
        })
    }
    
    func animateBoiledPan() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.boiledWaterPanImage.isHidden = false
            self.boiledWaterPanImage.alpha = 1
        }, completion: nil)
    }
    
    @objc func checkingForMatch() {
        if drainerImage.frame.intersects(panBody.frame) {
            if(cookingProcess == 2) {
                self.putSound()
                drainerImage.isHidden = true
                noodleDrainerImage.isHidden = false
                noodleDrainerImage.alpha = 1
                cookingProcess = 3
                switchStoveButtonOff()
                animateBoiledPan()
                animateInstruction()
            } else {
                drainerImage.frame = drainerFrame
            }
        } else {
            drainerImage.frame = drainerFrame
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if drainerImage.frame.contains(location) {
                isDraggingBlock = 1
                drainerImage.center = location
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if drainerImage.frame.contains(location) && isDraggingBlock == 1 {
                drainerImage.center = location
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isDraggingBlock = 0
        checkingForMatch()
        
    }
    
    func switchStoveButtonOff() {
        stoveButtonOff.isHidden = false
        stoveButtonOn.isHidden = true
    }
    
    @objc func nextScreen() {
        self.removeFromSuperview()
        let stirView = Stir(scene: self)
        PlaygroundPage.current.liveView = stirView
    }
    
}

