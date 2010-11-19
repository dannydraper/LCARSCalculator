//
//  LCARS_CalculatorViewController.m
//  LCARS Calculator
//
//  Created by Danny Draper on 18/08/2010.
//  Copyright CedeSoft Ltd 2010. All rights reserved.
//

/*
 Radians 
 Degrees
 Pi
 TanInverse
 CosInverse
 SinInverse
 CubeRoot
 Backspace
 PlusMinus
 SinHyper
 CosHyper
 TanHyper
 LogBaseTwo
 Mod
 Euler
 XSquared
 XpowY
 Percent
 SquareRoot
 Sin
 Cos
 Tan
 Log
 Plus
 Minus
 Divide
 Multiply
 ClearEverything
 Clear
 OpenBracket
 CloseBracket
 
 */

#import "LCARS_CalculatorViewController.h"

@implementation LCARS_CalculatorViewController

@synthesize calcview;
@synthesize img_radiansbutton;
@synthesize img_Degreesbutton;
@synthesize img_Pibutton;
@synthesize img_TanInversebutton;
@synthesize img_CosInversebutton;
@synthesize img_SinInversebutton;
@synthesize img_CubeRootbutton;
@synthesize img_Backspacebutton;
@synthesize img_PlusMinusbutton;
@synthesize img_SinHyperbutton;
@synthesize img_CosHyperbutton;
@synthesize img_TanHyperbutton;
@synthesize img_LogBaseTwobutton;
@synthesize img_Modbutton;
@synthesize img_Eulerbutton;
@synthesize img_XSquaredbutton;
@synthesize img_XpowYbutton;
@synthesize img_Percentbutton;
@synthesize img_SquareRootbutton;
@synthesize img_Sinbutton;
@synthesize img_Cosbutton;
@synthesize img_Tanbutton;
@synthesize img_Logbutton;
@synthesize img_Plusbutton;
@synthesize img_Minusbutton;
@synthesize img_Dividebutton;
@synthesize img_Multiplybutton;
@synthesize img_ClearEverythingbutton;
@synthesize img_Clearbutton;
@synthesize img_OpenBracketbutton;
@synthesize img_CloseBracketbutton;

@synthesize btn_equalsbutton;
@synthesize btn_pointbutton;
@synthesize btn_zerobutton;
@synthesize btn_onebutton;
@synthesize btn_twobutton;
@synthesize btn_threebutton;
@synthesize btn_fourbutton;
@synthesize btn_fivebutton;
@synthesize btn_sixbutton;
@synthesize btn_sevenbutton;
@synthesize btn_eightbutton;
@synthesize btn_ninebutton;

@synthesize btn_ucfromprevbutton;
@synthesize btn_ucfromnextbutton;

@synthesize btn_uctoprevbutton;
@synthesize btn_uctonextbutton;

@synthesize btn_uctypeprevbutton;
@synthesize btn_uctypenextbutton;

@synthesize btn_ucconvertbutton;
@synthesize img_uctopsection;
@synthesize img_uclowersection;
@synthesize img_ucmidreplacement;

@synthesize btn_soundsoff;
@synthesize btn_soundson;

@synthesize img_deglabel;
@synthesize img_radlabel;

- (IBAction)btnRadianstouchdown:(id)sender
{
	img_radiansbutton.highlighted = true;	
}

- (IBAction)btnDegreestouchdown:(id)sender
{
	img_Degreesbutton.highlighted = true;
}

- (IBAction)btnPitouchdown:(id)sender
{
	img_Pibutton.highlighted = true;
}

- (IBAction)btnTanInversetouchdown:(id)sender
{
	img_TanInversebutton.highlighted = true;
}

- (IBAction)btnCosInversetouchdown:(id)sender
{
	img_CosInversebutton.highlighted = true;
}

- (IBAction)btnSinInversetouchdown:(id)sender
{
	img_SinInversebutton.highlighted = true;
}

- (IBAction)btnCubeRoottouchdown:(id)sender
{
	img_CubeRootbutton.highlighted = true;
}

- (IBAction)btnBackspacetouchdown:(id)sender
{
	img_Backspacebutton.highlighted = true;
}

- (IBAction)btnPlusMinustouchdown:(id)sender
{
	img_PlusMinusbutton.highlighted = true;
}

