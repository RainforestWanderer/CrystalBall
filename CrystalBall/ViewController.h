//
//  ViewController.h
//  CrystalBall
//
//  Created by Kevin Bergman on 3/26/13.
//  Copyright (c) 2013 Kevin Bergman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView*   headerView;
@property (strong, nonatomic) IBOutlet UILabel*       displayMessage;
@property (strong, nonatomic) IBOutlet UIButton*      fortuneButton;

-(IBAction)   fortuneButtonPressed:(id)sender;
-(IBAction)     resetButtonPressed:(id)sender;

@end
