//
//  LCARS_CalculatorViewController.h
//  LCARS Calculator
//
//  Created by Danny Draper on 18/08/2010.
//  Copyright CedeSoft Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalcView.h"
#import "Calculator.h"
#import "UnitConverter.h"
#import <AudioToolbox/AudioToolbox.h>

@interface LCARS_CalculatorViewController : UIViewController {

	IBOutlet CalcView *calcview;
	
	IBOutlet UIImageView *img_radiansbutton;
	IBOutlet UIImageView *img_Degreesbutton;
	IBOutlet UIImageView *img_Pibutton;
	IBOutlet UIImageView *img_TanInversebutton;
	IBOutlet UIImageView *img_CosInversebutton;
	IBOutlet UIImageView *img_SinInversebutton;
	IBOutlet UIImageView *img_CubeRootbutton;
	IBOutlet UIImageView *img_Backspacebutton;
	IBOutlet UIImageView *img_PlusMinusbutton;
	IBOutlet UIImageView *img_SinHyperbutton;
	IBOutlet UIImageView *img_CosHyperbutton;
	IBOutlet UIImageView *img_TanHyperbutton;
	IBOutlet UIImageView *img_LogBaseTwobutton;
	IBOutlet UIImageView *img_Modbutton;
	IBOutlet UIImageView *img_Eulerbutton;
	IBOutlet UIImageView *img_XSquaredbutton;
	IBOutlet UIImageView *img_XpowYbutton;
	IBOutlet UIImageView *img_Percentbutton;
	IBOutlet UIImageView *img_SquareRootbutton;
	IBOutlet UIImageView *img_Sinbutton;
	IBOutlet UIImageView *img_Cosbutton;
	IBOutlet UIImageView *img_Tanbutton;
	IBOutlet UIImageView *img_Logbutton;
	IBOutlet UIImageView *img_Plusbutton;
	IBOutlet UIImageView *img_Minusbutton;
	IBOutlet UIImageView *img_Dividebutton;
	IBOutlet UIImageView *img_Multiplybutton;
	IBOutlet UIImageView *img_ClearEverythingbutton;
	IBOutlet UIImageView *img_Clearbutton;
	IBOutlet UIImageView *img_OpenBracketbutton;
	IBOutlet UIImageView *img_CloseBracketbutton;
	
	IBOutlet UIButton *btn_equalsbutton;
	IBOutlet UIButton *btn_pointbutton;
	IBOutlet UIButton *btn_zerobutton;
	IBOutlet UIButton *btn_onebutton;
	IBOutlet UIButton *btn_twobutton;
	IBOutlet UIButton *btn_threebutton;
	IBOutlet UIButton *btn_fourbutton;
	IBOutlet UIButton *btn_fivebutton;
	IBOutlet UIButton *btn_sixbutton;
	IBOutlet UIButton *btn_sevenbutton;
	IBOutlet UIButton *btn_eightbutton;
	IBOutlet UIButton *btn_ninebutton;
	
	IBOutlet UIButton *btn_ucfromprevbutton;
	IBOutlet UIButton *btn_ucfromnextbutton;
	
	IBOutlet UIButton *btn_uctoprevbutton;
	IBOutlet UIButton *btn_uctonextbutton;
	
	IBOutlet UIButton *btn_uctypeprevbutton;
	IBOutlet UIButton *btn_uctypenextbutton;
	
	IBOutlet UIButton *btn_ucconvertbutton;
	IBOutlet UIImageView *img_uctopsection;
	IBOutlet UIImageView *img_uclowersection;
	
	IBOutlet UIImageView *img_ucmidreplacement;
	
	IBOutlet UIButton *btn_soundsoff;
	IBOutlet UIButton *btn_soundson;
	
	IBOutlet UIImageView *img_deglabel;
	IBOutlet UIImageView *img_radlabel;
	
	Calculator *_calculator;
	UnitConverter *_unitconverter;
	
	SystemSoundID _calcsound;
	bool _dialvisible;
	bool _historyvisible;
	bool _soundsenabled;
}

@property (retain, nonatomic) CalcView *calcview;