- (IBAction)btnSinHypertouchdown:(id)sender
{
	img_SinHyperbutton.highlighted = true;
}

- (IBAction)btnCosHypertouchdown:(id)sender
{
	img_CosHyperbutton.highlighted = true;
}

- (IBAction)btnTanHypertouchdown:(id)sender
{
	img_TanHyperbutton.highlighted = true;
}

- (IBAction)btnLogBaseTwotouchdown:(id)sender
{
	img_LogBaseTwobutton.highlighted = true;
}

- (IBAction)btnModtouchdown:(id)sender
{
	img_Modbutton.highlighted = true;
}

- (IBAction)btnEulertouchdown:(id)sender
{
	img_Eulerbutton.highlighted = true;
}

- (IBAction)btnXSquaredtouchdown:(id)sender
{
	img_XSquaredbutton.highlighted = true;
}

- (IBAction)btnXpowYtouchdown:(id)sender
{
	img_XpowYbutton.highlighted = true;
}

- (IBAction)btnPercenttouchdown:(id)sender
{
	img_Percentbutton.highlighted = true;
}

- (IBAction)btnSquareRoottouchdown:(id)sender
{
	img_SquareRootbutton.highlighted = true;
}

- (IBAction)btnSintouchdown:(id)sender
{
	img_Sinbutton.highlighted = true;
}

- (IBAction)btnCostouchdown:(id)sender
{
	img_Cosbutton.highlighted = true;
}

- (IBAction)btnTantouchdown:(id)sender
{
	img_Tanbutton.highlighted = true;
}

- (IBAction)btnLogtouchdown:(id)sender
{
	img_Logbutton.highlighted = true;
}

- (IBAction)btnPlustouchdown:(id)sender
{
	img_Plusbutton.highlighted = true;
}

- (IBAction)btnMinustouchdown:(id)sender
{
	img_Minusbutton.highlighted = true;
}

- (IBAction)btnDividetouchdown:(id)sender
{
	img_Dividebutton.highlighted = true;
}

- (IBAction)btnMultiplytouchdown:(id)sender
{
	img_Multiplybutton.highlighted = true;
}

- (IBAction)btnClearEverythingtouchdown:(id)sender
{
	img_ClearEverythingbutton.highlighted = true;
}

- (IBAction)btnCleartouchdown:(id)sender
{
	img_Clearbutton.highlighted = true;
}

- (IBAction)btnOpenBrackettouchdown:(id)sender
{
	img_OpenBracketbutton.highlighted = true;
}

- (IBAction)btnCloseBrackettouchdown:(id)sender
{
	img_CloseBracketbutton.highlighted = true;
}


// TOUCH UP EVENTS FOR DIAL BUTTONS
- (IBAction)btnRadianstouchup:(id)sender
{
	img_radiansbutton.highlighted = false;
	img_radlabel.hidden = false;
	img_deglabel.hidden = true;
	[self calcButtonpressed:@"Rad"];
}

- (IBAction)btnDegreestouchup:(id)sender
{
	img_Degreesbutton.highlighted = false;
	img_radlabel.hidden = true;
	img_deglabel.hidden = false;
	[self calcButtonpressed:@"Deg"];
}

- (IBAction)btnPitouchup:(id)sender
{
	img_Pibutton.highlighted = false;
	[self calcButtonpressed:@"pi"];
}

- (IBAction)btnTanInversetouchup:(id)sender
{
	img_TanInversebutton.highlighted = false;
	[self calcButtonpressed:@"atan"];
}

- (IBAction)btnCosInversetouchup:(id)sender
{
	img_CosInversebutton.highlighted = false;
	[self calcButtonpressed:@"acos"];
}

- (IBAction)btnSinInversetouchup:(id)sender
{
	img_SinInversebutton.highlighted = false;
	[self calcButtonpressed:@"asin"];
}

- (IBAction)btnCubeRoottouchup:(id)sender
{
	img_CubeRootbutton.highlighted = false;
	[self calcButtonpressed:@"Cbrt"];
}

- (IBAction)btnBackspacetouchup:(id)sender
{
	img_Backspacebutton.highlighted = false;
	[self calcButtonpressed:@"Bksp"];
}

