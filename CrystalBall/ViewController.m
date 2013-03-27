//
//  ViewController.m
//  CrystalBall
//
//  Created by Kevin Bergman on 3/26/13.
//  Copyright (c) 2013 Kevin Bergman. All rights reserved.
//

#import "ViewController.h"

NSArray*    fortuneArray;
int         pressCount=0;
int         maxPressCount=3;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    fortuneArray = [NSArray arrayWithObjects:@"Save early, Save often",@"Buy Low, Sell High",@"Brush your teeth",nil];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cb_bg.png"]];
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];

    self.fortuneButton.tintColor = [UIColor greenColor];
    [self.fortuneButton setTitle:@"Press Your Luck" forState:UIControlStateNormal];
    
    if ([prefs boolForKey:@"freeloader"])
    {
        [self ShowFreeloader];
//      [self.fortuneButton setHidden:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)ShowFreeloader
{
    UIAlertView* alert;
    alert = [[UIAlertView alloc] initWithTitle:@"You only get three freebies"
                                       message:@"Upgrade to Pro"
                                      delegate:nil
                             cancelButtonTitle:@"OK"
                             otherButtonTitles: nil];
    [alert show];
}
    
- (IBAction) fortuneButtonPressed:(id)sender
{
    if (pressCount == maxPressCount)
        [self ShowFreeloader];
    else
    {
        pressCount++;
        if (pressCount == maxPressCount)
        {
            self.fortuneButton.tintColor = [UIColor redColor];
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setBool:TRUE forKey:@"freeloader"];
            [prefs synchronize];
        }
        [self.displayMessage setText: fortuneArray[arc4random()%3]];
    }
}

- (IBAction) resetButtonPressed:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setBool:FALSE forKey:@"freeloader"];
    [prefs synchronize];
    
    pressCount = 0;

}


@end
