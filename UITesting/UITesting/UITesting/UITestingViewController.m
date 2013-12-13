//
//  UITestingViewController.m
//  UITesting
//
//  Created by Rahul Agrawal on 07/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import "UITestingViewController.h"

@interface UITestingViewController ()

@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *selectedWord;

@property (weak, nonatomic) IBOutlet UILabel *completeTextLable;

@end

@implementation UITestingViewController

- (IBAction)changeColur:(id)sender {
    [self addAttribute:@{NSForegroundColorAttributeName : [sender backgroundColor]}
               atRange:[self getRange]];
}

- (IBAction)underline {
    [self addAttribute:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlineByWord | NSUnderlinePatternSolid)} atRange:[self getRange]];
}

- (IBAction)unUnderline {
    [self addAttribute:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleNone)} atRange:[self getRange]];
}

-(NSRange)getRange{
    NSRange range = [[self.completeTextLable.attributedText string] rangeOfString:[self getSelectedWord]];
    
    NSLog(@"%@ %@",NSStringFromRange(range), @("dsadasdas"));
    return range;
}

-(void)addAttribute:(NSDictionary *)dictionary atRange:(NSRange)range{
    if(range.location != NSNotFound){
        NSMutableAttributedString *mutableString = [self.completeTextLable.attributedText mutableCopy];
        [mutableString addAttributes:dictionary range:range];
        self.completeTextLable.attributedText = mutableString;
    }
}

-(NSString *)getSelectedWord {
    return [self words][(int)self.stepper.value];
}

-(NSArray *)words {
    NSArray *words = [[self.completeTextLable.attributedText string] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if(words.count){
        return words;
    }else{
        return @[@""];
    }
}

- (IBAction)step {
    self.stepper.maximumValue = [self words].count-1;
    self.selectedWord.text = [self getSelectedWord];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.selectedWord.text = [self getSelectedWord];
}

@end