- (IBAction)btnPlusMinustouchup:(id)sender
{
	img_PlusMinusbutton.highlighted = false;
	[self calcButtonpressed:@"±"];
}

- (IBAction)btnSinHypertouchup:(id)sender
{
	img_SinHyperbutton.highlighted = false;
	[self calcButtonpressed:@"sinh"];
}

- (IBAction)btnCosHypertouchup:(id)sender
{
	img_CosHyperbutton.highlighted = false;
	[self calcButtonpressed:@"cosh"];
}

- (IBAction)btnTanHypertouchup:(id)sender
{
	img_TanHyperbutton.highlighted = false;
	[self calcButtonpressed:@"tanh"];
}

- (IBAction)btnLogBaseTwotouchup:(id)sender
{
	img_LogBaseTwobutton.highlighted = false;
	[self calcButtonpressed:@"log2"];
}

- (IBAction)btnModtouchup:(id)sender
{
	img_Modbutton.highlighted = false;
	[self calcButtonpressed:@"Mod"];
}

- (IBAction)btnEulertouchup:(id)sender
{
	img_Eulerbutton.highlighted = false;
	[self calcButtonpressed:@"e"];
}

- (IBAction)btnXSquaredtouchup:(id)sender
{
	img_XSquaredbutton.highlighted = false;
	[self calcButtonpressed:@"x2"];
}

- (IBAction)btnXpowYtouchup:(id)sender
{
	img_XpowYbutton.highlighted = false;
	[self calcButtonpressed:@"x^y"];
}

- (IBAction)btnPercenttouchup:(id)sender
{
	img_Percentbutton.highlighted = false;
	[self calcButtonpressed:@"%"];
}

- (IBAction)btnSquareRoottouchup:(id)sender
{
	img_SquareRootbutton.highlighted = false;
	[self calcButtonpressed:@"Sqrt"];
}

- (IBAction)btnSintouchup:(id)sender
{
	img_Sinbutton.highlighted = false;
	[self calcButtonpressed:@"sin"];
}

- (IBAction)btnCostouchup:(id)sender
{
	img_Cosbutton.highlighted = false;
	[self calcButtonpressed:@"cos"];
}

- (IBAction)btnTantouchup:(id)sender
{
	img_Tanbutton.highlighted = false;
	[self calcButtonpressed:@"tan"];
}

- (IBAction)btnLogtouchup:(id)sender
{
	img_Logbutton.highlighted = false;
	[self calcButtonpressed:@"log"];
}

- (IBAction)btnPlustouchup:(id)sender
{
	img_Plusbutton.highlighted = false;
	[self calcButtonpressed:@"+"];
}

- (IBAction)btnMinustouchup:(id)sender
{
	img_Minusbutton.highlighted = false;
	[self calcButtonpressed:@"-"];
}

- (IBAction)btnDividetouchup:(id)sender
{
	img_Dividebutton.highlighted = false;
	[self calcButtonpressed:@"/"];
}

- (IBAction)btnMultiplytouchup:(id)sender
{
	img_Multiplybutton.highlighted = false;
	[self calcButtonpressed:@"*"];
}

- (IBAction)btnClearEverythingtouchup:(id)sender
{
	img_ClearEverythingbutton.highlighted = false;
	[self calcButtonpressed:@"CE"];
}

- (IBAction)btnCleartouchup:(id)sender
{
	img_Clearbutton.highlighted = false;
	[self calcButtonpressed:@"C"];
}

- (IBAction)btnOpenBrackettouchup:(id)sender
{
	img_OpenBracketbutton.highlighted = false;
	[self calcButtonpressed:@"("];
}

- (IBAction)btnCloseBrackettouchup:(id)sender
{
	img_CloseBracketbutton.highlighted = false;
	[self calcButtonpressed:@")"];
}

- (IBAction)btnEqualstouchup:(id)sender
{
	[self calcButtonpressed:@"="];
}

- (IBAction)btnPointtouchup:(id)sender
{
	[self calcButtonpressed:@"."];
}

- (IBAction)btnZerotouchup:(id)sender
{
	[self calcButtonpressed:@"0"];
}

- (IBAction)btnOnetouchup:(id)sender
{
	[self calcButtonpressed:@"1"];
}

