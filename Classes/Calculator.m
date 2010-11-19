//
//  Calculator.m
//  LCARS Calc
//
//  Created by Danny Draper on 19/09/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
/*
 This is class is essentially the calculator core / brain
 It does everything needed for a calculator to work, e.g.
 Evaluates expressions and provides answers, etc..
 It is very simple - It has one input and several outputs:
 
 The input:

 NotifyCommand - takes in a commandText string
	- This is the single input and can be any calculator
    - related command, basically a single button press whether
    - it be sin/cos/tan, +, -, or any number. The calculator
    - class will take the command into account and take the
    - proper action.
 
 The outputs:
 
 GetCurrentNumber - returns a string
	- Example output: 3.48287
	- This returns what would normally be on the calculators
    - main screen, e.g. the current number. You should call this
	- to get the output each time you do a Notify Command, the
    - calculator will update the current number any time it
    - receives a current number command.
 
 GetCurrentExpression - returns a string
    - Example output: 3.48287+1234*123-(2*12)
	- This returns the entire expression being evaluated - this
    - would be the extended display of the calculator showing
    - everything you've done up until this point.
	- You need to call this every time a Notify Command is done
    - to get the current expression.
 
 
*/
 

#import "Calculator.h"


@implementation Calculator

- (void) Initialise
{
	_currentnumber = [NSMutableString new];
	_currentexpression = [NSMutableString new];
	
	_historyindexpath = [NSIndexPath new];
	_historyindexpath = [_historyindexpath indexPathByAddingIndex:0];
	
	historyText = [[NSMutableString alloc] initWithCapacity:10];
	currentCalc = [[NSMutableString alloc] initWithCapacity:10];
	calcStack = [[NSMutableArray alloc] initWithCapacity:10];
	lastValue = [[NSMutableString alloc] initWithCapacity:10];
	_historyList = [NSMutableArray new];
	
	_reversepolishnotation = [ReversePolishNotation alloc];
	//_reversepolishnotation = [ReversePolishNotation init]; // This caused a crash on startup on iOS 4.2
	_reversepolishnotation = [ReversePolishNotation new];
	_strcurrentnumber = [NSMutableString new];
	
	_strcurrentoperator = [NSMutableString new];
	_strfullexpression = [NSMutableString new];
	_strdisplayexpression = [NSMutableString new];
	_strlastkey = [NSMutableString new];
	_boperatorset = false;
	_strlastnumberentered = [NSMutableString new];
	_strlastoperator = [NSMutableString new];
	_strbackupexpression = [NSMutableString new];
	_strbackupdisplayexpression = [NSMutableString new];
	_bexpressionevaluated = false;
	_ballowequals = false;
	_busingradians = false;
	[_reversepolishnotation setRadians:_busingradians];
	
	//NSArray *array = [[NSArray alloc] initWithObjects:@"Test 1", @"Test 2", @"Test 3", @"Test 4", @"Test 5", nil];
	//self.listData = _historyList;
	
	//[array release];
	
	// Load the sounds
	/*
	NSString *sndbuttonPath = [[NSBundle mainBundle] pathForResource:@"calcbuttonbeep" ofType:@"wav" inDirectory:@"/"];
	NSLog (@"Button Sound path: %@", sndbuttonPath);
	CFURLRef sndbuttonURL = (CFURLRef)[[NSURL alloc] initFileURLWithPath:sndbuttonPath];
	AudioServicesCreateSystemSoundID(sndbuttonURL, &_sscalcbuttonid);
	
	NSString *sndanswerPath = [[NSBundle mainBundle] pathForResource:@"calcanswer" ofType:@"wav" inDirectory:@"/"];
	NSLog (@"Answer Sound path: %@", sndanswerPath);	
	CFURLRef sndanswerURL = (CFURLRef)[[NSURL alloc] initFileURLWithPath:sndanswerPath];	
	AudioServicesCreateSystemSoundID(sndanswerURL, &_sscalcanswerid);
	*/
	
	_busesounds = true;
	_bfirstrun = true;
	
	//[self AddhelptoHistory];
}

