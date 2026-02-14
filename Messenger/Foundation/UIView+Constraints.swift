import UIKit

extension UIView {
    func constraintEdges(to view: UIView, withValue value: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: value),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -value),
        ])
    }
    
    func constraintEqualSides(withSize size: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: size),
            heightAnchor.constraint(equalTo: widthAnchor),
        ])
    }
}
