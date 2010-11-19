//
//  CalcView.h
//  LCARS Calc
//
//  Created by Danny Draper on 20/08/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallAlpha.h"

@interface CalcView : UIView {
	
	IBOutlet UIButton *btn_historyselect1;
	IBOutlet UIButton *btn_historyselect2;
	IBOutlet UIButton *btn_historyselect3;
	IBOutlet UIButton *btn_historyselect4;
	IBOutlet UIButton *btn_historyselect5;
	IBOutlet UIButton *btn_historyselect6;
	IBOutlet UIButton *btn_historyselect7;
	IBOutlet UIButton *btn_historyselect8;
	IBOutlet UIButton *btn_historyselect9;
	
	SmallAlpha *_convertfromalpha;
	SmallAlpha *_converttoalpha;
	SmallAlpha *_converttype;
	SmallAlpha *_calcalpha;
	SmallAlpha *_memalpha;
	
	SmallAlpha *_historyline1;
	SmallAlpha *_historyline2;
	SmallAlpha *_historyline3;
	SmallAlpha *_historyline4;
	SmallAlpha *_historyline5;
	SmallAlpha *_historylineB;
	SmallAlpha *_historyline7;
	SmallAlpha *_historyline8;
	SmallAlpha *_historyline9;
	
	
	NSMutableArray *_historylist;
	/*
	 CE
	 ±
	 =
	 Mod
	 x^y
	 +
	 -
	 /
	 *
	 (
	 )
	 C
	 Bksp
	 sin
	 cos
	 tan
	 sinh
	 cosh
	 tanh
	 asin
	 acos
	 atan
	 asinh
	 acosh
	 atanh
	 log
	 log2
	 Cbrt
	 Sqrt
	 x2
	 %
	 Rad
	 Deg
	 Inv
	 Std
	 pi
	 e
	 =
	 
	 
	 */
}

@property (retain, nonatomic) UIButton *btn_historyselect1;
@property (retain, nonatomic) UIButton *btn_historyselect2;
@property (retain, nonatomic) UIButton *btn_historyselect3;
@property (retain, nonatomic) UIButton *btn_historyselect4;
@property (retain, nonatomic) UIButton *btn_historyselect5;
@property (retain, nonatomic) UIButton *btn_historyselect6;
@property (retain, nonatomic) UIButton *btn_historyselect7;
@property (retain, nonatomic) UIButton *btn_historyselect8;
@property (retain, nonatomic) UIButton *btn_historyselect9;

- (void)setHistoryline:(int)linenum:(NSString *)item;
- (NSString *) getHistoryline:(int)linenum;
- (void)setHistoryPage:(int)pagenum;
- (void)setHistoryList:(NSMutableArray *)historylist;
- (void)setConvertFromString:(NSString *)stringtext;
- (void)setConvertToString:(NSString *)stringtext;
- (void)setConvertTypeString:(NSString *)stringtext;
- (void)setCalcString:(NSString *)stringtext;
- (void)setMemString:(NSString *)stringtext;
- (void)setConvertalphavisible:(bool)visible;
- (void)setHistoryvisible:(bool)visible;
- (void)InvalidateDisplay;
- (void)setSelectbuttonsvisible:(bool)visible;
- (void)ClearHistoryLines;

@end
