//
//  ClearAllHeader.swift
//  Flickr
//
//  Created by Islam Ibrahim on 14/12/2021.
//

import UIKit

protocol ClearAllHeaderDelegate: AnyObject {
    func clearAllHistoryDidTapped()
}

class ClearAllHeader: UIView {

    @IBOutlet private weak var contentView: UIView!
    
    weak var delegate: ClearAllHeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    private func nibSetup() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        addSubview(contentView)
    }
    
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return nibView
    }
    
    @IBAction func clearAllHistorDidTapped(_ sender: UIButton) {
        delegate?.clearAllHistoryDidTapped()
    }
}