- (IBAction)btnTwotouchup:(id)sender
{
	[self calcButtonpressed:@"2"];
}

- (IBAction)btnThreetouchup:(id)sender
{
	[self calcButtonpressed:@"3"];
}

- (IBAction)btnFourtouchup:(id)sender
{
	[self calcButtonpressed:@"4"];
}

- (IBAction)btnFivetouchup:(id)sender
{
	[self calcButtonpressed:@"5"];
}

- (IBAction)btnSixtouchup:(id)sender
{
	[self calcButtonpressed:@"6"];
}

- (IBAction)btnSeventouchup:(id)sender
{
	[self calcButtonpressed:@"7"];
}

- (IBAction)btnEighttouchup:(id)sender
{
	[self calcButtonpressed:@"8"];
}

- (IBAction)btnNinetouchup:(id)sender
{
	[self calcButtonpressed:@"9"];
}

- (IBAction)btnHistoryselect1:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[_calculator SetCurrentNumber:[calcview getHistoryline:0]];
	[calcview setCalcString:[_calculator GetCurrentNumber]];
	[calcview setMemString:[_calculator GetCurrentExpression]];
}

- (IBAction)btnHistoryselect2:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[_calculator SetCurrentNumber:[calcview getHistoryline:1]];
	[calcview setCalcString:[_calculator GetCurrentNumber]];
	[calcview setMemString:[_calculator GetCurrentExpression]];
}

- (IBAction)btnHistoryselect3:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[_calculator SetCurrentNumber:[calcview getHistoryline:2]];
	[calcview setCalcString:[_calculator GetCurrentNumber]];
	[calcview setMemString:[_calculator GetCurrentExpression]];
}

- (IBAction)btnHistoryselect4:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[_calculator SetCurrentNumber:[calcview getHistoryline:3]];
	[calcview setCalcString:[_calculator GetCurrentNumber]];
	[calcview setMemString:[_calculator GetCurrentExpression]];
}

- (IBAction)btnHistoryselect5:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[_calculator SetCurrentNumber:[calcview getHistoryline:4]];
	[calcview setCalcString:[_calculator GetCurrentNumber]];
	[calcview setMemString:[_calculator GetCurrentExpression]];
}

- (IBAction)btnHistoryselect6:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[_calculator SetCurrentNumber:[calcview getHistoryline:5]];
	[calcview setCalcString:[_calculator GetCurrentNumber]];
	[calcview setMemString:[_calculator GetCurrentExpression]];
}

- (IBAction)btnHistoryselect7:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[_calculator SetCurrentNumber:[calcview getHistoryline:6]];
	[calcview setCalcString:[_calculator GetCurrentNumber]];
	[calcview setMemString:[_calculator GetCurrentExpression]];
}

- (IBAction)btnHistoryselect8:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[_calculator SetCurrentNumber:[calcview getHistoryline:7]];
	[calcview setCalcString:[_calculator GetCurrentNumber]];
	[calcview setMemString:[_calculator GetCurrentExpression]];
}

- (IBAction)btnHistoryselect9:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[_calculator SetCurrentNumber:[calcview getHistoryline:8]];
	[calcview setCalcString:[_calculator GetCurrentNumber]];
	[calcview setMemString:[_calculator GetCurrentExpression]];
}


- (IBAction)btnTogglehistorytouchup:(id)sender
{
	if (_historyvisible == false) {
		_historyvisible = true;
		[self setControlsvisible:false];
		
		[calcview setHistoryList:[_calculator GetHistoryList]];
		[calcview setHistoryPage:0];
		[calcview setHistoryvisible:true];
		
		[calcview InvalidateDisplay];
		
	} else {
		_historyvisible = false;
		
		[calcview setHistoryvisible:false];
		[calcview setSelectbuttonsvisible:false];
		[self setControlsvisible:true];
		
		[calcview InvalidateDisplay];
	}
	
	[self playSinglesound:@"clockbutton"];
	
}

