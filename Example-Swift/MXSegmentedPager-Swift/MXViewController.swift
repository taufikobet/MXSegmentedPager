// MXViewController.swift
//
// Copyright (c) 2015 Maxime Epain
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import MXSegmentedPager

class MXViewController: MXSegmentedPagerController {

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedPager.backgroundColor = UIColor.white
        
        // Parallax Header       
        segmentedPager.parallaxHeader.view = MXHeaderView.instanceFromNib();
        segmentedPager.parallaxHeader.mode = MXParallaxHeaderMode.fill;
        segmentedPager.parallaxHeader.height = 150;
        segmentedPager.parallaxHeader.minimumHeight = 20;
        
        //segmentedPager.segmentedControlEdgeInsets = UIEdgeInsetsMake(118, 0, 0, 0);
        let accessoryView = UIView()
        accessoryView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 118)
        accessoryView.backgroundColor = UIColor.red
        segmentedPager.accessoryView = accessoryView
        
        // Segmented Control customization
        segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.down;
        segmentedPager.segmentedControl.backgroundColor = UIColor.white
        segmentedPager.segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black];
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSForegroundColorAttributeName : UIColor.orange]
        segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyle.fullWidthStripe
        segmentedPager.segmentedControl.selectionIndicatorColor = UIColor.orange
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        return ["Table", "Web", "Text"][index];
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, didScrollWith parallaxHeader: MXParallaxHeader) {
        NSLog("progress %f", parallaxHeader.progress)
    }
}
