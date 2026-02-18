import UIKit

final class ConfirmingEmailViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cornerRadius: CGFloat = 14.0
        static let attributedTitleForConfirmingButton = NSAttributedString(
                string: "Подтвердить",
                attributes: [
                    .font: UIFont.body,
                    .foregroundColor: UIColor.white,
                ]
            )
        
        enum Heights {
            static let forSmallLabels: CGFloat = 26.0
            static let forHeaderLabel: CGFloat = 42.0
            static let forCodeInputField: CGFloat = 56.0
            static let forConfirmingButton: CGFloat = 58.0
        }
    }
    
    // MARK: - UI-elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Подтверждение"
        label.font = .header3
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageView: LogoScreenView = LogoScreenView(typeOfScreen: .mailConfirmation)
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Проверьте почту"
        label.font = .header1
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hintToTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Мы отправили код подтверждения на"
        label.font = .body
        label.textAlignment = .center
        label.textColor = .mText
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "test@mail.com"
        label.font = .body
        label.textAlignment = .center
        return label
    }()
    
    private lazy var codeField: CodeInputView = CodeInputView(onCodeChanged: { [weak self] code, fullLenght in
        self?.confirmingButton.isEnabled = code.count == fullLenght
        self?.confirmingButton.backgroundColor = .mBlue.withAlphaComponent(code.count == fullLenght ? 1.0 : 0.5)
    })
    
    private lazy var confirmingButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(
            Constants.attributedTitleForConfirmingButton,
            for: .normal
        )
        button.isEnabled = false
        button.backgroundColor = .mBlue.withAlphaComponent(0.5)
        button.layer.cornerRadius = Constants.cornerRadius
        button.addTarget(nil, action: #selector(confirmingButtonPushed), for: .touchUpInside)
        return button
    }()
    
    private lazy var countingTickLabel: UILabel = {
        let label = UILabel()
        label.text = "Отправить повторно через 60 сек"
        label.font = .plainText1
        label.textAlignment = .center
        label.textColor = .mText
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    // MARK: - Actions
    
    @objc
    private func confirmingButtonPushed() {
        let viewController = CreateNewPasswordViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        navigationItem.titleView = titleLabel
        view.backgroundColor = .mBackground
        view.addSubviews([titleLabel, imageView, headerLabel, hintToTypeLabel, emailLabel, codeField, confirmingButton, countingTickLabel])
    }
    
    private func setupConstraints() {
        [headerLabel, hintToTypeLabel, emailLabel, codeField, confirmingButton, countingTickLabel]
            .forEach{
                $0.constraintEdges(to: view, withValue: 24.0)
            }
        
        NSLayoutConstraint.activate([
            
            // Logo Constraints
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 128.0),
            
            // Header Label Constraints
            headerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32.0),
            headerLabel.heightAnchor.constraint(equalToConstant: Constants.Heights.forHeaderLabel),
            
            // Hint to Type Label Constraints
            hintToTypeLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12.0),
            hintToTypeLabel.heightAnchor.constraint(equalToConstant: Constants.Heights.forSmallLabels),
            
            // Title Label for Email TextField Constraints
            emailLabel.topAnchor.constraint(equalTo: hintToTypeLabel.bottomAnchor, constant: 8.0),
            emailLabel.heightAnchor.constraint(equalToConstant: Constants.Heights.forSmallLabels),
            
            // Horizontal Stack of TextFields Constraints
            codeField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 40.0),
            codeField.heightAnchor.constraint(equalToConstant: Constants.Heights.forCodeInputField),
            
            // Button to Confirm Emal Constraints
            confirmingButton.topAnchor.constraint(equalTo: codeField.bottomAnchor, constant: 32.0),
            confirmingButton.heightAnchor.constraint(equalToConstant: Constants.Heights.forConfirmingButton),
            
            // Question Label Constraints
            countingTickLabel.topAnchor.constraint(equalTo: confirmingButton.bottomAnchor, constant: 24.0),
            countingTickLabel.heightAnchor.constraint(equalToConstant: Constants.Heights.forSmallLabels),
        ])
    }
}
