//
//  SmallAlpha.m
//  LCARS Calc
//
//  Created by Danny Draper on 26/08/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import "SmallAlpha.h"


@implementation SmallAlpha


- (void) Initialise:(CGFloat)offx: (CGFloat)offy: (CGFloat) standardwidth: (CGFloat) iletterwidth: (CGFloat) mletterwidth: (CGFloat) wletterwidth: (CGFloat) charheight: (CGFloat) sepwidth: (CGFloat) stopwidth: (bool) containsmathchars: (bool)containspowersymbol: (NSString *) resourcename;
{
		
	_curframe = 0;
	_visible = false;
	
	_charheight = charheight;
	_rightjustification = false;
	_sepwidth = sepwidth;
	_stopwidth = stopwidth;
	CGFloat startx = offx;
	CGFloat starty = offy;
	
	CGFloat yoffset = 0.0f;
	CGFloat xoffset = 0.0f;
	
	_containsmathcharacters = containsmathchars;
	_containspowersymbol = containspowersymbol;
	
	_alphabet = [NSMutableArray new];
	_alphastring = [NSMutableString new];
	_imageresource = [NSMutableString new];
	[_imageresource setString:resourcename];
	
	_standardwidth = standardwidth;
	_iletterwidth = iletterwidth;
	_mletterwidth = mletterwidth;
	_wletterwidth = wletterwidth;
		
	UIImage *alphafontmap;
	
	alphafontmap = [UIImage imageNamed:_imageresource];
	
	
	CGRect imageRect;
	UIImage *frame1;
	
	int i = 0;
	
	/*
	 The letter i, m and w have different character widths than the
	 standard width supplied so we need to check for these explicitly
	 i = 9
	 m = 13
	 w = 23
	 
	 */
	
	// First level of alphabet characters
	bool bUsestandardwidth = true;
	
	int maxchars = 0;
	
	if (_containsmathcharacters == true) {
		maxchars = 46;
		
		if (_containspowersymbol == true) {
			maxchars = 47;
		}
		
	} else {
		maxchars = 39;
	}
	
	
	for (i=0;i<maxchars;++i)
	{
		bUsestandardwidth = true;
		imageRect.origin = CGPointMake (startx + xoffset, starty + yoffset);
		
		if (i == 9) {
			imageRect.size = CGSizeMake(_iletterwidth+_sepwidth, _charheight);
			bUsestandardwidth = false;
			xoffset+=_iletterwidth;
		} 
		
		if (i == 13) {
			imageRect.size = CGSizeMake(_mletterwidth+_sepwidth, _charheight);
			bUsestandardwidth = false;
			xoffset+=_mletterwidth;
		}
		
		if (i == 23) {
			imageRect.size = CGSizeMake(_wletterwidth+_sepwidth, _charheight);
			bUsestandardwidth = false;
			xoffset+=_wletterwidth;
		}
		
		if (bUsestandardwidth == true) {
			imageRect.size = CGSizeMake(_standardwidth+_sepwidth, _charheight);
			xoffset+=_standardwidth;
		}
		
		frame1 = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([alphafontmap CGImage], imageRect)];
		[_alphabet addObject:frame1];
	}
}

- (void) setRightjustification:(bool)rightjust
{
	_rightjustification = rightjust;
}

- (void) setAlphastring:(NSString *)alphastring
{
	[_alphastring setString:alphastring];
	
}

- (NSString *) getAlphastring
{
	return _alphastring;
}

- (void) setVisible:(bool)visible
{
	_visible = visible;
}

- (void) setLocation:(CGPoint)location
{
	_location = location;
}

