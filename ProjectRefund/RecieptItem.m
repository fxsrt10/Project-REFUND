#import "RecieptItem.h"

@implementation RecieptItem

+ (instancetype)randomItem
{
    // creates an immutable array of three adjective
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    // creates an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    'O' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    'O' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    'O' + arc4random() % 10];
    
    RecieptItem *newRecieptItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue
                                         recieptNumber:randomSerialNumber];
    
    return newRecieptItem;
}

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    recieptNumber:(NSString *)sNumber
{
    
    // call the superclass's designated initializer
    self = [super init];
    
    // did the super initializer succeed?
    if (self){
        _recieptName = name;
        _recieptNumber = sNumber;
        _valueInDollars = value;
        _dateCreated = [[NSDate alloc] init];
        
        // create an NUUISD object - get its string representation
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
        _recieptItemKey = key;
    }
    
    return self;
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     recieptNumber:@""];
}

- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", self.recieptName,
                                   self.recieptNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    
    return descriptionString;
}

@end