@property (retain, nonatomic) UIImageView *img_radiansbutton;
@property (retain, nonatomic) UIImageView *img_Degreesbutton;
@property (retain, nonatomic) UIImageView *img_Pibutton;
@property (retain, nonatomic) UIImageView *img_TanInversebutton;
@property (retain, nonatomic) UIImageView *img_CosInversebutton;
@property (retain, nonatomic) UIImageView *img_SinInversebutton;
@property (retain, nonatomic) UIImageView *img_CubeRootbutton;
@property (retain, nonatomic) UIImageView *img_Backspacebutton;
@property (retain, nonatomic) UIImageView *img_PlusMinusbutton;
@property (retain, nonatomic) UIImageView *img_SinHyperbutton;
@property (retain, nonatomic) UIImageView *img_CosHyperbutton;
@property (retain, nonatomic) UIImageView *img_TanHyperbutton;
@property (retain, nonatomic) UIImageView *img_LogBaseTwobutton;
@property (retain, nonatomic) UIImageView *img_Modbutton;
@property (retain, nonatomic) UIImageView *img_Eulerbutton;
@property (retain, nonatomic) UIImageView *img_XSquaredbutton;
@property (retain, nonatomic) UIImageView *img_XpowYbutton;
@property (retain, nonatomic) UIImageView *img_Percentbutton;
@property (retain, nonatomic) UIImageView *img_SquareRootbutton;
@property (retain, nonatomic) UIImageView *img_Sinbutton;
@property (retain, nonatomic) UIImageView *img_Cosbutton;
@property (retain, nonatomic) UIImageView *img_Tanbutton;
@property (retain, nonatomic) UIImageView *img_Logbutton;
@property (retain, nonatomic) UIImageView *img_Plusbutton;
@property (retain, nonatomic) UIImageView *img_Minusbutton;
@property (retain, nonatomic) UIImageView *img_Dividebutton;
@property (retain, nonatomic) UIImageView *img_Multiplybutton;
@property (retain, nonatomic) UIImageView *img_ClearEverythingbutton;
@property (retain, nonatomic) UIImageView *img_Clearbutton;
@property (retain, nonatomic) UIImageView *img_OpenBracketbutton;
@property (retain, nonatomic) UIImageView *img_CloseBracketbutton;

@property (retain, nonatomic) UIButton *btn_equalsbutton;
@property (retain, nonatomic) UIButton *btn_pointbutton;
@property (retain, nonatomic) UIButton *btn_zerobutton;
@property (retain, nonatomic) UIButton *btn_onebutton;
@property (retain, nonatomic) UIButton *btn_twobutton;
@property (retain, nonatomic) UIButton *btn_threebutton;
@property (retain, nonatomic) UIButton *btn_fourbutton;
@property (retain, nonatomic) UIButton *btn_fivebutton;
@property (retain, nonatomic) UIButton *btn_sixbutton;
@property (retain, nonatomic) UIButton *btn_sevenbutton;
@property (retain, nonatomic) UIButton *btn_eightbutton;
@property (retain, nonatomic) UIButton *btn_ninebutton;

@property (retain, nonatomic) UIButton *btn_ucfromprevbutton;
@property (retain, nonatomic) UIButton *btn_ucfromnextbutton;

@property (retain, nonatomic) UIButton *btn_uctoprevbutton;
@property (retain, nonatomic) UIButton *btn_uctonextbutton;

@property (retain, nonatomic) UIButton *btn_uctypeprevbutton;
@property (retain, nonatomic) UIButton *btn_uctypenextbutton;

@property (retain, nonatomic) UIButton *btn_ucconvertbutton;
@property (retain, nonatomic) UIImageView *img_uctopsection;
@property (retain, nonatomic) UIImageView *img_uclowersection;
@property (retain, nonatomic) UIImageView *img_ucmidreplacement;

@property (retain, nonatomic) UIButton *btn_soundsoff;
@property (retain, nonatomic) UIButton *btn_soundson;

@property (retain, nonatomic) UIImageView *img_deglabel;
@property (retain, nonatomic) UIImageView *img_radlabel;

- (IBAction)btnRadianstouchdown:(id)sender;
- (IBAction)btnDegreestouchdown:(id)sender;
- (IBAction)btnPitouchdown:(id)sender;
- (IBAction)btnTanInversetouchdown:(id)sender;
- (IBAction)btnCosInversetouchdown:(id)sender;
- (IBAction)btnSinInversetouchdown:(id)sender;
- (IBAction)btnCubeRoottouchdown:(id)sender;
- (IBAction)btnBackspacetouchdown:(id)sender;
- (IBAction)btnPlusMinustouchdown:(id)sender;
- (IBAction)btnSinHypertouchdown:(id)sender;
- (IBAction)btnCosHypertouchdown:(id)sender;
- (IBAction)btnTanHypertouchdown:(id)sender;
- (IBAction)btnLogBaseTwotouchdown:(id)sender;
- (IBAction)btnModtouchdown:(id)sender;
- (IBAction)btnEulertouchdown:(id)sender;
- (IBAction)btnXSquaredtouchdown:(id)sender;
- (IBAction)btnXpowYtouchdown:(id)sender;
- (IBAction)btnPercenttouchdown:(id)sender;
- (IBAction)btnSquareRoottouchdown:(id)sender;
- (IBAction)btnSintouchdown:(id)sender;
- (IBAction)btnCostouchdown:(id)sender;
- (IBAction)btnTantouchdown:(id)sender;
- (IBAction)btnLogtouchdown:(id)sender;
- (IBAction)btnPlustouchdown:(id)sender;
- (IBAction)btnMinustouchdown:(id)sender;
- (IBAction)btnDividetouchdown:(id)sender;
- (IBAction)btnMultiplytouchdown:(id)sender;
- (IBAction)btnClearEverythingtouchdown:(id)sender;
- (IBAction)btnCleartouchdown:(id)sender;
- (IBAction)btnOpenBrackettouchdown:(id)sender;
- (IBAction)btnCloseBrackettouchdown:(id)sender;


