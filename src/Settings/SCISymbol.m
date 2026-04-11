#import "SCISymbol.h"

@interface SCISymbol ()

@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) UIColor *color;
@property (nonatomic, readwrite) CGFloat size;
@property (nonatomic, readwrite) UIImageSymbolWeight weight;

- (instancetype)init;

@end

///

@implementation SCISymbol

// MARK: - Instance methods

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.name = @"";
        self.color = [UIColor labelColor];
        self.weight = UIImageSymbolWeightMedium;
        self.size = 18.0;
    }
    
    return self;
}

- (UIImage *)image {
    UIImageSymbolConfiguration *symbolConfig =
    [UIImageSymbolConfiguration configurationWithPointSize:self.size
                                                   weight:self.weight
                                                    scale:UIImageSymbolScaleMedium];
    
    UIImage *symbol = [UIImage systemImageNamed:self.name withConfiguration:symbolConfig];
    if (!symbol) {
        return [UIImage new];
    }
    
    return [symbol imageWithTintColor:self.color renderingMode:UIImageRenderingModeAlwaysOriginal];
}

// MARK: - Class methods

+ (instancetype)symbolWithName:(NSString *)name {
    SCISymbol *symbol = [[self alloc] init];
    symbol.name = name;
    return symbol;
}

+ (instancetype)symbolWithName:(NSString *)name color:(UIColor *)color {
    SCISymbol *symbol = [[self alloc] init];
    symbol.name = name;
    symbol.color = color ?: [UIColor labelColor];
    return symbol;
}

+ (instancetype)symbolWithName:(NSString *)name color:(UIColor *)color size:(CGFloat)size {
    SCISymbol *symbol = [[self alloc] init];
    symbol.name = name;
    symbol.color = color ?: [UIColor labelColor];
    symbol.size = size > 0 ? size : 18.0;
    return symbol;
}

+ (instancetype)symbolWithName:(NSString *)name color:(UIColor *)color size:(CGFloat)size weight:(UIImageSymbolWeight)weight {
    SCISymbol *symbol = [[self alloc] init];
    symbol.name = name;
    symbol.color = color ?: [UIColor labelColor];
    symbol.size = size > 0 ? size : 18.0;
    symbol.weight = weight;
    return symbol;
}

@end
