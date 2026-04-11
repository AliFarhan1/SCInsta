#import "SCISymbol.h"

@interface SCISymbol ()

@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) UIColor *color;
@property (nonatomic, readwrite) CGFloat size;
@property (nonatomic, readwrite) UIImageSymbolWeight weight;

@end

@implementation SCISymbol

+ (instancetype)symbolWithName:(NSString *)name {
    return [self symbolWithName:name
                          color:[UIColor labelColor]
                           size:18.0
                         weight:UIImageSymbolWeightMedium];
}

+ (instancetype)symbolWithName:(NSString *)name color:(UIColor *)color {
    return [self symbolWithName:name
                          color:color
                           size:18.0
                         weight:UIImageSymbolWeightMedium];
}

+ (instancetype)symbolWithName:(NSString *)name color:(UIColor *)color size:(CGFloat)size {
    return [self symbolWithName:name
                          color:color
                           size:size
                         weight:UIImageSymbolWeightMedium];
}

+ (instancetype)symbolWithName:(NSString *)name color:(UIColor *)color size:(CGFloat)size weight:(UIImageSymbolWeight)weight {
    SCISymbol *symbol = [[SCISymbol alloc] init];
    symbol.name = name;
    symbol.color = color ?: [UIColor labelColor];
    symbol.size = size > 0 ? size : 18.0;
    symbol.weight = weight;
    return symbol;
}

- (UIImage *)image {
    UIImageSymbolConfiguration *config = [UIImageSymbolConfiguration configurationWithPointSize:self.size
                                                                                         weight:self.weight
                                                                                          scale:UIImageSymbolScaleMedium];

    UIImage *image = [UIImage systemImageNamed:self.name withConfiguration:config];
    if (!image) {
        return [UIImage new];
    }

    return [image imageWithTintColor:self.color renderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
