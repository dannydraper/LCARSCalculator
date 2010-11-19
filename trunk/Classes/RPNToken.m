//
//  RPNToken.m
//  HyperCalc
//
//  Created by Danny Draper on 04/06/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import "RPNToken.h"



@implementation RPNToken

- (void) setTokentype:(TokenType)tokentype
{
	tokenType = tokentype;
	//NSLog(@"Token type set to %d",tokentype);
}

- (void) setTokenvalue:(NSString *)tokenvalue
{
	tokenValue = tokenvalue;
	//NSLog(@"Token value set to %@", tokenvalue);
}

- (TokenType) getTokentype
{
	return tokenType;
}

- (NSString *) getTokenvalue
{
	return tokenValue;
}

@end
