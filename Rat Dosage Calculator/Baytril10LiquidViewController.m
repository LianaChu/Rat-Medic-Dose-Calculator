//
//  Baytril10LiquidViewController.m
//  Rat Dosage Calculator
//
//  Created by Liana Chu on 1/28/15.
//  Copyright (c) 2015 Liana Chu. All rights reserved.
//

#import "Baytril10LiquidViewController.h"
#import "Baytril10LiquidCalculator.h"
#import "UIView+Borders.h"
#import "ModalDisclaimerViewController.h"
@interface Baytril10LiquidViewController ()


@property (nonatomic, strong) UITextField *ratWeightTextfield;
@property (nonatomic) float calculatedDose;
@property (nonatomic, strong) UILabel *doseLabel;
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) UILabel *directionsLabel;
@property (nonatomic, strong) UILabel *weightLabel;
@property (nonatomic, strong) UILabel *unitLabel;
@property (nonatomic, strong) UIButton *calculateButton;
@property (nonatomic, strong) UILabel *warningLabel;
@property (nonatomic, strong) UILabel *initialDirectionsLabel;

@property (nonatomic, strong) NSString *savedNotesString;
@end

@implementation Baytril10LiquidViewController

-(id)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"Baytril";
        UIImage *image = [UIImage imageNamed:@"BaytrilTabBarIcon.png"];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = image;
        [self setup];
    }
    return self;
}

-(void)setup
{
    [self setupHeaderLabel];
    [self setupInitialDirectionsLabel];
    [self setupDirectionsLabel];
    [self setupRatWeightViewsAndCalculateButton];
    [self setupDoseLabel];
    [self setupWarningLabel];
    [self layoutSubviews];
}


-(void)layoutSubviews
{
    CGFloat paddingOnTopOfHeaderLabel = 30;
    CGFloat heightOfHeaderLabel = 30;
    self.headerLabel.frame = CGRectMake(0, paddingOnTopOfHeaderLabel, self.view.bounds.size.width, heightOfHeaderLabel);
    
    CGFloat paddingOnLeftOfSubviews = 20;
    CGFloat paddingBelowHeader = 10;
    
    CGFloat yOfInitialDirectionsLabel = self.headerLabel.frame.origin.y + heightOfHeaderLabel + paddingBelowHeader;
    self.initialDirectionsLabel.frame = CGRectMake(paddingOnLeftOfSubviews, yOfInitialDirectionsLabel, (self.view.bounds.size.width - 2*paddingOnLeftOfSubviews), 0);
    self.initialDirectionsLabel.numberOfLines = 0;
    [self.initialDirectionsLabel sizeToFit];
    
    CGFloat paddingBetweenInitialDirectionsAndWeightSubviews = 20;
    
    CGFloat heightOfWeightLabel = 20;
    CGFloat yOfWeightSubviews = self.initialDirectionsLabel.frame.origin.y + self.initialDirectionsLabel.frame.size.height + paddingBetweenInitialDirectionsAndWeightSubviews;
    
    self.weightLabel.frame = CGRectMake(paddingOnLeftOfSubviews, yOfWeightSubviews, 0, heightOfWeightLabel);
    self.weightLabel.numberOfLines = 0;
    [self.weightLabel sizeToFit];
    CGFloat widthOfWeightLabel = self.weightLabel.frame.size.width;
    
    CGFloat paddingBetweenWeightLabelAndTextField = 5;
    CGFloat widthOfWeightTextField = 60;
    CGFloat heightOfWeightTextField = 20;
    self.ratWeightTextfield.frame = CGRectMake(self.weightLabel.frame.origin.x + widthOfWeightLabel + paddingBetweenWeightLabelAndTextField, yOfWeightSubviews, widthOfWeightTextField, heightOfWeightTextField);
    
    CGFloat paddingBetweenWeightTextFieldAndUnitLabel = 3;
    self.unitLabel.numberOfLines = 0;
    [self.unitLabel sizeToFit];
    CGFloat widthOfUnitLabel = self.unitLabel.frame.size.width;
    self.unitLabel.frame = CGRectMake(self.ratWeightTextfield.frame.origin.x + widthOfWeightTextField + paddingBetweenWeightTextFieldAndUnitLabel, yOfWeightSubviews, widthOfUnitLabel, heightOfWeightLabel);
    
    CGFloat paddingBetweenUnitLabelAndButton = 10;
    CGFloat widthOfButton = 80;
    CGFloat heightOfButton = 20;
    self.calculateButton.frame = CGRectMake(self.unitLabel.frame.origin.x + self.unitLabel.frame.size.width + paddingBetweenUnitLabelAndButton, yOfWeightSubviews, widthOfButton, heightOfButton);
    
    CGFloat paddingBetweenWeightSubviewsAndDoseLabel = 20;
    CGFloat heightOfDoseLabel = 20;
    CGFloat yOfDoseLabel = yOfWeightSubviews + heightOfWeightLabel + paddingBetweenWeightSubviewsAndDoseLabel;
    self.doseLabel.frame = CGRectMake(paddingOnLeftOfSubviews, yOfDoseLabel, 180, heightOfDoseLabel);
    self.doseLabel.numberOfLines = 0;
    
    CGFloat paddingAboveDirectionsLabel = 20;
    CGFloat yOfDirectionsLabel = self.doseLabel.frame.origin.y + self.doseLabel.frame.size.height + paddingAboveDirectionsLabel;

    self.directionsLabel.frame = CGRectMake(paddingOnLeftOfSubviews, yOfDirectionsLabel, (self.view.bounds.size.width - 2*paddingOnLeftOfSubviews), 0);
    self.directionsLabel.numberOfLines = 0;
    [self.directionsLabel sizeToFit];
    
    CGFloat paddingAboveWarningLabel = 10;
    CGFloat yOfWarningLabel = self.directionsLabel.frame.origin.y + self.directionsLabel.frame.size.height + paddingAboveWarningLabel;
    self.warningLabel.frame = CGRectMake(paddingOnLeftOfSubviews, yOfWarningLabel, (self.view.bounds.size.width - (2 * paddingOnLeftOfSubviews)), 0);
    self.warningLabel.numberOfLines = 0;
    [self.warningLabel sizeToFit];
}

