//
//  CalcView.m
//  LCARS Calc
//
//  Created by Danny Draper on 20/08/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import "CalcView.h"

/*
 
 v1.01
  - Fixed a crash on startup error that would occur on iOS 4.2.
 
 */

@implementation CalcView

@synthesize btn_historyselect1;
@synthesize btn_historyselect2;
@synthesize btn_historyselect3;
@synthesize btn_historyselect4;
@synthesize btn_historyselect5;
@synthesize btn_historyselect6;
@synthesize btn_historyselect7;
@synthesize btn_historyselect8;
@synthesize btn_historyselect9;


- (id)initWithCoder:(NSCoder *)coder
{
	if ((self = [super initWithCoder:coder])) {
		
		_convertfromalpha = [SmallAlpha new];
		_converttoalpha = [SmallAlpha new];
		_converttype = [SmallAlpha new];
		_calcalpha = [SmallAlpha new];
		_memalpha = [SmallAlpha new];
		
		_historyline1 = [SmallAlpha new];
		_historyline2 = [SmallAlpha new];
		_historyline3 = [SmallAlpha new];
		_historyline4 = [SmallAlpha new];
		_historyline5 = [SmallAlpha new];
		_historylineB = [SmallAlpha new];
		_historyline7 = [SmallAlpha new];
		_historyline8 = [SmallAlpha new];
		_historyline9 = [SmallAlpha new];
				
		//[_smallalpha Initialise:3.0f :3.0f :11.0f :25.0f :11.0f :@"UCAlpha.png"];
		
		[_convertfromalpha Initialise:2.0f :3.0f :12.0f :6.0f :15.0f :16.0f :25.0f :-1.0f: 6.0f: false: false :@"UCAlpha.png"];
		[_convertfromalpha setLocation:CGPointMake(711.0f, 340.0f)];
		[_convertfromalpha setVisible:true];
		
		[_converttoalpha Initialise:2.0f :3.0f :12.0f :6.0f :15.0f :16.0f :25.0f :-1.0f : 6.0f: false: false: @"UCAlpha.png"];
		[_converttoalpha setLocation:CGPointMake(711.0f, 440.0f)];
		[_converttoalpha setVisible:true];
		
		//[_smallalpha setAlphastring:@"THE QUICK BROWN FOX JUMPED OVER THE LAZY DOG"];
		//[_smallalpha setAlphastring:@"CENTIMETERS"];
		
		[_converttype Initialise:5.0f :3.0f :14.0f :8.0f :18.0f :19.0f :33.0f : -1.0f : 8.0f: true : false: @"UCTypeAlpha.png"];
		[_converttype setLocation:CGPointMake (712.0f, 390.0f)];
		[_converttype setVisible:true];
		
		[_calcalpha Initialise:6.0f :5.0f :29.0f :13.0f :37.0f :41.0f :74.0f :-1.0f : 13.0f: true : false: @"CalcAlpha.png"];
		[_calcalpha setLocation:CGPointMake(947.0f, 170.0f)];
		[_calcalpha setVisible:true];
		[_calcalpha setRightjustification:true];
		
		[_calcalpha setAlphastring:@"0"];
		
		[_memalpha Initialise:3.0f :3.0f :21.0f :10.0f :26.0f :29.0f :53.0f :-1.0f :10.0f :true : true: @"MemAlpha.png"];
		[_memalpha setLocation:CGPointMake(947.0f, 95.0f)];
		[_memalpha setVisible:true];
		[_memalpha setRightjustification:true];
		
		[_memalpha setAlphastring:@"0"];
		
		
		[_historyline1 Initialise:5.0f :3.0f :14.0f :8.0f :18.0f :19.0f :33.0f : -1.0f : 8.0f: true : false: @"UCTypeAlpha.png"];
		[_historyline1 setLocation:CGPointMake (915.0f, 341.0f)];
		[_historyline1 setVisible:true];
		[_historyline1 setRightjustification:true];
		
		[_historyline2 Initialise:5.0f :3.0f :14.0f :8.0f :18.0f :19.0f :33.0f : -1.0f : 8.0f: true : false: @"UCTypeAlpha.png"];
		[_historyline2 setLocation:CGPointMake (915.0f, 381.0f)];
		[_historyline2 setVisible:true];
		[_historyline2 setRightjustification:true];
		
		[_historyline3 Initialise:5.0f :3.0f :14.0f :8.0f :18.0f :19.0f :33.0f : -1.0f : 8.0f: true : false: @"UCTypeAlpha.png"];
		[_historyline3 setLocation:CGPointMake (915.0f, 421.0f)];
		[_historyline3 setVisible:true];
		[_historyline3 setRightjustification:true];
		
		[_historyline4 Initialise:5.0f :3.0f :14.0f :8.0f :18.0f :19.0f :33.0f : -1.0f : 8.0f: true : false: @"UCTypeAlpha.png"];
		[_historyline4 setLocation:CGPointMake (915.0f, 461.0f)];
		[_historyline4 setVisible:true];
		[_historyline4 setRightjustification:true];
		
		[_historyline5 Initialise:5.0f :3.0f :14.0f :8.0f :18.0f :19.0f :33.0f : -1.0f : 8.0f: true : false: @"UCTypeAlpha.png"];
		[_historyline5 setLocation:CGPointMake (915.0f, 501.0f)];
		[_historyline5 setVisible:true];
		[_historyline5 setRightjustification:true];
		
		[_historylineB Initialise:5.0f :3.0f :14.0f :8.0f :18.0f :19.0f :33.0f : -1.0f : 8.0f: true : false: @"UCTypeAlpha.png"];
		[_historylineB setLocation:CGPointMake (915.0f, 541.0f)];
		[_historylineB setVisible:true];
		[_historylineB setRightjustification:true];
		
		[_historyline7 Initialise:5.0f :3.0f :14.0f :8.0f :18.0f :19.0f :33.0f : -1.0f : 8.0f: true : false: @"UCTypeAlpha.png"];
		[_historyline7 setLocation:CGPointMake (915.0f, 581.0f)];
		[_historyline7 setVisible:true];
		[_historyline7 setRightjustification:true];

		[_historyline8 Initialise:5.0f :3.0f :14.0f :8.0f :18.0f :19.0f :33.0f : -1.0f : 8.0f: true : false: @"UCTypeAlpha.png"];
		[_historyline8 setLocation:CGPointMake (915.0f, 621.0f)];
		[_historyline8 setVisible:true];
		[_historyline8 setRightjustification:true];
		
		[_historyline9 Initialise:5.0f :3.0f :14.0f :8.0f :18.0f :19.0f :33.0f : -1.0f : 8.0f: true : false: @"UCTypeAlpha.png"];
		[_historyline9 setLocation:CGPointMake (915.0f, 661.0f)];
		[_historyline9 setVisible:true];
		[_historyline9 setRightjustification:true];
		
		[_historyline1 setAlphastring:@""];
		[_historyline2 setAlphastring:@""];
		[_historyline3 setAlphastring:@""];
		[_historyline4 setAlphastring:@""];
		[_historyline5 setAlphastring:@""];	
		[_historylineB setAlphastring:@""];
		[_historyline7 setAlphastring:@""];
		[_historyline8 setAlphastring:@""];
		[_historyline9 setAlphastring:@""];
	
		
		//[self setNeedsDisplay];
		
		NSLog (@"The small alphabet has been initialised.");
	}
	return self;
}

