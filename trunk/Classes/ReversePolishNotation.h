//
//  ReversePolishNotation.h
//  HyperCalc
//
//  Created by Danny Draper on 04/06/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPNToken.h"
#import "Stack.h"


@interface ReversePolishNotation : NSObject {

}

NSMutableArray *_rpnoutput;
Stack *_ops;
NSMutableString *_postfixexpression;
bool _busingradians;

- (double) Evaluate;
- (void) PrintOperatorStack;
- (void) doSomething:(int) mynumber;
- (void) stackTest;
- (void) stringSplitTest;
- (bool) MakeRPN:(NSString *)infixExpression;
- (void) Doubletest;
- (bool) IsValidNumber:(NSString *)inputNumber;
- (bool) IsOperatorToken:(TokenType)tokentype;
- (bool) IsFunctionToken:(TokenType)tokentype;
- (double) EvaluateConstant:(NSString *)tokenValue;
- (void) setRadians:(bool)usingRadians;

@end
