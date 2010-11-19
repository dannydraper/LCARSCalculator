//
//  UnitConverter.m
//  LCARS Calc
//
//  Created by Danny Draper on 20/09/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import "UnitConverter.h"


@implementation UnitConverter

- (void) Initialise
{
	_unitlist = [NSMutableArray new];
	_unittypes = [NSMutableArray new];
	_unitnames = [NSMutableArray new];
	
	_selectedunittypeindex = 0;
	
	[self AddSingleUnit:@"ANGLE" :@"DEGREE" :1]; // BASE UNIT
	[self AddSingleUnit:@"ANGLE" :@"GRADIAN" :0.9];
	[self AddSingleUnit:@"ANGLE" :@"RADIAN" :57.29577951308233];
	
	[self AddSingleUnit:@"AREA" :@"ACRES" : 4046.8564224];
	[self AddSingleUnit:@"AREA" :@"HECTARES" :10000];
	[self AddSingleUnit:@"AREA" :@"SQ CM" :0.0001];
	[self AddSingleUnit:@"AREA" :@"SQ FT" :0.09290304];
	[self AddSingleUnit:@"AREA" :@"SQ INCH" :0.00064516];
	[self AddSingleUnit:@"AREA" :@"SQ KM" :1000000];
	[self AddSingleUnit:@"AREA" :@"SQ MTR" :1]; // BASE UNIT
	[self AddSingleUnit:@"AREA" :@"SQ MILE" :2589988.110336];
	[self AddSingleUnit:@"AREA" :@"SQ MM" :0.000001];
	[self AddSingleUnit:@"AREA" :@"SQ YRD" :0.83612736];
	
	[self AddSingleUnit:@"ENERGY" :@"BTU" :1055.056];
	[self AddSingleUnit:@"ENERGY" :@"CALORIE" :4.1868];
	[self AddSingleUnit:@"ENERGY" :@"EV" : (0.0000160217653 / 100000000000000)];
	[self AddSingleUnit:@"ENERGY" :@"FT POUND" :1.3558179483314];
	[self AddSingleUnit:@"ENERGY" :@"JOULE" :1]; // BASE UNIT
	[self AddSingleUnit:@"ENERGY" :@"KCAL" :4186.8];
	[self AddSingleUnit:@"ENERGY" :@"KJOULE" :1000];
	
	
	[self AddSingleUnit:@"LENGTH" :@"ANGSTROM" :(0.001 / 10000000)];
	[self AddSingleUnit:@"LENGTH" :@"CM" :0.01];
	[self AddSingleUnit:@"LENGTH" :@"CHAIN" :20.1168];
	[self AddSingleUnit:@"LENGTH" :@"FATHOM" :1.8288];
	[self AddSingleUnit:@"LENGTH" :@"FEET" : 0.3048];
	[self AddSingleUnit:@"LENGTH" :@"HAND" :0.1016];
	[self AddSingleUnit:@"LENGTH" :@"INCH" :0.0254];
	[self AddSingleUnit:@"LENGTH" :@"KM" :1000];
	[self AddSingleUnit:@"LENGTH" :@"LINK" :0.201168];
	[self AddSingleUnit:@"LENGTH" :@"METER" :1]; // BASE UNIT
	[self AddSingleUnit:@"LENGTH" :@"MICRON" :0.000001];
	[self AddSingleUnit:@"LENGTH" :@"MILE" :1609.344];
	[self AddSingleUnit:@"LENGTH" :@"MM" :0.001];
	[self AddSingleUnit:@"LENGTH" :@"NANOMTR" :0.000000001];
	[self AddSingleUnit:@"LENGTH" :@"NAUT MILE" :1852];
	[self AddSingleUnit:@"LENGTH" :@"PICA" :0.0042175176];
	[self AddSingleUnit:@"LENGTH" :@"RODS" :5.0292];
	[self AddSingleUnit:@"LENGTH" :@"SPAN" :0.2286];
	[self AddSingleUnit:@"LENGTH" :@"YARD" :0.9144];
	
	[self AddSingleUnit:@"POWER" :@"HORSEPOWER" :0.7456998715822702];
	[self AddSingleUnit:@"POWER" :@"KILOWATT" :1];
	[self AddSingleUnit:@"POWER" :@"WATT" :0.001];
	
	[self AddSingleUnit:@"PRESSURE" :@"ATMOSPHERE" :14.69594940039221];
	[self AddSingleUnit:@"PRESSURE" :@"BAR" :14.50377438972831];
	[self AddSingleUnit:@"PRESSURE" :@"KPASCAL" :0.1450377438972831];
	[self AddSingleUnit:@"PRESSURE" :@"PASCAL" :(0.1450377438972831 / 1000)];
	[self AddSingleUnit:@"PRESSURE" :@"PSI" :1]; // BASE UNIT
	
	[self AddSingleUnit:@"TEMP" :@"CELSIUS" :33.8]; 
	[self AddSingleUnit:@"TEMP" :@"FRNHEIGHT" :1];
	[self AddSingleUnit:@"TEMP" :@"KELVIN" :-457.87]; // BASE UNIT
	
	[self AddSingleUnit:@"TIME" :@"DAY" :24];
	[self AddSingleUnit:@"TIME" :@"HOUR" :1]; // BASE UNIT
	[self AddSingleUnit:@"TIME" :@"MICROSEC" :(0.2777777777777778/1000000000)];
	[self AddSingleUnit:@"TIME" :@"MILLISEC" :(0.2777777777777778 / 1000000)];
	[self AddSingleUnit:@"TIME" :@"MINUTE" :0.0166666666666667];
	[self AddSingleUnit:@"TIME" :@"SECOND" :(0.2777777777777778/1000)];
	[self AddSingleUnit:@"TIME" :@"WEEK" :168];
	
	[self AddSingleUnit:@"SPEED" :@"CM PER SEC" :0.01];
	[self AddSingleUnit:@"SPEED" :@"FT PER SEC" :0.3048];
	[self AddSingleUnit:@"SPEED" :@"KPH" :0.2777777777777778];
	[self AddSingleUnit:@"SPEED" :@"KNOTS" :0.5144444444444444];
	[self AddSingleUnit:@"SPEED" :@"MACH" :340.2933];
	[self AddSingleUnit:@"SPEED" :@"MT PER SEC" :1]; // BASE UNIT
	[self AddSingleUnit:@"SPEED" :@"MPH" :0.44704];
	
	[self AddSingleUnit:@"VOLUME" :@"CB CM" :0.000001];
	[self AddSingleUnit:@"VOLUME" :@"CB FT" :0.028316846592];
	[self AddSingleUnit:@"VOLUME" :@"CB INCH" :0.000016387064];
	[self AddSingleUnit:@"VOLUME" :@"CB MTR" :1]; // BASE UNIT
	[self AddSingleUnit:@"VOLUME" :@"CB YRD" :0.764554857984];
	[self AddSingleUnit:@"VOLUME" :@"UK FL.OZ" :0.0000284130625];
	[self AddSingleUnit:@"VOLUME" :@"US FL.OZ" :0.0000295735295625];
	[self AddSingleUnit:@"VOLUME" :@"UK GALLON" :0.00454609];
	[self AddSingleUnit:@"VOLUME" :@"US GALLON" :0.003785411784];
	[self AddSingleUnit:@"VOLUME" :@"LITRE" :0.001];
	[self AddSingleUnit:@"VOLUME" :@"UK PINT" :0.00056826125];
	[self AddSingleUnit:@"VOLUME" :@"US PINT" :0.000473176473];
	[self AddSingleUnit:@"VOLUME" :@"UK QUART" :0.0011365225];
	[self AddSingleUnit:@"VOLUME" :@"US QUART" :0.000946352946];
	
	[self AddSingleUnit:@"WEIGHT" :@"CARAT" :0.0002];
	[self AddSingleUnit:@"WEIGHT" :@"CENTIGRAM" :0.00001];
	[self AddSingleUnit:@"WEIGHT" :@"DECIGRAM" :0.0001];
	[self AddSingleUnit:@"WEIGHT" :@"DEKAGRAM" :0.01];
	[self AddSingleUnit:@"WEIGHT" :@"GRAM" :0.001];
	[self AddSingleUnit:@"WEIGHT" :@"HECTOGRAM" :0.1];
	[self AddSingleUnit:@"WEIGHT" :@"KILOGRAM" :1]; // BASE UNIT
	[self AddSingleUnit:@"WEIGHT" :@"LONG TON" :1016.0469088];
	[self AddSingleUnit:@"WEIGHT" :@"MILLIGRAM" :0.000001];
	[self AddSingleUnit:@"WEIGHT" :@"OUNCE" :0.028349523125];
	[self AddSingleUnit:@"WEIGHT" :@"POUND" :0.45359237];
	[self AddSingleUnit:@"WEIGHT" :@"SHORT TON" :907.18474];
	[self AddSingleUnit:@"WEIGHT" :@"STONE" :6.35029318];
	[self AddSingleUnit:@"WEIGHT" :@"TONNE" :1000];
	
	[self PopulateTypes];
	[self PopulateNames:[self getCurrentUnitType]];
	
	
	[self LogTypes];
	
}