- (void) PaintString
{
	if (_visible == false)
	{
		return;
	}
	
	int c = 0;
	
	CGFloat xoffset = 0.0f;
	CGFloat xrightoffset = 0.0f;
	CGFloat xincrement = _sepwidth;
	
	CGFloat xlocation = _location.x;
	CGFloat ylocation = _location.y;
	CGFloat currentwidth = 0.0f;
	
	for (c=0;c<[_alphastring length];++c)
	{
		UniChar singlechar = [_alphastring characterAtIndex:c];
		frame = nil;
		
		if (singlechar == ' ') {frame = [_alphabet objectAtIndex:0];}		
		if (singlechar == 'A') {frame = [_alphabet objectAtIndex:1];}		
		if (singlechar == 'B') {frame = [_alphabet objectAtIndex:2];}
		if (singlechar == 'C') {frame = [_alphabet objectAtIndex:3];}
		if (singlechar == 'D') {frame = [_alphabet objectAtIndex:4];}		
		if (singlechar == 'E') {frame = [_alphabet objectAtIndex:5];}
		if (singlechar == 'F') {frame = [_alphabet objectAtIndex:6];}		
		if (singlechar == 'G') {frame = [_alphabet objectAtIndex:7];}
		if (singlechar == 'H') {frame = [_alphabet objectAtIndex:8];}		
		if (singlechar == 'I') {frame = [_alphabet objectAtIndex:9];}		
		if (singlechar == 'J') {frame = [_alphabet objectAtIndex:10];}		
		if (singlechar == 'K') {frame = [_alphabet objectAtIndex:11];}		
		if (singlechar == 'L') {frame = [_alphabet objectAtIndex:12];}		
		if (singlechar == 'M') {frame = [_alphabet objectAtIndex:13];}		
		if (singlechar == 'N') {frame = [_alphabet objectAtIndex:14];}		
		if (singlechar == 'O') {frame = [_alphabet objectAtIndex:15];}		
		if (singlechar == 'P') {frame = [_alphabet objectAtIndex:16];}		
		if (singlechar == 'Q') {frame = [_alphabet objectAtIndex:17];}		
		if (singlechar == 'R') {frame = [_alphabet objectAtIndex:18];}		
		if (singlechar == 'S') {frame = [_alphabet objectAtIndex:19];}		
		if (singlechar == 'T') {frame = [_alphabet objectAtIndex:20];}
		if (singlechar == 'U') {frame = [_alphabet objectAtIndex:21];}		
		if (singlechar == 'V') {frame = [_alphabet objectAtIndex:22];}		
		if (singlechar == 'W') {frame = [_alphabet objectAtIndex:23];}		
		if (singlechar == 'X') {frame = [_alphabet objectAtIndex:24];}		
		if (singlechar == 'Y') {frame = [_alphabet objectAtIndex:25];}		
		if (singlechar == 'Z') {frame = [_alphabet objectAtIndex:26];}		
		if (singlechar == '.') {frame = [_alphabet objectAtIndex:27];}		
		if (singlechar == ',') {frame = [_alphabet objectAtIndex:28];}		
		if (singlechar == '1') {frame = [_alphabet objectAtIndex:29];}		
		if (singlechar == '2') {frame = [_alphabet objectAtIndex:30];}		
		if (singlechar == '3') {frame = [_alphabet objectAtIndex:31];}		
		if (singlechar == '4') {frame = [_alphabet objectAtIndex:32];}		
		if (singlechar == '5') {frame = [_alphabet objectAtIndex:33];}		
		if (singlechar == '6') {frame = [_alphabet objectAtIndex:34];}		
		if (singlechar == '7') {frame = [_alphabet objectAtIndex:35];}		
		if (singlechar == '8') {frame = [_alphabet objectAtIndex:36];}
		if (singlechar == '9') {frame = [_alphabet objectAtIndex:37];}
		if (singlechar == '0') {frame = [_alphabet objectAtIndex:38];}
		
		if (_containsmathcharacters == true) {		
			if (singlechar == '(') {frame = [_alphabet objectAtIndex:39];}		
			if (singlechar == ')') {frame = [_alphabet objectAtIndex:40];}		
			if (singlechar == '+') {frame = [_alphabet objectAtIndex:41];}
			if (singlechar == '-') {frame = [_alphabet objectAtIndex:42];}		
			if (singlechar == '*') {frame = [_alphabet objectAtIndex:43];}
			if (singlechar == '/') {frame = [_alphabet objectAtIndex:44];}
			if (singlechar == '=') {frame = [_alphabet objectAtIndex:45];}
			
			if (_containspowersymbol == true) {
				if (singlechar == '^') {frame = [_alphabet objectAtIndex:46];}
			}
			
		}
		
		if (frame != nil) {
			if (_rightjustification == false) {
				[frame drawAtPoint:CGPointMake(xlocation + xoffset, ylocation)];
			}
					
		
			currentwidth = _standardwidth;
		
			if (singlechar == 'I') {currentwidth = _iletterwidth;}
			if (singlechar == 'M') {currentwidth = _mletterwidth;}
			if (singlechar == 'W') {currentwidth = _wletterwidth;}
			if (singlechar == '.') {currentwidth = _stopwidth;}
		
			xoffset+=currentwidth+xincrement;
			
			if (_rightjustification == true) {
				xrightoffset = xoffset;
			}
		}
	}
	
	if (_rightjustification == true) {
		xoffset = 0.0f;
		
		for (c=0;c<[_alphastring length];++c)
		{
			UniChar singlechar = [_alphastring characterAtIndex:c];
			frame = nil;
			
			if (singlechar == ' ') {frame = [_alphabet objectAtIndex:0];}		
			if (singlechar == 'A') {frame = [_alphabet objectAtIndex:1];}		
			if (singlechar == 'B') {frame = [_alphabet objectAtIndex:2];}
			if (singlechar == 'C') {frame = [_alphabet objectAtIndex:3];}
			if (singlechar == 'D') {frame = [_alphabet objectAtIndex:4];}		
			if (singlechar == 'E') {frame = [_alphabet objectAtIndex:5];}
			if (singlechar == 'F') {frame = [_alphabet objectAtIndex:6];}		
			if (singlechar == 'G') {frame = [_alphabet objectAtIndex:7];}
			if (singlechar == 'H') {frame = [_alphabet objectAtIndex:8];}		
			if (singlechar == 'I') {frame = [_alphabet objectAtIndex:9];}		
			if (singlechar == 'J') {frame = [_alphabet objectAtIndex:10];}		
			if (singlechar == 'K') {frame = [_alphabet objectAtIndex:11];}		
			if (singlechar == 'L') {frame = [_alphabet objectAtIndex:12];}		
			if (singlechar == 'M') {frame = [_alphabet objectAtIndex:13];}		
			if (singlechar == 'N') {frame = [_alphabet objectAtIndex:14];}		
			if (singlechar == 'O') {frame = [_alphabet objectAtIndex:15];}		
			if (singlechar == 'P') {frame = [_alphabet objectAtIndex:16];}		
			if (singlechar == 'Q') {frame = [_alphabet objectAtIndex:17];}		
			if (singlechar == 'R') {frame = [_alphabet objectAtIndex:18];}		
			if (singlechar == 'S') {frame = [_alphabet objectAtIndex:19];}		
			if (singlechar == 'T') {frame = [_alphabet objectAtIndex:20];}
			if (singlechar == 'U') {frame = [_alphabet objectAtIndex:21];}		
			if (singlechar == 'V') {frame = [_alphabet objectAtIndex:22];}		
			if (singlechar == 'W') {frame = [_alphabet objectAtIndex:23];}		
			if (singlechar == 'X') {frame = [_alphabet objectAtIndex:24];}		
			if (singlechar == 'Y') {frame = [_alphabet objectAtIndex:25];}		
			if (singlechar == 'Z') {frame = [_alphabet objectAtIndex:26];}		
			if (singlechar == '.') {frame = [_alphabet objectAtIndex:27];}		
			if (singlechar == ',') {frame = [_alphabet objectAtIndex:28];}		
			if (singlechar == '1') {frame = [_alphabet objectAtIndex:29];}		
			if (singlechar == '2') {frame = [_alphabet objectAtIndex:30];}		
			if (singlechar == '3') {frame = [_alphabet objectAtIndex:31];}		
			if (singlechar == '4') {frame = [_alphabet objectAtIndex:32];}		
			if (singlechar == '5') {frame = [_alphabet objectAtIndex:33];}		
			if (singlechar == '6') {frame = [_alphabet objectAtIndex:34];}		
			if (singlechar == '7') {frame = [_alphabet objectAtIndex:35];}		
			if (singlechar == '8') {frame = [_alphabet objectAtIndex:36];}
			if (singlechar == '9') {frame = [_alphabet objectAtIndex:37];}
			if (singlechar == '0') {frame = [_alphabet objectAtIndex:38];}
			
			if (_containsmathcharacters == true) {		
				if (singlechar == '(') {frame = [_alphabet objectAtIndex:39];}		
				if (singlechar == ')') {frame = [_alphabet objectAtIndex:40];}		
				if (singlechar == '+') {frame = [_alphabet objectAtIndex:41];}
				if (singlechar == '-') {frame = [_alphabet objectAtIndex:42];}		
				if (singlechar == '*') {frame = [_alphabet objectAtIndex:43];}
				if (singlechar == '/') {frame = [_alphabet objectAtIndex:44];}
				if (singlechar == '=') {frame = [_alphabet objectAtIndex:45];}
				
				if (_containspowersymbol == true) {
					if (singlechar == '^') {frame = [_alphabet objectAtIndex:46];}
				}
			}
			
			if (frame != nil) {
				if (_rightjustification == true) {
					[frame drawAtPoint:CGPointMake(xlocation - xrightoffset + xoffset, ylocation)];
				}
				
				
				currentwidth = _standardwidth;
				
				if (singlechar == 'I') {currentwidth = _iletterwidth;}
				if (singlechar == 'M') {currentwidth = _mletterwidth;}
				if (singlechar == 'W') {currentwidth = _wletterwidth;}
				if (singlechar == '.') {currentwidth = _stopwidth;}
				
				xoffset+=currentwidth+xincrement;
				
			}
		}
	}
}


- (void) Paint
{
	
}

@end