- (IBAction)btnRadianstouchup:(id)sender;
- (IBAction)btnDegreestouchup:(id)sender;
- (IBAction)btnPitouchup:(id)sender;
- (IBAction)btnTanInversetouchup:(id)sender;
- (IBAction)btnCosInversetouchup:(id)sender;
- (IBAction)btnSinInversetouchup:(id)sender;
- (IBAction)btnCubeRoottouchup:(id)sender;
- (IBAction)btnBackspacetouchup:(id)sender;
- (IBAction)btnPlusMinustouchup:(id)sender;
- (IBAction)btnSinHypertouchup:(id)sender;
- (IBAction)btnCosHypertouchup:(id)sender;
- (IBAction)btnTanHypertouchup:(id)sender;
- (IBAction)btnLogBaseTwotouchup:(id)sender;
- (IBAction)btnModtouchup:(id)sender;
- (IBAction)btnEulertouchup:(id)sender;
- (IBAction)btnXSquaredtouchup:(id)sender;
- (IBAction)btnXpowYtouchup:(id)sender;
- (IBAction)btnPercenttouchup:(id)sender;
- (IBAction)btnSquareRoottouchup:(id)sender;
- (IBAction)btnSintouchup:(id)sender;
- (IBAction)btnCostouchup:(id)sender;
- (IBAction)btnTantouchup:(id)sender;
- (IBAction)btnLogtouchup:(id)sender;
- (IBAction)btnPlustouchup:(id)sender;
- (IBAction)btnMinustouchup:(id)sender;
- (IBAction)btnDividetouchup:(id)sender;
- (IBAction)btnMultiplytouchup:(id)sender;
- (IBAction)btnClearEverythingtouchup:(id)sender;
- (IBAction)btnCleartouchup:(id)sender;
- (IBAction)btnOpenBrackettouchup:(id)sender;
- (IBAction)btnCloseBrackettouchup:(id)sender;
- (IBAction)btnEqualstouchup:(id)sender;

- (IBAction)btnPointtouchup:(id)sender;
- (IBAction)btnZerotouchup:(id)sender;
- (IBAction)btnOnetouchup:(id)sender;
- (IBAction)btnTwotouchup:(id)sender;
- (IBAction)btnThreetouchup:(id)sender;
- (IBAction)btnFourtouchup:(id)sender;
- (IBAction)btnFivetouchup:(id)sender;
- (IBAction)btnSixtouchup:(id)sender;
- (IBAction)btnSeventouchup:(id)sender;
- (IBAction)btnEighttouchup:(id)sender;
- (IBAction)btnNinetouchup:(id)sender;

- (IBAction)btnConverttouchup:(id)sender;

- (IBAction)btnUCFromNexttouchup:(id)sender;
- (IBAction)btnUCFromPrevtouchup:(id)sender;

- (IBAction)btnUCTypeNexttouchup:(id)sender;
- (IBAction)btnUCTypePrevtouchup:(id)sender;

- (IBAction)btnUCTToNexttouchup:(id)sender;
- (IBAction)btnUCTToPrevtouchup:(id)sender;

- (IBAction)btnClearhistorytouchup:(id)sender;
- (IBAction)btnCopytoclipboardtouchup:(id)sender;
- (IBAction)btnSoundsofftouchup:(id)sender;
- (IBAction)btnSoundsontouchup:(id)sender;
- (IBAction)btnTogglehistorytouchup:(id)sender;

- (IBAction)btnHistoryselect1:(id)sender;
- (IBAction)btnHistoryselect2:(id)sender;
- (IBAction)btnHistoryselect3:(id)sender;
- (IBAction)btnHistoryselect4:(id)sender;
- (IBAction)btnHistoryselect5:(id)sender;
- (IBAction)btnHistoryselect6:(id)sender;
- (IBAction)btnHistoryselect7:(id)sender;
- (IBAction)btnHistoryselect8:(id)sender;
- (IBAction)btnHistoryselect9:(id)sender;


- (void)calcButtonpressed:(NSString *)buttontext;

- (void)playSinglesound:(NSString *)resourcename;
- (void)setControlsvisible:(bool)visible;

@end