- (bool) DoesTypeExist:(NSString *)unittype
{
	NSString *currenttype;
	
	for (int a=0;a<[_unittypes count];a++)
	{
		currenttype = [_unittypes objectAtIndex:a];
		
		if ([currenttype isEqualToString:unittype] == true) {
			return true;
		}
	}
	
	return false;
}

- (void) AddSingleUnit:(NSString *)unittype:(NSString *)unitname: (double) basemetric
{
	SingleUnit *myunit;
	myunit = [SingleUnit new];
	
	[myunit seUnitname:unitname];
	[myunit setUnittype:unittype];
	[myunit setBasemetric:basemetric];
	
	[_unitlist addObject:myunit];
}

- (void) PopulateNames:(NSString *)unittype;
{
	SingleUnit *currentunit;
	[_unitnames removeAllObjects];
	_selectedfromindex = 0;
	_selectedtoindex = 0;
	
	for (int a=0;a<[_unitlist count];a++)
	{
		currentunit = [_unitlist objectAtIndex:a];
		
		if ([[currentunit getUnittype] isEqualToString:unittype] == true) {
			[_unitnames addObject:[currentunit getUnitname]];
		}
	}
}


- (void) PopulateTypes
{
	SingleUnit *currentunit;
	
	for (int a=0;a<[_unitlist count];a++)
	{
		currentunit = [_unitlist objectAtIndex:a];
		
		if ([self DoesTypeExist:[currentunit getUnittype]] == false) {
			//NSLog(@"Added unit type: %@", [currentunit getUnittype]);
			[_unittypes addObject:[currentunit getUnittype]];
		}
		
		NSLog(@"Current unit type: %@", [currentunit getUnittype]);
	}
	
	
}

