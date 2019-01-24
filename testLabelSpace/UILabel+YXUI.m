
#import "UILabel+YXUI.h"

static NSDictionary *config = nil;
static NSDictionary *readModeConfig = nil;

@implementation UILabel (YXUI)

- (NSString *)yxText {
    return self.text;
}

+ (void)load {
    config = @{@9:@{@"height":@12, @"baseline":@0.4},
               @10:@{@"height":@15, @"baseline":@0.8},
               @11:@{@"height":@16, @"baseline":@0.8},
               @12:@{@"height":@18, @"baseline":@1},
               @14:@{@"height":@20, @"baseline":@0.8},
               @15:@{@"height":@22, @"baseline":@1.1},
               @16:@{@"height":@24, @"baseline":@1.1},
               @18:@{@"height":@26, @"baseline":@1.2},
               @27:@{@"height":@40, @"baseline":@2},
               };
}

+ (NSDictionary *)getYxAttribute:(BOOL)readMode fontSize:(CGFloat)size alignment:(NSTextAlignment)alignment lineBreakMode:(NSLineBreakMode)lineBreakMode {
    NSDictionary *configParams = nil;
    NSNumber *fontSize = @(size);
    CGFloat fontScale = 1.0;
    fontSize = @(roundf(fontSize.floatValue/fontScale));
    if (readMode) {
        configParams = readModeConfig[fontSize];
    } else {
        configParams = config[fontSize];
    }
    if (configParams == nil) {
        return nil;
    } else {
        CGFloat baselineOffset = [configParams[@"baseline"] floatValue];
        CGFloat height = [configParams[@"height"] floatValue];
        NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
        style.minimumLineHeight = height;
        style.alignment = alignment;
        style.lineBreakMode = lineBreakMode;
        NSDictionary *attribute = @{NSParagraphStyleAttributeName:style, NSBaselineOffsetAttributeName:@(baselineOffset)};
        return attribute;
    }
}

+ (NSMutableAttributedString *)getYxAttributeString:(NSString *)str readMode:(BOOL)readMode fontSize:(CGFloat)size alignment:(NSTextAlignment)alignment lineBreakMode:(NSLineBreakMode)lineBreakMode {
    NSDictionary *attribute = [self getYxAttribute:NO fontSize:size alignment:alignment lineBreakMode:lineBreakMode];
    if (attribute != nil) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
        [attributedString addAttributes:attribute range:NSMakeRange(0, str.length)];
        return attributedString;
    } else {
        return nil;
    }
}

- (NSDictionary *)getYxAttribute:(BOOL)readMode {
    return [UILabel getYxAttribute:readMode fontSize:self.font.pointSize alignment:self.textAlignment lineBreakMode:self.lineBreakMode];
}

- (void)setYxText:(NSString *)text {
    [self setYxText:text readMode:NO];
}

- (NSAttributedString *)yxAttributedText {
    return self.attributedText;
}

// TODO: 可能有问题，注意测试
- (void)setYxText:(NSString *)text readMode:(BOOL)readMode {
    self.text = text;
    if (text != nil) {
        NSDictionary *attribute = [self getYxAttribute:readMode];
        if (attribute != nil) {
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
            [attributedString addAttributes:attribute range:NSMakeRange(0, text.length)];
            self.attributedText = attributedString;
        }
    }
}

- (void)setYxAttributedText:(NSAttributedString *)text readMode:(BOOL)readMode {
    self.attributedText = text;
    if (text != nil) {
        NSDictionary *attribute = [self getYxAttribute:readMode];
        if (attribute != nil) {
            NSMutableAttributedString *attributedString = [text mutableCopy];
            [attributedString addAttributes:attribute range:NSMakeRange(0, text.length)];
            self.attributedText = attributedString;
        }
    }
}

- (void)setYxAttributedText:(NSAttributedString *)text {
    [self setYxAttributedText:text readMode:NO];
}

@end
