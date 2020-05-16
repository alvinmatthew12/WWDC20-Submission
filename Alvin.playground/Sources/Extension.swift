import UIKit
import AVFoundation

var soundURI: URL?
var audioPlayer = AVAudioPlayer()
var bgSoundURI: URL?
var bgAudioPlayer = AVAudioPlayer()

extension UIView {
    
    func playSound(file: String, fileExtension: String, isLoop: Bool = false){
        soundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let uri = soundURI else {return}
            audioPlayer = try AVAudioPlayer(contentsOf: uri)
            audioPlayer.play()
        } catch {
            print("something went wrong")
        }
    }
    
    func bubbleSound() {
        self.playSound(file: "bubble", fileExtension: "wav")
    }
    
    func pourSound() {
        self.playSound(file: "pour", fileExtension: "wav")
    }
    
    func putSound() {
        self.playSound(file: "put", fileExtension: "wav")
    }
    
    func bonAppetiteSound() {
        let utterance = AVSpeechUtterance(string: "Bon appetite!")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func playBgSound(){
        bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: "PLAYFUL", ofType: "wav")!)
        do {
            guard let uri = bgSoundURI else {return}
            bgAudioPlayer = try AVAudioPlayer(contentsOf: uri)
            bgAudioPlayer.numberOfLoops = -1
            bgAudioPlayer.play()
        } catch {
            print("something went wrong")
        }
    }
    
    func stopBgSound() {
        bgAudioPlayer.stop()
    }
}
