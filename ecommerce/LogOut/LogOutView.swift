//
//  LogOutView.swift
//  ecommerce
//
//  Created by Amar Amzari on 30/12/23.
//

import Foundation

import UIKit

class LogOutView: UIView {
    
    weak var delegate : LogOutDelegate?
    
    lazy var logOutPopUpView : UIView = {
        
        let logOutView = UIView()
        logOutView.translatesAutoresizingMaskIntoConstraints = false
        logOutView.layer.cornerRadius = 15
        logOutView.backgroundColor = .white
        //logOutView.backgroundColor = .red
        return logOutView
        
    }()
    
    lazy var logOutText : UILabel = {
        
        let logOutTexts = UILabel()
        logOutTexts.translatesAutoresizingMaskIntoConstraints = false
        logOutTexts.font = UIFont.boldSystemFont(ofSize: 20)
        logOutTexts.textColor = .black
        logOutTexts.textAlignment = .center
        logOutTexts.text = "Are you sure to LOGOUT?"
        
        return logOutTexts
        
    }()
    
    lazy var noButton : UIButton = {
        
        let noBtn = UIButton(type: .system)
        noBtn.translatesAutoresizingMaskIntoConstraints = false
        noBtn.setTitle("NO", for: .normal)
        noBtn.setTitleColor(.black, for: .normal)
        noBtn.layer.borderColor = UIColor.black.cgColor
        noBtn.layer.borderWidth = 2
        noBtn.layer.cornerRadius = 15
        noBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        noBtn.backgroundColor = .clear
        noBtn.addTarget(self, action: #selector(onCancel), for: .touchUpInside)
        
        return noBtn
        
    }()
    
    lazy var yesButton : UIButton = {
        
        let yesBtn = UIButton(type: .system)
        yesBtn.translatesAutoresizingMaskIntoConstraints = false
        yesBtn.setTitle("YES", for: .normal)
        yesBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        yesBtn.setTitleColor(.white, for: .normal)
        yesBtn.backgroundColor = .tintColor
        yesBtn.layer.cornerRadius = 15
        yesBtn.addTarget(self, action: #selector(onLogout), for: .touchUpInside)
        
        return yesBtn
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("hehe gagal")
    }
    
    private func setupLayout(){
        
        addSubview(logOutPopUpView)
        logOutPopUpView.addSubview(logOutText)
        logOutPopUpView.addSubview(noButton)
        logOutPopUpView.addSubview(yesButton)
        
        
        
        NSLayoutConstraint.activate([
        
            logOutPopUpView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logOutPopUpView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logOutPopUpView.heightAnchor.constraint(equalToConstant: 130),
            logOutPopUpView.widthAnchor.constraint(equalToConstant: 300),
            
            logOutText.centerXAnchor.constraint(equalTo: logOutPopUpView.centerXAnchor),
            logOutText.topAnchor.constraint(equalTo: logOutPopUpView.topAnchor, constant: 20),
            
            yesButton.centerYAnchor.constraint(equalTo: logOutPopUpView.centerYAnchor, constant: 30),
            yesButton.centerXAnchor.constraint(equalTo: logOutPopUpView.centerXAnchor, constant: 75),
            yesButton.heightAnchor.constraint(equalToConstant: 35),
            yesButton.widthAnchor.constraint(equalToConstant: 100),
            
            noButton.centerYAnchor.constraint(equalTo: logOutPopUpView.centerYAnchor, constant: 30),
            noButton.centerXAnchor.constraint(equalTo: logOutPopUpView.centerXAnchor, constant: -75),
            noButton.heightAnchor.constraint(equalToConstant: 35),
            noButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    @objc func onCancel(){
        delegate?.onCancelLogout()
    }
    
    @objc func onLogout(){
        delegate?.onLogout()
    }
}