- (void)setControlsvisible:(bool)visible
{
	img_radiansbutton.hidden = !visible;
	img_Degreesbutton.hidden = !visible;
	img_Pibutton.hidden = !visible;
	img_TanInversebutton.hidden = !visible;
	img_CosInversebutton.hidden = !visible;
	img_SinInversebutton.hidden = !visible;
	img_CubeRootbutton.hidden = !visible;
	img_Backspacebutton.hidden = !visible;
	img_PlusMinusbutton.hidden = !visible;
	img_SinHyperbutton.hidden = !visible;
	img_CosHyperbutton.hidden = !visible;
	img_TanHyperbutton.hidden = !visible;
	img_LogBaseTwobutton.hidden = !visible;
	img_Modbutton.hidden = !visible;
	img_Eulerbutton.hidden = !visible;
	img_XSquaredbutton.hidden = !visible;
	img_XpowYbutton.hidden = !visible;
	img_Percentbutton.hidden = !visible;
	img_SquareRootbutton.hidden = !visible;
	img_Sinbutton.hidden = !visible;
	img_Cosbutton.hidden = !visible;
	img_Tanbutton.hidden = !visible;
	img_Logbutton.hidden = !visible;
	img_Plusbutton.hidden = !visible;
	img_Minusbutton.hidden = !visible;
	img_Dividebutton.hidden = !visible;
	img_Multiplybutton.hidden = !visible;
	img_ClearEverythingbutton.hidden = !visible;
	img_Clearbutton.hidden = !visible;
	img_OpenBracketbutton.hidden = !visible;
	img_CloseBracketbutton.hidden = !visible;
	
	btn_equalsbutton.hidden = !visible;
	btn_pointbutton.hidden = !visible;
	btn_zerobutton.hidden = !visible;
	btn_onebutton.hidden = !visible;
	btn_twobutton.hidden = !visible;
	btn_threebutton.hidden = !visible;
	btn_fourbutton.hidden = !visible;
	btn_fivebutton.hidden = !visible;
	btn_sixbutton.hidden = !visible;
	btn_sevenbutton.hidden = !visible;
	btn_eightbutton.hidden = !visible;
	btn_ninebutton.hidden = !visible;
	
	btn_ucfromprevbutton.hidden = !visible;
	btn_ucfromnextbutton.hidden = !visible;
	
	btn_uctoprevbutton.hidden = !visible;
	btn_uctonextbutton.hidden = !visible;
	
	btn_uctypeprevbutton.hidden = !visible;
	btn_uctypenextbutton.hidden = !visible;
	
	btn_ucconvertbutton.hidden = !visible;
	img_uctopsection.hidden = !visible;
	img_uclowersection.hidden = !visible;
	
	[calcview setConvertalphavisible:visible];
	
	img_ucmidreplacement.hidden = visible;
	
	_dialvisible = visible;
}

- (IBAction)btnConverttouchup:(id)sender
{
	[self playSinglesound:@"clockbutton"];
	NSString *resultstring;
	
	NSString *currentcalcvalue = [_calculator GetCurrentNumber];
	
	resultstring = [_unitconverter Convert:[_unitconverter getCurrentFromUnit] :[_unitconverter getCurrentToUnit] :[currentcalcvalue doubleValue]];

	NSMutableString *convertexpression;
	convertexpression = [NSMutableString new];
	
	[convertexpression appendString:currentcalcvalue];
	[convertexpression appendString:@" "];
	[convertexpression appendString:[_unitconverter getCurrentFromUnit]];
	[convertexpression appendString:@" TO "];
	[convertexpression appendString:[_unitconverter getCurrentToUnit]];
	
	[calcview setMemString:convertexpression];
	
	[calcview setCalcString:resultstring];
	

}

- (IBAction)btnUCFromNexttouchup:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[calcview setConvertFromString:[_unitconverter getNextFromUnit]];
}

- (IBAction)btnUCFromPrevtouchup:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[calcview setConvertFromString:[_unitconverter getPrevFromUnit]];
}

- (IBAction)btnUCTypeNexttouchup:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[calcview setConvertTypeString:[_unitconverter getNextUnitType]];	

	[calcview setConvertToString:[_unitconverter getCurrentToUnit]];
	[calcview setConvertFromString:[_unitconverter getCurrentFromUnit]];
}

- (IBAction)btnUCTypePrevtouchup:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[calcview setConvertTypeString:[_unitconverter getPrevUnitType]];

	[calcview setConvertToString:[_unitconverter getCurrentToUnit]];
	[calcview setConvertFromString:[_unitconverter getCurrentFromUnit]];
	
}

