import UIKit

final class CodeInputView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let borderWidth: CGFloat = 1.0
        static let horizontalSpacing: CGFloat = 12.0
        static let cornerRadius: CGFloat = 14.0
        static let heightForView: CGFloat = 56.0
    }
    
    // MARK: - UI-elements
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = Constants.horizontalSpacing
        stack.distribution = .fillEqually
        return stack
    }()
    
    // MARK: - Private properties
    
    private let numberOfFields: Int
    private let onCodeChanged: ((String, Int) -> Void)?
    
    // MARK: - Public properties
    
    var code: String {
        return stackView.arrangedSubviews
            .compactMap { ($0 as? UITextField)?.text }
            .joined()
    }
    
    // MARK: - Initializers
    
    init(numberOfFields: Int = 6, onCodeChanged: ((String, Int) -> Void)? = nil) {
        self.numberOfFields = numberOfFields
        self.onCodeChanged = onCodeChanged
        super.init(frame: .zero)
        setupView()
        createFields()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Private methods
    
    private func setupView() {
        addSubviews([stackView])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createFields() {
        for i in 0..<numberOfFields {
            let textField = createTextField()
            textField.tag = i
            textField.delegate = self
            stackView.addArrangedSubview(textField)
        }
    }
    
    private func createTextField() -> UITextField {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.clearsOnBeginEditing = true
        textField.font = .body
        textField.backgroundColor = .mField
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.clipsToBounds = true
        textField.setContentHuggingPriority(.required, for: .horizontal)
        textField.setContentCompressionResistancePriority(.required, for: .horizontal)
        return textField
    }
}

// MARK: - CodeInputView + UITextFieldDelegate

extension CodeInputView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let lastChar = string.last
        else { return true }
        textField.text = String(lastChar)
        moveToNextField(from: textField)
        return false
    }
    
    private func moveToNextField(from textField: UITextField) {
        let nextTag = textField.tag + 1
        if nextTag < numberOfFields {
            let nextField = stackView.arrangedSubviews[nextTag] as? UITextField
            nextField?.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        onCodeChanged?(code, numberOfFields)
    }
}
