//
//  ReversePolishNotation.m
//  HyperCalc
//
//  Created by Danny Draper on 04/06/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import "ReversePolishNotation.h"


@implementation ReversePolishNotation

- (void) setRadians:(bool)usingRadians
{
	_busingradians = usingRadians;
}

- (void) doSomething:(int) mynumber
{
	RPNToken *rpntoken;
	rpntoken = [RPNToken new];
	
	[rpntoken setTokenvalue:@"Hello"];
	[rpntoken setTokentype:None];
	
	RPNToken *rpntoken2;
	rpntoken2 = [RPNToken new];
	
	[rpntoken2 setTokenvalue:@"Token 2"];
	[rpntoken2 setTokentype:Number];
	
	
	NSMutableArray *myarray;
	myarray = [NSMutableArray new];
	
	
	[myarray addObject:rpntoken];
	[myarray addObject:rpntoken2];
	
	int n;
	
	RPNToken *currentToken;
	currentToken = [RPNToken new];
	
	NSLog(@"There are %d objects in the array", [myarray count]);
	
	for (n=0;n<[myarray count];++n) {
		
		currentToken = [myarray objectAtIndex:n];
		
		NSLog(@"Current token value is: %@", [currentToken getTokenvalue]);
		NSLog(@"Current token type is: %d", [currentToken getTokentype]);
		
	}
	
	
	//NSLog(@"RPN Token type: %d", [rpntoken getTokentype]);
	//NSLog(@"RPN Token value: %@", [rpntoken getTokenvalue]);
	
	
	
	//RPNToken *rpntoken;
	
	//[rpntoken new];
	
	//[rpntoken setTokentype:(TokenType)Number];
	//[rpntoken setTokenvalue:@"Hello"];
	
	NSLog(@"Do something method has been called.");
}

- (void) stackTest
{
	NSLog(@"Stacktest method has been called.");
	
	Stack *mystack;
	mystack = [Stack new];
	
	
	RPNToken *rpntoken1;
	rpntoken1 = [RPNToken new];
	
	[rpntoken1 setTokenvalue:@"First Stack Object"];
	[rpntoken1 setTokentype:None];
	
	
	
	RPNToken *rpntoken2;
	rpntoken2 = [RPNToken new];
	
	[rpntoken2 setTokenvalue:@"Second Stack Object"];
	[rpntoken2 setTokentype:Number];
	
	
	
	RPNToken *rpntoken3;
	rpntoken3 = [RPNToken new];
	
	[rpntoken3 setTokenvalue:@"Third Stack Object"];
	[rpntoken3 setTokentype:Multiply];
	
	
	NSLog (@"Stack count is: %d", [mystack Count]);
	
	[mystack Initialise];
	
	[mystack Push:rpntoken1];
	[mystack Push:rpntoken2];
	[mystack Push:rpntoken3];
	
	RPNToken *poptoken;
	poptoken = [RPNToken new];
	
	
	poptoken = (RPNToken *) [mystack Peek];
	
	NSLog (@"Peeked token value is %@", [poptoken getTokenvalue]);
	NSLog (@"Peeked token type is %d", [poptoken getTokentype]);
		
	
	poptoken = (RPNToken *) [mystack Pop];
	
	NSLog (@"Popped token value is %@", [poptoken getTokenvalue]);
	NSLog (@"Popped token type is %d", [poptoken getTokentype]);
	
	
	poptoken = (RPNToken *) [mystack Pop];
	
	NSLog (@"Popped token value is %@", [poptoken getTokenvalue]);
	NSLog (@"Popped token type is %d", [poptoken getTokentype]);
	
	
	poptoken = (RPNToken *) [mystack Pop];
	
	NSLog (@"Popped token value is %@", [poptoken getTokenvalue]);
	NSLog (@"Popped token type is %d", [poptoken getTokentype]);
	
	
	
	poptoken = (RPNToken *) [mystack Pop];
	
	NSLog (@"Popped token value is %@", [poptoken getTokenvalue]);
	NSLog (@"Popped token type is %d", [poptoken getTokentype]);
}