- (IBAction)btnUCTToNexttouchup:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[calcview setConvertToString:[_unitconverter getNextToUnit]];
}

- (IBAction)btnUCTToPrevtouchup:(id)sender
{
	[self playSinglesound:@"clockbuttonhigh"];
	[calcview setConvertToString:[_unitconverter getPrevToUnit]];
}

- (IBAction)btnClearhistorytouchup:(id)sender
{
	[self playSinglesound:@"clockbutton"];
	[_calculator ClearHistoryList];
	[calcview ClearHistoryLines];
	[calcview InvalidateDisplay];
	[calcview setSelectbuttonsvisible:false];
}

-(IBAction)btnCopytoclipboardtouchup:(id)sender
{
	[self playSinglesound:@"clockbutton"];
	[_calculator CopyHistoryToClipboard];
}

- (IBAction)btnSoundsofftouchup:(id)sender
{
	_soundsenabled = false;
	btn_soundson.hidden = false;
	btn_soundsoff.hidden = true;
}

- (IBAction)btnSoundsontouchup:(id)sender
{
	_soundsenabled = true;
	btn_soundson.hidden = true;
	btn_soundsoff.hidden = false;
	
	[self playSinglesound:@"clockbutton"];
}

- (void)playSinglesound:(NSString *)resourcename
{
	if (_soundsenabled == true) {
	
		AudioServicesDisposeSystemSoundID(_calcsound);
		NSString *buttonPath = [[NSBundle mainBundle] pathForResource:resourcename ofType:@"wav" inDirectory:@"/"];
		
		if (buttonPath == nil) {
			buttonPath = [[NSBundle mainBundle] pathForResource:resourcename ofType:@"WAV" inDirectory:@"/"];
		}
		
		if (buttonPath != nil) {
			CFURLRef sndbuttonURL;
			NSURL *url = [[NSURL alloc] initFileURLWithPath:buttonPath];
			sndbuttonURL = (CFURLRef)url;
			AudioServicesCreateSystemSoundID(sndbuttonURL, &_calcsound);
			[url release];
			
			AudioServicesPlaySystemSound(_calcsound);
		}
	}
}

- (void)calcButtonpressed:(NSString *)buttontext
{
	// Called when any of the calculator buttons are pressed
	if (_dialvisible == true) {
	
		[_calculator NotifyCommand:buttontext];
	
		[calcview setCalcString:[_calculator GetCurrentNumber]];
		[calcview setMemString:[_calculator GetCurrentExpression]];
	
		if ([buttontext isEqualToString:@"="] == TRUE) {
			[self playSinglesound:@"clockbutton"];
		} else {
			[self playSinglesound:@"clockbuttonhigh"];
		}
	//[calcview setCalcString:@"HELLO"];
	}
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	//btn_radiansbutton1.alpha = 0.0f;
	//btn_radiansbutton1.Type = Custom;
	[calcview setConvertFromString:@"INCHES"];
	[calcview setConvertToString:@"MILES"];
	//[calcview setConvertTypeString:@"LENGTH"];
	
	[_calculator = [Calculator new] retain];
	[_calculator Initialise];
	
	[_unitconverter = [UnitConverter new] retain];
	[_unitconverter Initialise];
	
	[calcview setConvertTypeString:[_unitconverter getCurrentUnitType]];
	[calcview setConvertToString:[_unitconverter getCurrentToUnit]];
	[calcview setConvertFromString:[_unitconverter getCurrentFromUnit]];
	
	[calcview setHistoryvisible:false];
	[calcview setSelectbuttonsvisible:false];
	_dialvisible = true;
	_historyvisible = false;
	
	img_ucmidreplacement.hidden = true;
	_soundsenabled = true;
	
	btn_soundson.hidden = true;
	btn_soundsoff.hidden = false;
	
	img_deglabel.hidden = false;
	img_radlabel.hidden = true;
	
    [super viewDidLoad];

}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	
	if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
		return YES;
	}
	
	if (interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		return YES;
	}
	
	if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		return NO;
	}
	
	if (interfaceOrientation == UIInterfaceOrientationPortrait) {
		return NO;
	}
	
	return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
