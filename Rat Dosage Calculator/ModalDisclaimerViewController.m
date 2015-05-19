//
//  ModalDisclaimerViewController.m
//  Rat Dosage Calculator
//
//  Created by Liana Chu on 2/13/15.
//  Copyright (c) 2015 Liana Chu. All rights reserved.
//

#import "ModalDisclaimerViewController.h"
#import "ModifiedTextView.h"

@interface ModalDisclaimerViewController ()
<
UITextViewDelegate
>

@property (nonatomic, strong) UIButton *agreeButton;
@property (nonatomic, strong) ModifiedTextView *disclaimerTextView;
@end

@implementation ModalDisclaimerViewController

-(id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{

    [self setupDisclaimerTextView];
    [self setupAgreeButton];
    [self layoutSubviews];
}

-(void)layoutSubviews
{
    self.agreeButton.frame = CGRectMake(20, 30, 120, 30);
    self.disclaimerTextView.frame =CGRectMake(20, 70, self.view.bounds.size.width - 40, self.view.bounds.size.height-100);

}

-(void)setupDisclaimerTextView
{
    ModifiedTextView *disclaimerTextView = [[ModifiedTextView alloc] init];
    
    disclaimerTextView.text = @"(c) 2015 Liana Chu\n\n"
    
    "Please read the following disclaimer before using Rat Medication Dose Calculator.\n\n"
    
    "Rat Medication Dose Calculator Disclaimer:\n\n"
    
    "You agree to use this software only as an educational aid and not as a substitute for or an override of professional judgment by a veterinarian or other healthcare provider. Due to the possibility of human error or changes in veterinary science, you should confirm the information in this software through independent sources.\n\n"
    
    "With respect to prescription medication, you are advised to check the product information sheet accompanying each drug to verify conditions of use and identify any changes in dosage schedule or contraindications.\n\n"
    
    "The author does not warrant and expressly disclaims that the information contained in this software is up-to-date, complete, or accurate.\n\n"
    
    "The author does not advocate the use of any product, procedure, or treatment described in the software, and is not responsible for the misdiagnosis of an ailment or the misuse of a treatment due to typographical, mathematical, or other errors in the software, user negligence, or otherwise.\n\n"
    
    "This software is provided “as is” without warranties of any kind, express or implied. The author disclaims any liability, loss, or damage caused by it or its content. All medication names are registered trademarks of their respective manufacturers.\n\n"
    
    "Pressing “Agree” or any other use of this software constitutes acceptance of the terms of this disclaimer.\n\n";
    
    disclaimerTextView.delegate = self;
    [self.view addSubview:disclaimerTextView];
    [disclaimerTextView setFont:[UIFont systemFontOfSize:15]];
    self.disclaimerTextView = disclaimerTextView;
}

-(void)setupAgreeButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(agreeButtonWasTapped) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Agree" forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor blueColor].CGColor;
    self.agreeButton = button;
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

-(void)agreeButtonWasTapped
{
    [super dismissViewControllerAnimated:YES completion:nil];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"TermsAccepted"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
