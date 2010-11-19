//
//  RPNToken.h
//  HyperCalc
//
//  Created by Danny Draper on 04/06/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	None,
	Number,
	Constant,
	Plus,
	Minus,
	Multiply,
	Divide,
	Exponent,
	UnaryMinus,
	Sine,
	Cosine,
	Tangent,
	HyperbolicSine,
	HyperbolicCosine,
	HyperbolicTangent,
	InverseSine,
	InverseCosine,
	InverseTangent,
	InverseHyperbolicSine,
	InverseHyperbolicCosine,
	InverseHyperbolicTangent,	
	Logarithm,
	LogarithmBase2,
	SquareRoot,
	CubeRoot,
	Squared,
	Percentage,
	Modulus,
	LeftParenthesis,
	RightParenthesis
} TokenType;


@interface RPNToken : NSObject {

	NSString *tokenValue;
	TokenType tokenType;

}

- (void) setTokentype:(TokenType)tokentype;
- (void) setTokenvalue:(NSString *)tokenvalue;
- (TokenType) getTokentype;
- (NSString *) getTokenvalue;

@end
