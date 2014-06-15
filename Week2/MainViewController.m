//
//  MainViewController.m
//  Week2
//
//  Created by Tom Gurka on 6/10/14.
//  Copyright (c) 2014 tom. All rights reserved.
//

#import "MainViewController.h"
#import "FeedViewController.h"

//Required for the tab bar
#import "AppDelegate.h"


@interface MainViewController ()

// Declare some methods that will be called when the keyboard is about to be shown or hidden
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

//IBO
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)loginPress:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
- (IBAction)editDidChange:(id)sender;

//Password
- (void)passwordMethod;
- (void)passwordWrong;


@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
        
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    //NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.loginView.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.loginView.frame.size.height, self.loginView.frame.size.width, self.loginView.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    //CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    //NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.loginView.frame = CGRectMake(0, 140, self.loginView.frame.size.width, self.loginView.frame.size.height);
                     }
                     completion:nil];
}

//Fields have content?
- (IBAction)editDidChange:(id)sender {
    
    if (((UITextField*)sender).text.length > 0) {
        [_loginButton setEnabled:YES];
    } else {
        [_loginButton setEnabled:NO];
    }
}


//Hide Keyboard on Touch
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
}

- (IBAction)loginPress:(id)sender {
    NSLog(@"Tapped");
    [self.loginButton setSelected:YES];
    //Hide Keyboard
    [[self view] endEditing:YES];
    //Start Indicator
    [self.indicatorView startAnimating];
    // Password Timer
    [self performSelector:@selector(passwordMethod) withObject:nil afterDelay:3];
}

- (void)passwordWrong {
    NSLog(@"Alert Up!");
    [self.loginButton setSelected:NO];
    //Incorrect Password Alert
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password"
    message:@"The password you entered is incorrect. Please try again."
    delegate:self
    cancelButtonTitle:@"OK"
    otherButtonTitles:nil];
    [alertView show];
}

- (void)passwordMethod {
    
    // Password Test
    if ([self.passwordField.text isEqual: (@"password")])
        
    {
        NSLog(@"Correct Password!");
        
        // Stop Indicator
        [self.indicatorView stopAnimating];
        
        // Call Next View
        //FeedViewController *feedVC = [[FeedViewController alloc] init];
        
        // Add the Tab Bar Controller
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        appDelegate.tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:appDelegate.tabBarController animated:YES completion:nil];
        
        
        
        //[appDelegate.window setRootViewController:appDelegate.tabBarController];
        

    }
    else
    {

        NSLog(@"Incorrect Password!");
        //Stop Indicator
        [self.indicatorView stopAnimating];
        //Call Wrong Password Command
        [self performSelector:@selector(passwordWrong) withObject:nil];

    }
    
    
}


@end


