//
//  FeedViewController.m
//  Week2
//
//  Created by Tom Gurka on 6/11/14.
//  Copyright (c) 2014 tom. All rights reserved.
//

#import "FeedViewController.h"
#import "MainViewController.h"


@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *FakeLoader;

//Create Fake Load Method
- (void)fakeloadMethod;

@end

@implementation FeedViewController

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
    self.navigationItem.title = @"News Feed";
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_ScrollView setHidden:true];
    [self.FakeLoader setHidden:false];
    [self.FakeLoader startAnimating];
    // Fake Load Timer
    [self performSelector:@selector(fakeloadMethod) withObject:nil afterDelay:2];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Fake Loader Method
- (void)fakeloadMethod {
    NSLog(@"Fake Method Called");
    [self.FakeLoader stopAnimating];
    [_ScrollView setHidden:false];
    [self.FakeLoader setHidden:true];
    

}

@end