- (void)ClearHistoryLines
{
	[_historyline1 setAlphastring:@""];
	[_historyline2 setAlphastring:@""];
	[_historyline3 setAlphastring:@""];
	[_historyline4 setAlphastring:@""];
	[_historyline5 setAlphastring:@""];	
	[_historylineB setAlphastring:@""];
	[_historyline7 setAlphastring:@""];
	[_historyline8 setAlphastring:@""];
	[_historyline9 setAlphastring:@""];
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void)setConvertFromString:(NSString *)stringtext
{
	[_convertfromalpha setAlphastring:stringtext];
	[self setNeedsDisplay];
}

- (void)setConvertToString:(NSString *)stringtext
{
	[_converttoalpha setAlphastring:stringtext];
	[self setNeedsDisplay];
}

- (void)setConvertTypeString:(NSString *)stringtext
{
	[_converttype setAlphastring:stringtext];
	[self setNeedsDisplay];
}

- (void)setCalcString:(NSString *)stringtext
{
	[_calcalpha setAlphastring:stringtext];
	[self setNeedsDisplay];
}

- (void)setMemString:(NSString *)stringtext
{
	[_memalpha setAlphastring:stringtext];
	[self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	
	[_convertfromalpha PaintString];
	[_converttoalpha PaintString];
	[_converttype PaintString];
	[_calcalpha PaintString];
	[_memalpha PaintString];
	
	[_historyline1 PaintString];
	[_historyline2 PaintString];
	[_historyline3 PaintString];
	[_historyline4 PaintString];
	[_historyline5 PaintString];	
	[_historylineB PaintString];
	[_historyline7 PaintString];
	[_historyline8 PaintString];
	[_historyline9 PaintString];
	
	NSLog (@"CalcView paint string has been called.");
	
}

- (NSString *) getHistoryline:(int)linenum
{
	if (linenum == 0) {return [_historyline1 getAlphastring];}
	if (linenum == 1) {return [_historyline2 getAlphastring];}
	if (linenum == 2) {return [_historyline3 getAlphastring];}
	if (linenum == 3) {return [_historyline4 getAlphastring];}
	if (linenum == 4) {return [_historyline5 getAlphastring];}
	if (linenum == 5) {return [_historylineB getAlphastring];}
	if (linenum == 6) {return [_historyline7 getAlphastring];}
	if (linenum == 7) {return [_historyline8 getAlphastring];}
	if (linenum == 8) {return [_historyline9 getAlphastring];}
	
	return [_historyline1 getAlphastring]; // Default only happens if the wrong line num is specified
}

- (void)setHistoryline:(int)linenum:(NSString *)item
{
	/*
	btn_historyselect1.hidden = true;
	btn_historyselect2.hidden = true;
	btn_historyselect3.hidden = true;
	btn_historyselect4.hidden = true;
	btn_historyselect5.hidden = true;
	btn_historyselect6.hidden = true;
	btn_historyselect7.hidden = true;
	btn_historyselect8.hidden = true;
	btn_historyselect9.hidden = true;
	*/
	 
	if (linenum == 0) {[_historyline1 setAlphastring:[item uppercaseString]];}
	if (linenum == 1) {[_historyline2 setAlphastring:[item uppercaseString]];}
	if (linenum == 2) {[_historyline3 setAlphastring:[item uppercaseString]];}
	if (linenum == 3) {[_historyline4 setAlphastring:[item uppercaseString]];}
	if (linenum == 4) {[_historyline5 setAlphastring:[item uppercaseString]];}
	if (linenum == 5) {[_historylineB setAlphastring:[item uppercaseString]];}
	if (linenum == 6) {[_historyline7 setAlphastring:[item uppercaseString]];}
	if (linenum == 7) {[_historyline8 setAlphastring:[item uppercaseString]];}
	if (linenum == 8) {[_historyline9 setAlphastring:[item uppercaseString]];}

	if ([item rangeOfString:@"="].location != NSNotFound) { // If the line contains an equals sign
		if (linenum == 0) {btn_historyselect1.hidden = false;}
		if (linenum == 1) {btn_historyselect2.hidden = false;}
		if (linenum == 2) {btn_historyselect3.hidden = false;}
		if (linenum == 3) {btn_historyselect4.hidden = false;}
		if (linenum == 4) {btn_historyselect5.hidden = false;}
		if (linenum == 5) {btn_historyselect6.hidden = false;}
		if (linenum == 6) {btn_historyselect7.hidden = false;}
		if (linenum == 7) {btn_historyselect8.hidden = false;}
		if (linenum == 8) {btn_historyselect9.hidden = false;}	
	} else {
		if (linenum == 0) {btn_historyselect1.hidden = true;}
		if (linenum == 1) {btn_historyselect2.hidden = true;}
		if (linenum == 2) {btn_historyselect3.hidden = true;}
		if (linenum == 3) {btn_historyselect4.hidden = true;}
		if (linenum == 4) {btn_historyselect5.hidden = true;}
		if (linenum == 5) {btn_historyselect6.hidden = true;}
		if (linenum == 6) {btn_historyselect7.hidden = true;}
		if (linenum == 7) {btn_historyselect8.hidden = true;}
		if (linenum == 8) {btn_historyselect9.hidden = true;}
	}

}

- (void)setHistoryPage:(int)pagenum
{
	
	NSString *currentitem;
	
	if ([_historylist count] < 9) {
		for (int a=0;a<[_historylist count];a++) {
			currentitem = [_historylist objectAtIndex:a];
		
			[self setHistoryline:a :currentitem];
		}
	} else {
		int curhistoryline = 0;
		
		for (int a=[_historylist count]-9;a<[_historylist count];a++) {
			currentitem = [_historylist objectAtIndex:a];
			
			[self setHistoryline:curhistoryline :currentitem];
			curhistoryline++;
		}
	}
}

- (void)setHistoryList:(NSMutableArray *)historylist
{
	_historylist = historylist;
}

- (void)setConvertalphavisible:(bool)visible
{
	[_convertfromalpha setVisible:visible];
	[_converttoalpha setVisible:visible];
	[_converttype setVisible:visible];
}

- (void)setHistoryvisible:(bool)visible
{
	[_historyline1 setVisible:visible];
	[_historyline2 setVisible:visible];
	[_historyline3 setVisible:visible];
	[_historyline4 setVisible:visible];
	[_historyline5 setVisible:visible];
	[_historylineB setVisible:visible];
	[_historyline7 setVisible:visible];
	[_historyline8 setVisible:visible];
	[_historyline9 setVisible:visible];
	
	/*
	btn_historyselect1.hidden = true;
	btn_historyselect2.hidden = true;
	btn_historyselect3.hidden = true;
	btn_historyselect4.hidden = true;
	btn_historyselect5.hidden = true;
	btn_historyselect6.hidden = true;
	btn_historyselect7.hidden = true;
	btn_historyselect8.hidden = true;
	btn_historyselect9.hidden = true;
	 */
}

- (void)setSelectbuttonsvisible:(bool)visible
{
	btn_historyselect1.hidden = !visible;
	btn_historyselect2.hidden = !visible;
	btn_historyselect3.hidden = !visible;
	btn_historyselect4.hidden = !visible;
	btn_historyselect5.hidden = !visible;
	btn_historyselect6.hidden = !visible;
	btn_historyselect7.hidden = !visible;
	btn_historyselect8.hidden = !visible;
	btn_historyselect9.hidden = !visible;
}

- (void)InvalidateDisplay
{
	[self setNeedsDisplay];
}

- (void)dealloc {
    [super dealloc];
}


@end