- (NSString *) GetCurrentNumber
{
	
	return [_currentnumber uppercaseString];
}

- (NSString *) GetCurrentExpression
{
	return [[_currentexpression uppercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (bool)isEquals:(NSString *)inputText
{
	UniChar singlechar = [inputText characterAtIndex:0];
	
	if (singlechar == '=') {
		return true;
	} else {
		return false;
	}
}

- (bool)isCommand:(NSString *)inputText
{
	if ([inputText isEqualToString:@"2nd"] == true) {
		return true;
	}
	
	UniChar singlechar = [inputText characterAtIndex:0];
	
	if (singlechar >= '0' && singlechar <='9') {
		return false;
	} else {
		if (singlechar == '.') {
			return false;
		} else {
			return true;
		}
	}
}

- (void) ClearEverything:(bool)includelastkey
{
	if (includelastkey == true) {
		[_strcurrentnumber setString:@""];
		[_strlastnumberentered setString:@""];
		[_strlastkey setString:@""];
	}
	
	_currentNegative = false;
	[_strcurrentoperator setString:@""];
	[_strfullexpression setString:@""];
	[_strdisplayexpression setString:@""];
	
	_boperatorset = false;
	[self RefreshDisplay:false];
	
	[_strlastoperator setString:@""];
	_bexpressionevaluated = false;
	
	//currentCalctext.text = @"0";
	[_currentnumber setString:@"0"];
	
	//currentExpressionlabel.text = @"0";
	[_currentexpression setString:@"0"];
	_ballowequals = false;
	
	[_reversepolishnotation release];
	_reversepolishnotation = [ReversePolishNotation new];
	[_reversepolishnotation setRadians:_busingradians];
}

- (void) CopyHistoryToClipboard
{
	UIPasteboard *appPasteBoard = [UIPasteboard generalPasteboard];
	
	//appPasteBoard.persistent = YES;
	
	NSMutableString *copytext;
	copytext = [NSMutableString new];
	NSString *currenttext;
	
	int i;
	
	for (i=0;i<[_historyList count];++i)
	{
		currenttext = [_historyList objectAtIndex:i];
		[copytext appendString:currenttext];
		[copytext appendString:@"\n"];
	}
	
	[appPasteBoard setString:copytext];
	
	[copytext release];
}

- (void) ToggleSign
{
	if (_currentNegative == true) {
		_currentNegative = false;
	} else {
		_currentNegative = true;
	}
}


- (void) RefreshDisplay:(bool)addnumber
{
	NSMutableString *currentcalctext;
	currentcalctext = [NSMutableString new];
	
	if (addnumber == true)
	{
		[_strcurrentnumber appendString:_strlastkey];
		[_strlastnumberentered setString:_strcurrentnumber];
	}
	
	if (_currentNegative == true)
	{
		[currentcalctext appendString:@"-"];
		if ([_strcurrentnumber length] > 0) {
			[currentcalctext appendString:_strcurrentnumber];
			//currentCalctext.text = currentcalctext;
			[_currentnumber setString:currentcalctext];
		} else {
			//currentCalctext.text = @"0";
			[_currentnumber setString:@"0"];
		}
	}
	else 
	{
		if ([_strcurrentnumber length] > 0) {
			[currentcalctext setString:_strcurrentnumber];
			//currentCalctext.text = currentcalctext;
			[_currentnumber setString:currentcalctext];
		} else {
			//currentCalctext.text = @"0";
			[_currentnumber setString:@"0"];
		}
	}
	
	//currentExpressionlabel.text = [self GetDisplayExpression];
	[_currentexpression setString:[self GetDisplayExpression]];
	NSLog (@"DISPLAYREFRESH: Full Expression: %@", _strfullexpression);
	
	//[currentcalctext release];
	
}

- (NSString *) GetDisplayExpression
{
	NSMutableString *result;	
	result = [NSMutableString new];
	
	if (_currentNegative == true)
	{
		[result appendString:_strdisplayexpression];
		[result appendString:@" - "];
		[result appendString:_strcurrentnumber];
		[result appendString:@" "];
		[result appendString:_strcurrentoperator];
		[result appendString:@" "];
	}
	else 
	{
		[result appendString:_strdisplayexpression];
		[result appendString:_strcurrentnumber];
		[result appendString:@" "];
		[result appendString:_strcurrentoperator];
		[result appendString:@" "];		
	}
	
	[result setString:[result stringByReplacingOccurrencesOfString:@"  " withString:@" "]];
	
	return result;
}

- (NSString *) EvaluateExpression
{
	double result = 0.0;
	NSNumber *numresult;
	
	NSString *expression;
	expression = [NSString new];
	expression = [self GetExpression];
	
	NSCharacterSet *charset;
	charset = [NSCharacterSet new];
	charset = [NSCharacterSet whitespaceCharacterSet];
	
	expression = [expression stringByTrimmingCharactersInSet:charset];
	expression = [expression stringByReplacingOccurrencesOfString:@"  " withString:@" "];
	
	
	[_reversepolishnotation MakeRPN:expression];
	result = [_reversepolishnotation Evaluate];
	
	numresult = [[NSNumber alloc] initWithDouble:result];
	
	NSLog (@"Expression evaluated, answer: %f", result);
	
	return [numresult stringValue];
	
}

- (NSString *) GetExpression
{
	NSMutableString *result;	
	result = [NSMutableString new];
	
	if (_currentNegative == true)
	{
		[result appendString:_strfullexpression];
		[result appendString:@" ~ "];
		[result appendString:_strcurrentnumber];
		[result appendString:@" "];
		[result appendString:_strcurrentoperator];
		[result appendString:@" "];
	}
	else 
	{
		[result appendString:_strfullexpression];
		[result appendString:_strcurrentnumber];
		[result appendString:@" "];
		[result appendString:_strcurrentoperator];
		[result appendString:@" "];		
	}
	
	[result setString:[result stringByReplacingOccurrencesOfString:@"  " withString:@" "]];
	//result = [result stringByReplacingOccurrencesOfString:@"  " withString:@" "];
	
	return result;
}

- (NSMutableArray *) GetHistoryList
{
	return _historyList;
}

- (void) ClearHistoryList
{
	[_historyList removeAllObjects];
}

- (void) SetCurrentNumber:(NSString *)item
{
	NSString *filtered = [NSString new];
	NSString *filtereddisplay = [NSString new];
	
	//[alert show];
	filtered = [item stringByReplacingOccurrencesOfString:@" " withString:@""];
	filtered = [filtered stringByReplacingOccurrencesOfString:@"=" withString:@""];
	filtereddisplay = [item stringByReplacingOccurrencesOfString:@" " withString:@""];
	filtereddisplay = [filtereddisplay stringByReplacingOccurrencesOfString:@"=" withString:@""];
	
	if (_boperatorset == false)
	{
		if ([filtered rangeOfString:@"-"].location != NSNotFound) {
			_currentNegative = true;
			filtered = [filtered stringByReplacingOccurrencesOfString:@"-" withString:@""];
			filtereddisplay = [filtereddisplay stringByReplacingOccurrencesOfString:@"-" withString:@""];
		} else {
			_currentNegative = false;
		}
	} else {
		if ([filtered rangeOfString:@"-"].location != NSNotFound) {
			filtered = [filtered stringByReplacingOccurrencesOfString:@"-" withString:@"~ "];
			filtereddisplay = [filtereddisplay stringByReplacingOccurrencesOfString:@"-" withString:@"- "];
		} 			
	}
	
	
	_bcommandsdisabled = false; // This ensures you can't type an operator after pressing C
	_blastkeywasnumber = true;
	_ballowbackspace = true;
	
	if (_bfunctionjustperformed == true)
	{
		[self ClearEverything:false];
		_bfunctionjustperformed = false;
	}
	
	if (_boperatorset == true)
	{
		NSLog (@"Number Pressed: Full Expression: %@", _strfullexpression);
		
		[_strfullexpression setString:[self GetExpression]];
		[_strdisplayexpression setString:[self GetDisplayExpression]];
		[_strfullexpression appendString:filtered];
		[_strdisplayexpression appendString:filtereddisplay];
		
		
		[_strcurrentnumber setString:@""];
		[_strcurrentoperator setString:@""];
		_currentNegative = false;
		_boperatorset = false;
		[self RefreshDisplay:false];
		
		[_currentnumber setString:filtereddisplay];
	}
	else 
	{
		//currentCalctext.text = filtered;
		[_strcurrentnumber setString:filtered];
		[_strlastnumberentered setString:filtered];
		[self RefreshDisplay:false];
	}
	
}

- (void) AddtoHistory
{
	if (_bfirstrun == true) {
		[_historyList removeAllObjects];
		//self.listData = _historyList;
		//[historyTable reloadData];
		_bfirstrun = false;
	}
	
	NSMutableString *expressionstring;
	expressionstring = [NSMutableString new];
	[expressionstring setString:_currentexpression];
	
	
	[_historyList addObject:expressionstring];
	
	
	NSMutableString *answerstring;
	answerstring = [NSMutableString new];
	[answerstring appendString:@"   =  "];
	[answerstring appendString:_currentnumber];
	
	[_historyList addObject:answerstring];
	
	//self.listData = _historyList;
	//[historyTable reloadData];
	
	
	//if ([_historyList count] > 1) {				
		
		
		//indexpath = [[NSIndexPath alloc] initWithIndex:0];
		
		//_historyindexpath = [_historyindexpath indexPathByAddingIndex:[_historyList count]-1];
		//[historyTable scrollToRowAtIndexPath:_historyindexpath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
		
		//_historyindexpath = [_historyindexpath indexPathByRemovingLastIndex];
	//}
	
	[answerstring release];
	[expressionstring release];
}

- (void) BackspaceNumber
{
	NSString *backspacestring;
	backspacestring = [NSString new];
	
	if ([_strcurrentnumber length] > 1) {
		
		backspacestring = [_strcurrentnumber substringToIndex:[_strcurrentnumber length]-1];
		
		[_strcurrentnumber setString:backspacestring];
	} else {
		[_strcurrentnumber setString:@""];
		
	}
	
	[_strlastnumberentered setString:_strcurrentnumber];
	
}

- (void) EvaluateFunction:(NSString *)functionOp
{
	double dblresult = 0.0;
	NSNumber *numresult;
	NSMutableString *currentNum;
	currentNum = [NSMutableString new];
	
	//[currentNum setString:currentCalctext.text];
	[currentNum setString:_currentnumber];
	
	[_strcurrentnumber setString:@""];
	//_currentNegative = false;
	[_strcurrentoperator setString:@""];
	[_strfullexpression setString:@""];
	[_strdisplayexpression setString:@""];
	[_strlastkey setString:@""];
	_boperatorset = false;
	//[self RefreshDisplay:false];
	[_strlastnumberentered setString:@""];
	[_strlastoperator setString:@""];
	_bexpressionevaluated = false;
	
	//currentCalctext.text = @"0";
	//currentExpressionlabel.text = @"0";
	
	NSMutableString *result;
	result = [NSMutableString new];
	
	if (_currentNegative == true)
	{
		[result appendString:functionOp];
		[result appendString:@" ( "];
		[result appendString:@" ~ "];
		[result appendString:currentNum];
		[result appendString:@" )"];
	}
	else 
	{
		[result appendString:functionOp];
		[result appendString:@" ( "];
		[result appendString:currentNum];
		[result appendString:@" )"];
	}
	
	[_strfullexpression setString:result];
	[_strdisplayexpression setString:[result stringByReplacingOccurrencesOfString:@"~" withString:@"-"]];
	
	[_reversepolishnotation MakeRPN:result];
	dblresult = [_reversepolishnotation Evaluate];
	
	numresult = [[NSNumber alloc] initWithDouble:dblresult];
	//currentCalctext.text = [numresult stringValue];
	[_currentnumber setString:[numresult stringValue]];
	
	//currentExpressionlabel.text = _strdisplayexpression;
	[_currentexpression setString:_strdisplayexpression];
	
	_bfunctionjustperformed = true;
	
	[numresult release];
	
	[self AddtoHistory];
}

- (void) NotifyCommand:(NSString *)commandText
{
	//currentCalctext.text = @"Hello.";
	//NSString *keyinputstring = [sender titleForState:UIControlStateNormal];
	NSString *keyinputstring = commandText;
	[_strlastkey setString:keyinputstring];
	
	if ([self isEquals:keyinputstring] == false) 
	{
		_bexpressionevaluated = false;
	}
	
	
	if([self isCommand:keyinputstring] == true)
	{
		if ([keyinputstring isEqualToString:@"CE"] == true) {			
			[self ClearEverything:true];
			
		}
		
		if (_bcommandsdisabled == false) {
			
			if ([keyinputstring isEqualToString:@"±"] == true) {
				
				[self ToggleSign];
				[self RefreshDisplay:false];
				//NSLog (@"Sign button pressed!");
				
			}
			
			if ([keyinputstring isEqualToString:@"="] == true) {
				
				if (_ballowequals == true) {
					
					if (_bexpressionevaluated == true)
					{
						[_strfullexpression appendString:_strlastnumberentered];
						[_strfullexpression appendString:@" "];
						[_strfullexpression appendString:_strlastoperator];
						[_strfullexpression appendString:@" "];
						
						[_strdisplayexpression appendString:_strlastnumberentered];
						[_strdisplayexpression appendString:@" "];
						[_strdisplayexpression appendString:_strlastoperator];
						[_strdisplayexpression appendString:@" "];
						
						[self RefreshDisplay:false];
					}
					
					//currentCalctext.text = [self EvaluateExpression];
					[_currentnumber setString:[self EvaluateExpression]];
					_bexpressionevaluated = true;
					[self AddtoHistory];
					
					[_reversepolishnotation release];
					_reversepolishnotation = [ReversePolishNotation new];
					[_reversepolishnotation setRadians:_busingradians];
				}
				
			}
			
			if ([keyinputstring isEqualToString:@"Mod"] == true) {
				_bfunctionjustperformed = false;
				_boperatorset = true;
				_ballowequals = true;
				[_strcurrentoperator setString:@"mod"];
				[_strlastoperator setString:_strcurrentoperator];
				[self RefreshDisplay:false];
				//currentCalctext.text = [self EvaluateExpression];
				[_currentnumber setString:[self EvaluateExpression]];
			}
			
			if ([keyinputstring isEqualToString:@"x^y"] == true) {
				_bfunctionjustperformed = false;
				_boperatorset = true;
				_ballowequals = true;
				[_strcurrentoperator setString:@"^"];
				[_strlastoperator setString:_strcurrentoperator];
				[self RefreshDisplay:false];
				//currentCalctext.text = [self EvaluateExpression];
				[_currentnumber setString:[self EvaluateExpression]];
			}
			
			if ([keyinputstring isEqualToString:@"+"] == true) {
				_bfunctionjustperformed = false;
				_boperatorset = true;
				_ballowequals = true;
				[_strcurrentoperator setString:@"+"];
				[_strlastoperator setString:_strcurrentoperator];
				[self RefreshDisplay:false];
				//currentCalctext.text = [self EvaluateExpression];
				[_currentnumber setString:[self EvaluateExpression]];
			}
			
			if ([keyinputstring isEqualToString:@"-"] == true) {
				_bfunctionjustperformed = false;
				_boperatorset = true;
				_ballowequals = true;
				[_strcurrentoperator setString:@"-"];
				[_strlastoperator setString:_strcurrentoperator];
				[self RefreshDisplay:false];
				//currentCalctext.text = [self EvaluateExpression];
				[_currentnumber setString:[self EvaluateExpression]];
			}
			
			if ([keyinputstring isEqualToString:@"/"] == true) {
				_bfunctionjustperformed = false;
				_boperatorset = true;
				_ballowequals = true;
				[_strcurrentoperator setString:@"/"];
				[_strlastoperator setString:_strcurrentoperator];
				[self RefreshDisplay:false];
				//currentCalctext.text = [self EvaluateExpression];
				[_currentnumber setString:[self EvaluateExpression]];
			}
			
			if ([keyinputstring isEqualToString:@"*"] == true) {
				_bfunctionjustperformed = false;
				_boperatorset = true;
				_ballowequals = true;
				[_strcurrentoperator setString:@"*"];
				[_strlastoperator setString:_strcurrentoperator];
				[self RefreshDisplay:false];
				//currentCalctext.text = [self EvaluateExpression];
				
				[_currentnumber setString:[self EvaluateExpression]];
				
			}
			
			if ([keyinputstring isEqualToString:@"("] == true) {
				_ballowequals = false;
				if (_boperatorset == true)
				{
					[_strfullexpression setString:[self GetExpression]];
					[_strfullexpression appendString:@" ( "];
					[_strdisplayexpression setString:[self GetDisplayExpression]];
					[_strdisplayexpression appendString:@" ( "];
					[_strcurrentnumber setString:@""];
					[_strcurrentoperator setString:@""];
					_currentNegative = false;
					_boperatorset = false;
					[self RefreshDisplay:false];
				}
				
			}
			
			if ([keyinputstring isEqualToString:@")"] == true) {
				_ballowequals = true;
				[_strfullexpression setString:[self GetExpression]];
				[_strfullexpression appendString:@") "];
				[_strdisplayexpression setString:[self GetDisplayExpression]];
				[_strdisplayexpression appendString:@") "];
				[_strcurrentnumber setString:@""];
				[_strcurrentoperator setString:@""];
				_currentNegative = false;
				_boperatorset = false;
				[self RefreshDisplay:false];
			}
			
			if ([keyinputstring isEqualToString:@"C"] == true) {
				
				if (_blastkeywasnumber == true) {
					NSLog (@"Backed up expression: %@", _strbackupexpression);
					
					_currentNegative = false;
					[_strcurrentoperator setString:@""];
					[_strcurrentnumber setString:@""];
					_boperatorset = false;
					[self RefreshDisplay:false];
					//[_strlastnumberentered setString:@""];
					//[_strlastoperator setString:@""];
					_bexpressionevaluated = false;
					
					[_strfullexpression setString:_strbackupexpression];
					[_strdisplayexpression setString:_strbackupdisplayexpression];
					
					[self RefreshDisplay:false];
					
					//currentCalctext.text = @"0";
					
					[_currentnumber setString:@"0"];
					
					_bcommandsdisabled = true;
				}
			} else {
				_blastkeywasnumber = false;
				[_strbackupexpression setString:[self GetExpression]];
				[_strbackupdisplayexpression setString:[self GetDisplayExpression]];
				NSLog(@"Expression backed up: %@", _strbackupexpression);
				
			}
			
			if ([keyinputstring isEqualToString:@"Bksp"] == true) {
				
				if (_ballowbackspace == true) {
					[self BackspaceNumber];
					[self RefreshDisplay:false];
				}
				
			} else {
				_ballowbackspace = false;
			}
			
			if ([keyinputstring isEqualToString:@"sin"] == true) {
				[self EvaluateFunction:@"sin"];
			}
			
			if ([keyinputstring isEqualToString:@"cos"] == true) {
				[self EvaluateFunction:@"cos"];
			}
			
			if ([keyinputstring isEqualToString:@"tan"] == true) {
				[self EvaluateFunction:@"tan"];
			}
			
			if ([keyinputstring isEqualToString:@"sinh"] == true) {
				[self EvaluateFunction:@"sinh"];
			}
			
			if ([keyinputstring isEqualToString:@"cosh"] == true) {
				[self EvaluateFunction:@"cosh"];
			}
			
			if ([keyinputstring isEqualToString:@"tanh"] == true) {
				[self EvaluateFunction:@"tanh"];
			}
			
			if ([keyinputstring isEqualToString:@"asin"] == true) {
				[self EvaluateFunction:@"asin"];
			}
			
			if ([keyinputstring isEqualToString:@"acos"] == true) {
				[self EvaluateFunction:@"acos"];
			}
			
			if ([keyinputstring isEqualToString:@"atan"] == true) {
				[self EvaluateFunction:@"atan"];
			}
			
			if ([keyinputstring isEqualToString:@"asinh"] == true) {
				[self EvaluateFunction:@"asinh"];
			}
			
			if ([keyinputstring isEqualToString:@"acosh"] == true) {
				[self EvaluateFunction:@"acosh"];
			}
			
			if ([keyinputstring isEqualToString:@"atanh"] == true) {
				[self EvaluateFunction:@"atanh"];
			}
			
			if ([keyinputstring isEqualToString:@"log"] == true) {
				[self EvaluateFunction:@"log"];
			}
			
			if ([keyinputstring isEqualToString:@"log2"] == true) {
				[self EvaluateFunction:@"log2"];
			}
			
			if ([keyinputstring isEqualToString:@"Cbrt"] == true) {
				[self EvaluateFunction:@"cbrt"];
			}
			
			if ([keyinputstring isEqualToString:@"Sqrt"] == true) {
				[self EvaluateFunction:@"sqrt"];
			}
			
			if ([keyinputstring isEqualToString:@"x2"] == true) {
				[self EvaluateFunction:@"x2"];
			}
			
			if ([keyinputstring isEqualToString:@"%"] == true) {
				[self EvaluateFunction:@"%"];
			}
			
			if ([keyinputstring isEqualToString:@"Rad"] == true) {
				//degradLabel.text = @"Rad";
				//((UIButton)sender).text = @"Deg";
				//[degradButton setTitle:@"Deg" forState:UIControlStateNormal];
				_busingradians = true;
				[_reversepolishnotation setRadians:_busingradians];
			}
			
			
			if ([keyinputstring isEqualToString:@"Deg"] == true) {
				//degradLabel.text = @"Deg";
				//((UIButton)sender).text = @"Deg";
				//[degradButton setTitle:@"Rad" forState:UIControlStateNormal];
				_busingradians = false;
				[_reversepolishnotation setRadians:_busingradians];
			}
			
			
			if ([keyinputstring isEqualToString:@"pi"] == true) {
				NSNumber *constValue;
				constValue = [[NSNumber alloc] initWithDouble:M_PI];
				
				//currentCalctext.text = [constValue stringValue];
				
				[_currentnumber setString:[constValue stringValue]];
				
				[_strcurrentnumber setString:[constValue stringValue]];
				
				[constValue release];
			}
			
			
			if ([keyinputstring isEqualToString:@"e"] == true) {
				NSNumber *constValue;
				constValue = [[NSNumber alloc] initWithDouble:M_E];
				
				//currentCalctext.text = [constValue stringValue];
				
				[_currentnumber setString:[constValue stringValue]];
				
				[_strcurrentnumber setString:[constValue stringValue]];
				
				[constValue release];
			}

			
		} // _bcommandsdisabled
	} else {
		
		//[currentCalc appendString:@"F"];
		_bcommandsdisabled = false; // This ensures you can't type an operator after pressing C
		_blastkeywasnumber = true;
		_ballowbackspace = true;
		
		if (_bfunctionjustperformed == true)
		{
			[self ClearEverything:false];
			_bfunctionjustperformed = false;
		}
		
		if (_boperatorset == true)
		{
			NSLog (@"Number Pressed: Full Expression: %@", _strfullexpression);
			
			[_strfullexpression setString:[self GetExpression]];
			[_strdisplayexpression setString:[self GetDisplayExpression]];
			
			[_strcurrentnumber setString:@""];
			[_strcurrentoperator setString:@""];
			_currentNegative = false;
			_boperatorset = false;
			[self RefreshDisplay:true];
			
			
		}
		else 
		{
			[self RefreshDisplay:true];
		}
		
	}
	
	
	
	if (_busesounds == true) {
		if ([keyinputstring isEqualToString:@"="] == true) {
			//AudioServicesPlaySystemSound(_sscalcanswerid);
		} else {
			//AudioServicesPlaySystemSound(_sscalcbuttonid);
		}
	}
	
	
}

@end