-(void)setupHeaderLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Baytril 10% Liquid";
    label.font = [UIFont boldSystemFontOfSize:20.0f];
    label.adjustsFontSizeToFitWidth = YES;
    label.minimumScaleFactor = 0.5;
    label.textAlignment = NSTextAlignmentCenter;
    self.headerLabel = label;
    [self.view addSubview:label];
}

-(void)setupInitialDirectionsLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Type in your rat's weight, then press calculate.";
    self.initialDirectionsLabel = label;
    [self.view addSubview:label];
}

-(void)setupDirectionsLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Doses are calculated at 15mg/kg to treat respiratory illness. This dose should be given twice a day, diluted with food.";
    self.directionsLabel = label;
    [self.view addSubview:label];
}

-(void)setupRatWeightViewsAndCalculateButton
{
    UILabel *weightLabel = [[UILabel alloc] init];
    weightLabel.text = @"Rat's weight:";
    self.weightLabel = weightLabel;
    [self.view addSubview:weightLabel];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    UITextField *textfield = [[UITextField alloc] init];
    textfield.backgroundColor = [UIColor lightGrayColor];
    textfield.textAlignment = NSTextAlignmentRight;
    [textfield setReturnKeyType:UIReturnKeyDone];
    textfield.delegate = self;
    textfield.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.ratWeightTextfield = textfield;
    [self.view addSubview:textfield];
    
    UILabel *unitLabel = [[UILabel alloc] init];
    unitLabel.text = @"g";
    self.unitLabel = unitLabel;
    [self.view addSubview:unitLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(calculateButtonWasTapped) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Calculate!" forState:UIControlStateNormal];

    button.layer.cornerRadius = 5;
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor blueColor].CGColor;
    button.backgroundColor = [UIColor blueColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    self.calculateButton = button;
    [self.view addSubview:button];
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self calculateButtonWasTapped];
    return YES;
}

-(void)calculateButtonWasTapped
{
    NSString *textFieldText = self.ratWeightTextfield.text;
    if (textFieldText.length > 0) {
        float floatValue = textFieldText.floatValue;
        float calculatedDoseFloat = [Baytril10LiquidCalculator doseOfBaytril10InmLCalculatedFromWeight:floatValue];
        self.calculatedDose = calculatedDoseFloat;
    }
    [self.ratWeightTextfield resignFirstResponder];
    [self updateDoseLabel];
}

-(void)setupDoseLabel
{
    UILabel *label = [[UILabel alloc] init];
    NSString *text = [NSString stringWithFormat:@"Dose:"];
    label.font = [UIFont boldSystemFontOfSize:16.0f];
    label.text = text;
    self.doseLabel = label;
    [self.view addSubview:label];
}

-(void)updateDoseLabel
{
     NSString *text = [NSString stringWithFormat:@"Dose: %0.2f mL",self.calculatedDose];
    self.doseLabel.text = text;
}

-(void)setupWarningLabel
{
    UILabel *label = [[UILabel alloc] init];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Warning: Do not give Baytril undiluted, as it is extremely caustic. You can put it on cake, baby food beef, or pudding. Do not use acidic foods like fruit juice or baby food peaches."];
    [text addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 8)];
    [label setAttributedText:text];
    self.warningLabel = label;
    [self.view addSubview:label];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