- (NSString *) getCurrentUnitType
{
	NSString *unittype = [_unittypes objectAtIndex:_selectedunittypeindex];
	
	return unittype;
}

- (NSString *) getNextUnitType
{
	_selectedunittypeindex++;
	
	if (_selectedunittypeindex > [_unittypes count]-1) {
		_selectedunittypeindex = 0;
	}
	
	NSString *unittype = [_unittypes objectAtIndex:_selectedunittypeindex];
	
	[self PopulateNames:unittype];
	
	return unittype;
}

- (NSString *) getPrevUnitType
{
	if (_selectedunittypeindex > 0) {
		_selectedunittypeindex--;
	} else {
		_selectedunittypeindex = [_unittypes count]-1;
	}
	
	NSString *unittype = [_unittypes objectAtIndex:_selectedunittypeindex];

	[self PopulateNames:unittype];
	
	return unittype;
}

- (NSString *) getCurrentFromUnit
{
	NSString *unitname = [_unitnames objectAtIndex:_selectedfromindex];
	
	return unitname;
}

- (NSString *) getNextFromUnit
{
	_selectedfromindex++;
	
	if (_selectedfromindex > [_unitnames count]-1) {
		_selectedfromindex = 0;
	}
	
	NSString *unitname = [_unitnames objectAtIndex:_selectedfromindex];
	
	return unitname;
}

- (NSString *) getPrevFromUnit
{
	if (_selectedfromindex > 0) {
		_selectedfromindex--;
	} else {
		_selectedfromindex = [_unitnames count]-1;
	}
	
	NSString *unitname = [_unitnames objectAtIndex:_selectedfromindex];
	
	return unitname;
}

