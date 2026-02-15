import UIKit

final class AccountRecoveryViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cornerRadius: CGFloat = 14.0
        static let attributedTitleForSendCodeButton = NSAttributedString(
                string: "Отправить код",
                attributes: [
                    .font: UIFont.body,
                    .foregroundColor: UIColor.white,
                ]
            )
        enum Heights {
            static let forTitleLabelForField: CGFloat = 20.0
            static let forQuestionLabel: CGFloat = 23.0
            static let forTitleLabel: CGFloat = 30.0
            static let forHeaderLabel: CGFloat = 42.0
            static let forSendCodeButton: CGFloat = 58.0
        }
    }
    
    // MARK: - UI-elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Восстановление"
        label.font = .header3
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageView: LogoScreenView = LogoScreenView(typeOfScreen: .accountRecovery)
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Забыли пароль?"
        label.font = .header1
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hintToTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите адрес электронной почты, привязанный к вашему аккаунту, и мы отправим вам код для сброса пароля"
        label.font = .body
        label.textAlignment = .center
        label.textColor = .mText
        label.numberOfLines = -1
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var titleLabelForField: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = .plainText2
        label.textAlignment = .left
        label.textColor = .mText
        return label
    }()
    
    private lazy var emailField: TextFieldView = TextFieldView(typeOfField: .email, isInProfile: false)
    
    private lazy var sendCodeButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(
            Constants.attributedTitleForSendCodeButton,
            for: .normal
        )
        button.backgroundColor = .mBlue
        button.layer.cornerRadius = Constants.cornerRadius
        return button
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Не получили письмо?"
        label.font = .plainText1
        label.textAlignment = .center
        label.textColor = .mText
        return label
    }()
    
    private lazy var hintToFindLetterLabel: UILabel = {
        let label = UILabel()
        label.text = "Проверьте папку \"Спам\" или попробуйте указать другой адрес"
        label.font = .plainText2
        label.textAlignment = .center
        label.textColor = .mText
        label.numberOfLines = -1
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        view.backgroundColor = .mBackground
        view.addSubviews([titleLabel, imageView, headerLabel, hintToTypeLabel, titleLabelForField, emailField, sendCodeButton, questionLabel, hintToFindLetterLabel])
    }
    
    private func setupConstraints() {
        [headerLabel, hintToTypeLabel, emailField, sendCodeButton, questionLabel, hintToFindLetterLabel]
            .forEach{
                $0.constraintEdges(to: view, withValue: 24.0)
            }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.Heights.forTitleLabel),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 90.0),
            
            headerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32.0),
            headerLabel.heightAnchor.constraint(equalToConstant: Constants.Heights.forHeaderLabel),
            
            hintToTypeLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12.0),
            
            titleLabelForField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40.0),
            titleLabelForField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24.0),
            titleLabelForField.topAnchor.constraint(equalTo: hintToTypeLabel.bottomAnchor, constant: 40.0),
            titleLabelForField.heightAnchor.constraint(equalToConstant: Constants.Heights.forTitleLabelForField),
            
            emailField.topAnchor.constraint(equalTo: titleLabelForField.bottomAnchor, constant: 4.0),
            
            sendCodeButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 24.0),
            sendCodeButton.heightAnchor.constraint(equalToConstant: Constants.Heights.forSendCodeButton),
            
            questionLabel.topAnchor.constraint(equalTo: sendCodeButton.bottomAnchor, constant: 32.0),
            questionLabel.heightAnchor.constraint(equalToConstant: Constants.Heights.forQuestionLabel),
            
            hintToFindLetterLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 8.0),
        ])
    }
}
