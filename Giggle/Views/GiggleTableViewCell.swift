//
//  GiggleTableViewCell.swift
//  Giggle
//
//  Created by AKIN on 10.07.2022.
//

import UIKit

protocol GiggleTableViewCellDelegate: AnyObject {
    func giggleTableViewCellTapReply()
    func giggleTableViewCellTapRegiggle()
    func giggleTableViewCellTapLike()
    func giggleTableViewCellTapShare()
}

class GiggleTableViewCell: UITableViewCell {

    static let identifier = "GiggleTableViewCell"
    
    weak var delegate: GiggleTableViewCellDelegate?
    
    private let actionSpacing: CGFloat = 60
    private let avatarImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let displayName: UILabel = {
        
        let label = UILabel()
        label.text = "Oguzhan Akin"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameLabel: UILabel = {
       
        let label = UILabel()
        label.text = "@ogushanakin"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let giggleTextContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is my Mockup giggle. it is going to take multiple lines. i believe some more text is enough but lets add some more anyway.. and cheers youtube.!!"
        label.numberOfLines = 0
        return label
    }()
    
    private let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "replyIcon"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let regiggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "regiggleIcon"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "heartIcon"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "shareIcon"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayName)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(giggleTextContentLabel)
        contentView.addSubview(replyButton)
        contentView.addSubview(regiggleButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        configureConstraints()
        configureButtons()
    }
    
    @objc private func didTapReply() {
        delegate?.giggleTableViewCellTapReply()
    }
    
    @objc private func didTapRegiggle() {
        delegate?.giggleTableViewCellTapRegiggle()
    }
    
    @objc private func didTapLike() {
        delegate?.giggleTableViewCellTapLike()
    }
    
    @objc private func didTapShare() {
        delegate?.giggleTableViewCellTapShare()
    }
    
    private func configureButtons() {
        replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        regiggleButton.addTarget(self, action: #selector(didTapRegiggle), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
    }
    
    private func configureConstraints() {
        
        let avatarImageViewConstraints = [
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        let displayNameLabelConstraints = [
            displayName.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            displayName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        ]
        
        let usernameLabelConstraints = [
            usernameLabel.leadingAnchor.constraint(equalTo: displayName.trailingAnchor, constant: 10),
            usernameLabel.centerYAnchor.constraint(equalTo: displayName.centerYAnchor)
        ]
        
        let giggleTextContentLabelConstraints = [
            giggleTextContentLabel.leadingAnchor.constraint(equalTo: displayName.leadingAnchor),
            giggleTextContentLabel.topAnchor.constraint(equalTo: displayName.bottomAnchor, constant: 10),
            giggleTextContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ]
        
        let replyButtonConstraints = [
            replyButton.leadingAnchor.constraint(equalTo: giggleTextContentLabel.leadingAnchor),
            replyButton.topAnchor.constraint(equalTo: giggleTextContentLabel.bottomAnchor, constant: 10),
            replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ]
        
        let regiggleButtonConstraints = [
            regiggleButton.leadingAnchor.constraint(equalTo: replyButton.trailingAnchor, constant: actionSpacing),
            regiggleButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor),
            
        ]
        
        let likeButtonConstraints = [
            likeButton.leadingAnchor.constraint(equalTo: regiggleButton.trailingAnchor, constant: actionSpacing),
            likeButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
        ]
        
        let shareButtonConstraints = [
            shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: actionSpacing),
            shareButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameLabelConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(giggleTextContentLabelConstraints)
        NSLayoutConstraint.activate(replyButtonConstraints)
        NSLayoutConstraint.activate(regiggleButtonConstraints)
        NSLayoutConstraint.activate(likeButtonConstraints)
        NSLayoutConstraint.activate(shareButtonConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