- (NSString *) getCurrentToUnit
{
	NSString *unitname = [_unitnames objectAtIndex:_selectedtoindex];
	
	return unitname;
}

- (NSString *) getNextToUnit
{
	_selectedtoindex++;
	
	if (_selectedtoindex > [_unitnames count]-1) {
		_selectedtoindex = 0;
	}
	
	NSString *unitname = [_unitnames objectAtIndex:_selectedtoindex];
	
	return unitname;
}

- (NSString *) getPrevToUnit
{
	if (_selectedtoindex > 0) {
		_selectedtoindex--;
	} else {
		_selectedtoindex = [_unitnames count]-1;
	}
	
	NSString *unitname = [_unitnames objectAtIndex:_selectedtoindex];
	
	return unitname;
}

- (void) LogTypes
{
	SingleUnit *currentunit;
	
	for (int a=0;a<[_unitlist count];a++) {
		currentunit = [_unitlist objectAtIndex:a];
		
		NSLog (@"Listed unit type: %@, Base metric is: %f", [currentunit getUnitname], [currentunit getBasemetric]);
	}
}

- (double) getBasemetric:(NSString *)unitname
{
	SingleUnit *currentunit;
	
	for (int a=0;a<[_unitlist count];a++) {
		currentunit = [_unitlist objectAtIndex:a];
		
		if ([[currentunit getUnitname] isEqualToString:unitname] == true) {
			return [currentunit getBasemetric];
		}
	}
	
	return 0;
}


