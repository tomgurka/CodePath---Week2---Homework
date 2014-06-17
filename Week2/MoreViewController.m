//
//  MoreViewController.m
//  Week2
//
//  Created by Tom Gurka on 6/12/14.
//  Copyright (c) 2014 tom. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;



//Nav Buttons
- (void)onLeftButton;
- (void)onRightButton;

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"More";
    
    // Configure the left button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"navSearch"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButton)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
    // Configure the right button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"navFriends"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onRightButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Left Nav Button
- (void)onLeftButton {
}

// Right Nav Button
- (void)onRightButton {
}


// Failed attempt at an action sheet
//- (IBAction)DownButtonLogout:(id)sender {
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Log Out" otherButtonTitles:@"Save", nil];
//    
//    [actionSheet showInView:self.view];
//    
//}
@end
