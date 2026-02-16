import UIKit

final class CreateNewPasswordViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cornerRadius: CGFloat = 14.0
        static let verticalSpacing: CGFloat = 16.0
        static let attributedTitleForSendCodeButton = NSAttributedString(
                string: "Сбросить пароль",
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
        label.text = "Новый пароль"
        label.font = .header3
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageView: LogoScreenView = LogoScreenView(typeOfScreen: .passwordReset)
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Придумайте новый пароль"
        label.font = .header1
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hintToTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Создайте надежный пароль для защиты вашего аккаунта"
        label.font = .body
        label.textAlignment = .center
        label.textColor = .mText
        label.numberOfLines = -1
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var newPasswordFieldView: TitledTextFieldView = TitledTextFieldView(type: .newPassword, isInProfile: false)
    private lazy var confirmPasswordFieldView: TitledTextFieldView = TitledTextFieldView(type: .confirmingPassword, isInProfile: false)
    
    private lazy var requirementsView: PasswordRequirementsView = PasswordRequirementsView()
    
    private lazy var resetPasswordButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(
            Constants.attributedTitleForSendCodeButton,
            for: .normal
        )
        button.backgroundColor = .mBlue
        button.layer.cornerRadius = Constants.cornerRadius
        button.addTarget(nil, action: #selector(resetPasswordButtonPushed), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    // MARK: - Actions
    
    @objc
    private func resetPasswordButtonPushed() { }
    
    // MARK: - Private methods
    
    private func setupView() {
        view.backgroundColor = .mBackground
        view.addSubviews([titleLabel, imageView, headerLabel, hintToTypeLabel, newPasswordFieldView, confirmPasswordFieldView, requirementsView, resetPasswordButton])
    }

    private func setupConstraints() {
        headerLabel.constraintEdges(to: view, withValue: 16.0)
        [titleLabel, hintToTypeLabel, newPasswordFieldView, confirmPasswordFieldView, requirementsView, resetPasswordButton]
            .forEach{
                $0.constraintEdges(to: view, withValue: 24.0)
            }
        
        NSLayoutConstraint.activate([
            
            //
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            // Logo Constraints
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32.0),
            
            // Header Label Constraints
            headerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32.0),
            headerLabel.heightAnchor.constraint(equalToConstant: Constants.Heights.forHeaderLabel),
            
            // Hint to Type Label Constraints
            hintToTypeLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12.0),
            
            //
            newPasswordFieldView.topAnchor.constraint(equalTo: hintToTypeLabel.bottomAnchor, constant: 40.0),
            newPasswordFieldView.heightAnchor.constraint(equalToConstant: 82.0),
            
            //
            confirmPasswordFieldView.topAnchor.constraint(equalTo: newPasswordFieldView.bottomAnchor, constant: 16.0),
            confirmPasswordFieldView.heightAnchor.constraint(equalTo: newPasswordFieldView.heightAnchor),
            
            //
            requirementsView.topAnchor.constraint(equalTo: confirmPasswordFieldView.bottomAnchor, constant: 16.0),
            requirementsView.heightAnchor.constraint(equalToConstant: 108.0),
            
            //
            resetPasswordButton.topAnchor.constraint(equalTo: requirementsView.bottomAnchor, constant: 16.0),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 58.0),
        ])
    }
}
