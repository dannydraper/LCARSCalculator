//
//  Calculator.h
//  LCARS Calc
//
//  Created by Danny Draper on 19/09/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReversePolishNotation.h"

@interface Calculator : NSObject {

	
	
	NSMutableString *_currentnumber;
	NSMutableString *_currentexpression;
	
	
	NSMutableString *historyText;
	NSMutableString *currentCalc;
	NSMutableString *lastValue;
	
	bool _currentNegative;
	NSMutableString *_strcurrentnumber;
	NSMutableString *_strcurrentoperator;
	NSMutableString *_strfullexpression;
	NSMutableString *_strdisplayexpression;
	NSMutableString *_strlastkey;
	bool _boperatorset;
	bool _bcommandsdisabled;
	bool _blastkeywasnumber;
	bool _ballowbackspace;
	bool _ballowequals;
	bool _bfunctionjustperformed;
	NSMutableString *_strlastnumberentered;
	NSMutableString *_strlastoperator;
	bool _bexpressionevaluated;
	NSMutableString *_strbackupexpression;
	NSMutableString *_strbackupdisplayexpression;
	NSMutableArray *calcStack;
	bool _busingradians;
	NSMutableArray *_historyList;
	NSIndexPath *_historyindexpath;
	bool _busesounds;
	bool _bfirstrun;
	
	ReversePolishNotation *_reversepolishnotation;
	
}

- (void) Initialise;
- (bool)isEquals:(NSString *)inputText;
- (bool)isCommand:(NSString *)inputText;
- (void) ClearEverything:(bool)includelastkey;
- (void) ToggleSign;
- (void) RefreshDisplay:(bool)addnumber;
- (NSString *) GetDisplayExpression;
- (NSString *) EvaluateExpression;
- (NSString *) GetExpression;
- (void) AddtoHistory;
- (void) BackspaceNumber;
- (void) EvaluateFunction:(NSString *)functionOp;
- (NSString *) GetCurrentNumber;
- (void) SetCurrentNumber:(NSString *)item;
- (NSString *) GetCurrentExpression;
- (NSMutableArray *) GetHistoryList;
- (void) ClearHistoryList;
- (void) NotifyCommand:(NSString *)commandText;
- (void) CopyHistoryToClipboard;

@end
