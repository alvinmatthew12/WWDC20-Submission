import Foundation
import UIKit
import PlaygroundSupport

public class Welcome: UIView {
    
    var frameWidth = 500
    var frameHeight = 500

    let introLabel = UILabel()
    let startButton = UIButton()
    let bannerImage = UIImageView()
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
        
        introLabel.text = "Let's cook Indomie."
        introLabel.textColor = UIColor.black
        introLabel.frame = CGRect(x: 135, y: -180, width: frameWidth, height: frameHeight)
        introLabel.font = UIFont(name: "Arial", size: 28)
        self.addSubview(introLabel)
        
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = UIColor.gray
        startButton.frame = CGRect(x: 150, y: 180, width: 200, height: 100)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        startButton.layer.cornerRadius = 14.0
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        self.addSubview(startButton)
        
        bannerImage.image = UIImage(named: "banner.png")
        bannerImage.frame = CGRect(x: 0, y: 320, width: 500, height: 200)
        bannerImage.contentMode = .scaleAspectFit
        bannerImage.alpha = 1
        self.addSubview(bannerImage)
    }
    @objc func startButtonPressed(sender: UIButton) {
        nextScreen()
    }

    func nextScreen() {
        self.playBgSound()
        
        self.removeFromSuperview()
        let indomieView = Indomie(scene: self)
        PlaygroundPage.current.liveView = indomieView
    }
}