- (void) stringSplitTest
{
	NSString *stringtest = @"This is a string I want to split";
	
	NSLog (@"String to split: %@", stringtest);
	
	NSArray *splitarray = [stringtest componentsSeparatedByString:@" "];
	
	int i;
	
	for (i=0;i<[splitarray count];++i)
	{
		NSString *stringpart = (NSString *)[splitarray objectAtIndex:i];
		NSLog (@"Stringpart: %@", stringpart);
		
	}
}

- (bool)IsValidNumber:(NSString *)inputNumber
{
	// **** YOU WERE HERE
	UniChar singlechar;
	BOOL bValidnumber = true;
	int i;
	
	for (i=0;i<[inputNumber length];++i)
	{
		singlechar = [inputNumber characterAtIndex:i];
		
		if (singlechar < '0' || singlechar >'9') {
			if (singlechar != '.') {
				bValidnumber = false;	
			}
		} 	
	}
	
	return bValidnumber;
}

- (void) Doubletest
{
	// Test method to see how Objective C deals with parsing of strings
	// and conversion to double. Does it generate an exception if a string cannot
	// be converted into a double? This is what we shall test
	
	NSString *teststring = @"12345.32";
	
	double mydouble = [teststring doubleValue];
	
	NSLog(@"Converted double value was: %f", mydouble);
	
	if ([self IsValidNumber:teststring] == TRUE) {
		NSLog (@"This is a valid number: %@", teststring);
	} else {
		NSLog (@"This is NOT a valid number: %@", teststring);
	}
}

- (void) PrintOperatorStack
{
	int i;
	RPNToken *currentToken;
	currentToken = [RPNToken new];
	NSLog (@"Printing operator stack...");
	
	
	for (i=0;i<[_ops Count];++i)
	{
		currentToken = (RPNToken *)[_ops GetItem:i];		
		NSLog (@"Ops Stack Item %d, Value: %@, Type: %d", i, [currentToken getTokenvalue], [currentToken getTokentype]);
	}
}