- (NSString *) Convert:(NSString *)from: (NSString *)to: (double) amount
{
	double result;
	/*
	// ANGLE
	if ([from isEqualToString:@"DEGREE"] && [to isEqualToString:@"DEGREE"]) {result = amount;}
	if ([from isEqualToString:@"DEGREE"] && [to isEqualToString:@"GRADIAN"]) {result = amount * 1.111111111111111;}
	if ([from isEqualToString:@"DEGREE"] && [to isEqualToString:@"RADIAN"]) {result = amount * 0.0174532925199433;}
	
	if ([from isEqualToString:@"GRADIAN"] && [to isEqualToString:@"DEGREE"]) {result = amount * 0.9;}
	if ([from isEqualToString:@"GRADIAN"] && [to isEqualToString:@"RADIAN"]) {result = amount * 0.015707963267949;}
	if ([from isEqualToString:@"GRADIAN"] && [to isEqualToString:@"GRADIAN"]) {result = amount;}
	
	if ([from isEqualToString:@"RADIAN"] && [to isEqualToString:@"DEGREE"]) {result = amount * 57.29577951308233;}
	if ([from isEqualToString:@"RADIAN"] && [to isEqualToString:@"RADIAN"]) {result = amount;}
	if ([from isEqualToString:@"RADIAN"] && [to isEqualToString:@"GRADIAN"]) {result = amount * 63.66197723675814;}

	// AREA
	if ([from isEqualToString:@"ACRES"] && [to isEqualToString:@"ACRES"]) {result = amount;}
	if ([from isEqualToString:@"ACRES"] && [to isEqualToString:@"HECTARES"]) {result = amount * 0.40468564224;}
	if ([from isEqualToString:@"ACRES"] && [to isEqualToString:@"SQ CM"]) {result = amount * 40468564.224;}
	if ([from isEqualToString:@"ACRES"] && [to isEqualToString:@"SQ FT"]) {result = amount * 43560;}
	if ([from isEqualToString:@"ACRES"] && [to isEqualToString:@"SQ INCH"]) {result = amount * 6272640;}
	if ([from isEqualToString:@"ACRES"] && [to isEqualToString:@"SQ KM"]) {result = amount * 0.0040468564224;}
	if ([from isEqualToString:@"ACRES"] && [to isEqualToString:@"SQ MTR"]) {result = amount * 4046.8564224;}
	if ([from isEqualToString:@"ACRES"] && [to isEqualToString:@"SQ MILE"]) {result = amount * 0.0015625;}
	if ([from isEqualToString:@"ACRES"] && [to isEqualToString:@"SQ MM"]) {result = amount * 4046856422.4;}
	if ([from isEqualToString:@"ACRES"] && [to isEqualToString:@"SQ YRD"]) {result = amount * 4840;}
	
	if ([from isEqualToString:@"HECTARES"] && [to isEqualToString:@"ACRES"]) {result = amount * 2.471053814671653;}
	if ([from isEqualToString:@"HECTARES"] && [to isEqualToString:@"HECTARES"]) {result = amount;}
	if ([from isEqualToString:@"HECTARES"] && [to isEqualToString:@"SQ CM"]) {result = amount * 100000000;}
	if ([from isEqualToString:@"HECTARES"] && [to isEqualToString:@"SQ FT"]) {result = amount * 107639.1041670972;}
	if ([from isEqualToString:@"HECTARES"] && [to isEqualToString:@"SQ INCH"]) {result = amount * 15500031.000062;}
	if ([from isEqualToString:@"HECTARES"] && [to isEqualToString:@"SQ KM"]) {result = amount * 0.01;}
	if ([from isEqualToString:@"HECTARES"] && [to isEqualToString:@"SQ MTR"]) {result = amount * 10000;}
	if ([from isEqualToString:@"HECTARES"] && [to isEqualToString:@"SQ MILE"]) {result = amount * 0.0038610215854245;}
	if ([from isEqualToString:@"HECTARES"] && [to isEqualToString:@"SQ MM"]) {result = amount * 10000000000;}
	if ([from isEqualToString:@"HECTARES"] && [to isEqualToString:@"SQ YRD"]) {result = amount * 11959.9004630108;}
	
	 [self AddSingleUnit:@"TEMP" :@"CELSIUS" :33.8]; 
	 [self AddSingleUnit:@"TEMP" :@"FRNHEIGHT" :1];
	 [self AddSingleUnit:@"TEMP" :@"KELVIN" :-457.87]; // BASE UNIT
	 
	*/
	
	bool _usingbasemetric = true;
	
	if ([from isEqualToString:@"CELSIUS"] && [to isEqualToString:@"KELVIN"]) {result = amount + 273.15; _usingbasemetric = false;}
	if ([from isEqualToString:@"FRNHEIGHT"] && [to isEqualToString:@"KELVIN"]) {result = (amount + 459.67) * 5/9; _usingbasemetric = false;}
	
	if ([from isEqualToString:@"KELVIN"] && [to isEqualToString:@"CELSIUS"]) {result = amount - 273.15; _usingbasemetric = false;}
	if ([from isEqualToString:@"KELVIN"] && [to isEqualToString:@"FRNHEIGHT"]) {result = amount * 9/5 - 459.67; _usingbasemetric = false;}

	if ([from isEqualToString:@"CELSIUS"] && [to isEqualToString:@"FRNHEIGHT"]) {result = amount * 9/5 + 32; _usingbasemetric = false;}
	if ([from isEqualToString:@"FRNHEIGHT"] && [to isEqualToString:@"CELSIUS"]) {result = (amount - 32) * 5/9; _usingbasemetric = false;}
	
	
	
	// METRES IS THE WORKING LENGTH SAY
	// 12 FEET TO INCHES WOULD BE
	// FEETUNIT = 0.3048 METRES
	// INCHUNIT = 0.0254 METRES
	// METREUNIT = 1 METRES
	// 
	// SO FIRSTLY: 12 FEET IN METRES: =  12 * 0.3048 = 3.6576
	// SECONDLY: 3.6576 METRES IN INCHES: = 3.6576 / 0.0254 = 144
	//
	// TEST AGAIN OTHER WAY ROUND:
	// 144 INCHES IN FEET
	// 
	// 144 * 0.0254 = 3.6576
	// 3.6576 / 0.3048
	
	// 12 METRES IN FEET
	// 12 * 1 = 12
	// 12 / 0.3048 = 39.37 FEET
	
	if (_usingbasemetric == true) {
		double frombase = [self getBasemetric:from];
		double tobase = [self getBasemetric:to];
	
		double baseconverted = amount * frombase; // Convert the supplied value to our base unit
		result = baseconverted / tobase; // Now convert the rest to our target unit
	
		NSLog (@"From Base metric: %f", frombase);
		NSLog (@"To Base metric: %f", tobase);
		NSLog (@"Base converted: %f", baseconverted);
	}
	
	
	NSString *myString = [NSString stringWithFormat:@"%f",result];
	return myString;
}

@end
