//
//  SmallAlpha.h
//  LCARS Calc
//
//  Created by Danny Draper on 26/08/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SmallAlpha : NSObject {

	NSMutableArray *_alphabet;
	int _curframe;
	NSMutableString *_alphastring;
	//int _dmin;
	//int _dhour;
	bool _visible;
	bool _containsmathcharacters;
	bool _containspowersymbol;
	UIImage *frame;
	CGPoint _location;
	CGFloat _charheight;
	CGFloat _sepwidth;
	CGFloat _stopwidth;
	bool _rightjustification;
	
	CGFloat _standardwidth;
	CGFloat _iletterwidth;
	CGFloat _mletterwidth;
	CGFloat _wletterwidth;
	
	NSMutableString *_imageresource;
}

- (void) setVisible:(bool)visible;
- (void) Initialise:(CGFloat)offx: (CGFloat)offy: (CGFloat) standardwidth: (CGFloat) iletterwidth: (CGFloat) mletterwidth: (CGFloat) wletterwidth: (CGFloat) charheight: (CGFloat) sepwidth: (CGFloat) stopwidth: (bool) containsmathchars: (bool)containspowersymbol: (NSString *) resourcename;
- (void) Paint;
- (NSString *) getAlphastring;
- (void) setAlphastring:(NSString *)clockstring;
- (void) PaintString;
- (void) setLocation:(CGPoint)location;
- (void) setRightjustification:(bool)rightjust;

@end