- (bool) MakeRPN:(NSString *)infixExpression
{
	_rpnoutput = [NSMutableArray new];
	_ops = [Stack new];
	[_ops Initialise];
	
	RPNToken *token;
	RPNToken *opstoken;
	_postfixexpression = [NSMutableString new];
	
	opstoken = [RPNToken new];
	
	NSLog (@"Infix expression provided was: %@", infixExpression);
	
	// Time to tokenise it man!
	NSArray *tokenisedList = [infixExpression componentsSeparatedByString:@" "];
	
	int i;
	
	for (i=0;i<[tokenisedList count];++i)
	{
		NSString *tokenpart = (NSString *)[tokenisedList objectAtIndex:i];
		NSLog (@"Token part: %@", tokenpart);
		
		
		token = [RPNToken new];
		[token setTokenvalue:tokenpart];
		[token setTokentype:None];
		
		if ([self IsValidNumber:tokenpart] == TRUE) {
			[token setTokentype:Number];
			[_rpnoutput addObject:token];
		} else {
			
			if ([tokenpart isEqualToString:@"mod"] == TRUE) {
				//NSLog (@"Encountered + operator");
				[token setTokentype:Modulus];
				
				if ([_ops Count] > 0) {
					opstoken = (RPNToken *)[_ops Peek];
					
					// While there is an operator o2 at the top of the stack
					while ([self IsOperatorToken:[opstoken getTokentype]] == true)
					{
						// Pop o2 off the stack onto the output queue
						[_rpnoutput addObject:[_ops Pop]];
						if ([_ops Count] > 0)
						{
							opstoken = (RPNToken *)[_ops Peek];
						}
						else
						{
							break;
						}
					}
				}
				
				// push o1 onto the operator stack
				[_ops Push:token];
				
				//[self PrintOperatorStack];
			}
			
			if ([tokenpart isEqualToString:@"+"] == TRUE) {
				//NSLog (@"Encountered + operator");
				[token setTokentype:Plus];
				
				if ([_ops Count] > 0) {
					opstoken = (RPNToken *)[_ops Peek];
					
					// While there is an operator o2 at the top of the stack
					while ([self IsOperatorToken:[opstoken getTokentype]] == true)
					{
						// Pop o2 off the stack onto the output queue
						[_rpnoutput addObject:[_ops Pop]];
						if ([_ops Count] > 0)
						{
							opstoken = (RPNToken *)[_ops Peek];
						}
						else
						{
							break;
						}
					}
				}
				
				// push o1 onto the operator stack
				[_ops Push:token];
				
				//[self PrintOperatorStack];
			}
			
			
			if ([tokenpart isEqualToString:@"-"] == TRUE) {
				[token setTokentype:Minus];
				
				if ([_ops Count] > 0)
				{
					opstoken = (RPNToken *)[_ops Peek];
					
					// While there is an operator, o2 at the top of the stack
					while ([self IsOperatorToken:[opstoken getTokentype]] == true)
					{
						// Pop o2 off the stack onto the output queue
						[_rpnoutput addObject:[_ops Pop]];
						if ([_ops Count] > 0)
						{
							opstoken = (RPNToken *)[_ops Peek];
						} else
						{
							break;
						}						
					}
				}
				
				// push o1 onto the operator stack
				[_ops Push:token];
			}
			
			
			if ([tokenpart isEqualToString:@"*"] == TRUE) {
				[token setTokentype:Multiply];
				
				if ([_ops Count] > 0) 
				{
					opstoken = (RPNToken *)[_ops Peek];
					
					while ([self IsOperatorToken:[opstoken getTokentype]] == true)
					{
						if ([opstoken getTokentype] == Plus || [opstoken getTokentype] == Minus) 
						{
							break;
						}
						else {
							// Once we're in here, the following algorithm condition is satisfied.
							// o1 is associative or left-associative and its precedence is less than (lower precedence) or equal to that of o2, or
							// o1 is right-associative and its precedence is less than (lower precedence) that of o2,
							
							// pop o2 off the stack, onto the output queue;
							[_rpnoutput addObject:[_ops Pop]];
							
							if ([_ops Count] > 0)
							{
								opstoken = (RPNToken *)[_ops Peek];
							}
							else 
							{
								break;
							}
						}
					}
				}
				// push o1 onto the operator stack
				[_ops Push:token];
			}
			
			
			if ([tokenpart isEqualToString:@"/"] == TRUE) {
				[token setTokentype:Divide];
				
				if ([_ops Count] > 0)
				{
					opstoken = (RPNToken *)[_ops Peek];
					// while there is an operator, o2, at the top of the stack
					while ([self IsOperatorToken:[opstoken getTokentype]] == true)
					{
						if ([opstoken getTokentype] == Plus || [opstoken getTokentype] == Minus)
						{
							break;
						}
						else {
							// Once we're in here, the following algorithm condition is satisfied.
							// o1 is associative or left-associative and its precedence is less than (lower precedence) or equal to that of o2, or
							// o1 is right-associative and its precedence is less than (lower precedence) that of o2,
							
							// pop o2 off the stack, onto the output queue;
							[_rpnoutput addObject:[_ops Pop]];
							if ([_ops Count] > 0)
							{
								opstoken = (RPNToken *)[_ops Peek];
							}
							else {
								break;
							}
						}
					}
				}
				// push o1 onto the operator stack
				[_ops Push:token];
			}
			
			
			
			if ([tokenpart isEqualToString:@"^"] == TRUE) {
				[token setTokentype:Exponent];
				[_ops Push:token];
			}
			
			
			if ([tokenpart isEqualToString:@"~"] == TRUE) {
				[token setTokentype:UnaryMinus];
				[_ops Push:token];
			}
			
			
			if ([tokenpart isEqualToString:@"("] == TRUE) {
				[token setTokentype:LeftParenthesis];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@")"] == TRUE) {
				[token setTokentype:RightParenthesis];
				if ([_ops Count] > 0)
				{
					opstoken = (RPNToken *)[_ops Peek];
					
					while ([opstoken getTokentype]!=LeftParenthesis)
					{
						// pop operators off the stack onto the output queue
						[_rpnoutput addObject:[_ops Pop]];
						if ([_ops Count] > 0)
						{
							opstoken = (RPNToken *)[_ops Peek];
						} else {
							return false;
						}
					}
					// Pop the left parenthesis from the stack, but not onto the output queue
					[_ops Pop];
				}
				
				
				if ([_ops Count] > 0)
				{
					opstoken = (RPNToken *)[_ops Peek];
					// If the token is at the top of the stack it is a function token
					
					if ([self IsFunctionToken:[opstoken getTokentype]] == true)
					{
						[_rpnoutput addObject:[_ops Pop]];
					}					
				}
			}
			
			
			if ([tokenpart isEqualToString:@"pi"] == TRUE) {
				[token setTokentype:Constant];
				[_rpnoutput addObject:token];
			}
			
			
			if ([tokenpart isEqualToString:@"e"] == TRUE) {
				[token setTokentype:Constant];
				[_rpnoutput addObject:token];
			}
			
			if ([tokenpart isEqualToString:@"sin"] == TRUE) {
				[token setTokentype:Sine];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"cos"] == TRUE) {
				[token setTokentype:Cosine];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"tan"] == TRUE) {
				[token setTokentype:Tangent];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"sinh"] == TRUE) {
				[token setTokentype:HyperbolicSine];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"cosh"] == TRUE) {
				[token setTokentype:HyperbolicCosine];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"tanh"] == TRUE) {
				[token setTokentype:HyperbolicTangent];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"asin"] == TRUE) {
				[token setTokentype:InverseSine];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"acos"] == TRUE) {
				[token setTokentype:InverseCosine];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"atan"] == TRUE) {
				[token setTokentype:InverseTangent];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"asinh"] == TRUE) {
				[token setTokentype:InverseHyperbolicSine];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"acosh"] == TRUE) {
				[token setTokentype:InverseHyperbolicCosine];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"atanh"] == TRUE) {
				[token setTokentype:InverseHyperbolicTangent];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"x2"] == TRUE) {
				[token setTokentype:Squared];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"log"] == TRUE) {
				[token setTokentype:Logarithm];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"log2"] == TRUE) {
				[token setTokentype:LogarithmBase2];
				[_ops Push:token];
			}	
			
			if ([tokenpart isEqualToString:@"sqrt"] == TRUE) {
				[token setTokentype:SquareRoot];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"cbrt"] == TRUE) {
				[token setTokentype:CubeRoot];
				[_ops Push:token];
			}
			
			if ([tokenpart isEqualToString:@"%"] == TRUE) {
				[token setTokentype:Percentage];
				[_ops Push:token];
			}
		}
		
		//[token release];
	}
	
	// When there are no more tokens to read
	
	// While there are still operator tokens in the stack
	
	while ([_ops Count] != 0)
	{
		opstoken = (RPNToken *)[_ops Pop];
		
		// If the operator token on the top of the stack is a parenthesis
		if ([opstoken getTokentype] == LeftParenthesis)
		{
			return false;
		}
		else
		{
			[_rpnoutput addObject:opstoken];
			NSLog (@"Added final operator token to the output queue.");
		}
	}
	
	[_postfixexpression setString:@""];
	int p;
	
	for (p=0;p<[_rpnoutput count];p++) {
	
		opstoken = (RPNToken *)[_rpnoutput objectAtIndex:p];
		
		[_postfixexpression appendString:[opstoken getTokenvalue]];
		[_postfixexpression appendString:@" "];
		
	}
	
	
	//[opstoken release];
	//[token release];
	//[tokenisedList release];
	
	
	NSLog (@"Post Fix Expression is: %@", _postfixexpression);
	
	return true;
	
}

- (double) Evaluate
{
	Stack *result;
	result = [Stack new];
	
	[result Initialise];
	
	double oper1 = 0.0;
	double oper2 = 0.0;
	double operresult = 0.0;
	NSNumber *tokenNumber;
	
	RPNToken *token;
	token = [RPNToken new];
	
	int i = 0;
	
	for (i=0;i<[_rpnoutput count];++i)
	{
		// Read the next token from input;
		token = (RPNToken *)[_rpnoutput objectAtIndex:i];
		
		switch ([token getTokentype])
		{
			case Number:
			{
				tokenNumber = [[NSNumber alloc] initWithDouble:[[token getTokenvalue] doubleValue]];				
				[result Push:tokenNumber];
			}
			break;
			case Constant:
			{
				tokenNumber = [[NSNumber alloc] initWithDouble:[self EvaluateConstant:[token getTokenvalue]]];
				[result Push:tokenNumber];
			}
			break;
			case Modulus:
			{
				if ([result Count] >= 2)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper2 = [tokenNumber doubleValue];
					
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					// Evaluate the function, with the values as arguments
					// Push the returned results, if any, back onto the results stack
					int i1 = oper1;
					int i2 = oper2;
					int ires = 0;
					
					//operresult = oper1 % oper2;
					ires = i1 % i2;
					tokenNumber = [[NSNumber alloc] initWithInt:ires];
					[result Push:tokenNumber];
				}
				else 
				{
					// Evaluation error!
				}
			}
			break;
			case Plus:
			{
				if ([result Count] >= 2)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper2 = [tokenNumber doubleValue];
					
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					// Evaluate the function, with the values as arguments
					// Push the returned results, if any, back onto the results stack
					operresult = oper1 + oper2;
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else 
				{
					// Evaluation error!
				}
			}
			break;
			case Minus:
			{
				if ([result Count] >= 2)
				{
					// So, pop the top n values from the stack
					tokenNumber = (NSNumber *)[result Pop];
					oper2 = [tokenNumber doubleValue];
					
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = oper1 - oper2;
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else 
				{
					// Evaluation error!
				}

			}
			break;
				
			case Multiply:
			{
				if ([result Count] >= 2)
				{
					// So, pop the top n values from the stack
					tokenNumber = (NSNumber *)[result Pop];
					oper2 = [tokenNumber doubleValue];
					
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = oper1 * oper2;
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else 
				{
					// Evaluation error!
				}
			}
			break;
				
			case Divide:
			{
				if ([result Count] >= 2)
				{
					// So, pop the top n values from the stack
					tokenNumber = (NSNumber *)[result Pop];
					oper2 = [tokenNumber doubleValue];
					
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = oper1 / oper2;
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					
					
					[result Push:tokenNumber];
				}
				else 
				{
					// Evaluation error!
				}	
			}
			break;
				
			case Exponent:
			{
				if ([result Count] >= 2)
				{
					// So, pop the top n values from the stack
					tokenNumber = (NSNumber *)[result Pop];
					oper2 = [tokenNumber doubleValue];
					
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = pow(oper1, oper2);
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else 
				{
					// Evaluation error!
				}
			}
			break;
				
			case UnaryMinus:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = -oper1;
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}
			}
			break;
				
			case Sine:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					//double radians = (M_PI * oper1) / 180;
					if (_busingradians == true)
					{
						operresult = sin(oper1);
					}
					else 
					{
						operresult = sin( (M_PI * oper1) / 180);
					}
					
					
					
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
			break;
				
			case Cosine:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					if (_busingradians == true)
					{
						operresult = cos(oper1);
					}
					else 
					{
						operresult = cos( (M_PI * oper1) / 180);
					}
					
					
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
			break;
				
			case Tangent:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					if (_busingradians == true)
					{
						operresult = tan(oper1);
					}
					else 
					{
						operresult = tan( (M_PI * oper1) / 180);
					}
					
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
			break;
			
				
			case HyperbolicSine:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					//double radians = (M_PI * oper1) / 180;
					operresult = sinh( oper1);
					
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
				break;
				
			case HyperbolicCosine:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = cosh(oper1);
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
				break;
				
			case HyperbolicTangent:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = tanh(oper1);
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
			break;
				
				
				
				
				
				
				
				
			case InverseSine:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					double rads = asin (oper1);
					if (_busingradians == true)
					{
						operresult = rads;
					}
					else
					{
						operresult = rads * (180 / M_PI);
					}
					
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
				break;
				
			case InverseCosine:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					double rads = acos (oper1);
					if (_busingradians == true)
					{
						operresult = rads;
					}
					else 
					{
						operresult = rads * (180 / M_PI);
					}
					
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
				break;
				
			case InverseTangent:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					double rads = atan (oper1);
					if (_busingradians == true)
					{
						operresult = rads;
					}
					else
					{
						operresult = rads * (180 / M_PI);
					}
										
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
				break;
				
				
			case InverseHyperbolicSine:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					//double radians = (M_PI * oper1) / 180;
					operresult = asinh( oper1);
					
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
				break;
				
			case InverseHyperbolicCosine:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = acosh(oper1);
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
				break;
				
			case InverseHyperbolicTangent:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = atanh(oper1);
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
				break;
				
				
			case Logarithm:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = log10(oper1);
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
			break;
				
			case LogarithmBase2:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = log2(oper1);
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
			break;
				
			case Squared:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = (oper1*oper1);
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
			break;
				
			case SquareRoot:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = sqrt(oper1);
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
			break;
		
			case CubeRoot:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = cbrt(oper1);
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
			break;
				
			case Percentage:
			{
				if ([result Count] >= 1)
				{
					tokenNumber = (NSNumber *)[result Pop];
					oper1 = [tokenNumber doubleValue];
					
					operresult = oper1 / 100;
					tokenNumber = [[NSNumber alloc] initWithDouble:operresult];
					[result Push:tokenNumber];
				}
				else
				{
					// Evaluation error!
				}	
			}
			break;
		}
	}
	
	// If there is only one value in the stack
	if ([result Count] == 1)
	{
		tokenNumber = [NSNumber new];
		
		// that value is the result of the calculation
		tokenNumber = (NSNumber *)[result Pop];
		
		NSLog (@"returning tokenNumber: %@", tokenNumber);
		
		operresult = [tokenNumber doubleValue];
		NSLog (@"Returning result: %f", operresult);
		
		
		//[_rpnoutput release];
		//[_ops release];
		//[result release];
		//[token release];
		
		
		return operresult;
	}
	else 
	{
		// Evaluation error!
	}

	//[_rpnoutput release];
	//[_ops release];
	//[result release];
	//[token release];
	
	return 0.0;
}

- (bool) IsOperatorToken:(TokenType)tokentype
{
	bool result = false;
	
	switch (tokentype)
	{
		case Plus:
		case Minus:
		case Multiply:
		case Divide:
		case Exponent:
		case Modulus:
		case UnaryMinus:
		{
			result = true;
		}
		break;
		default:
		{
			result = false;
		}
		break;
	}
	
	return result;
}

- (bool) IsFunctionToken:(TokenType)tokentype
{
	bool result = false;
	
	switch (tokentype)
	{
		case HyperbolicSine:
		case HyperbolicCosine:
		case HyperbolicTangent:
		case Logarithm:
		case Percentage:
		case SquareRoot:
		case Sine:
		case Cosine:
		case Tangent:
		{
			result = true;
		}
		break;
		default:
		{
			result = false;
		}
		break;
	}
	
	return result;
}

- (double) EvaluateConstant:(NSString *)tokenValue
{
	double result = 0.0;
	
	if ([tokenValue isEqualToString:@"pi"] == true) 
	{
		result = M_PI;
	}
	
	if ([tokenValue isEqualToString:@"e"] == true)
	{
		result = M_E;
	}
	
	return result;
}

@end
