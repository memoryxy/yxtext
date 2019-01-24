

#import <UIKit/UIKit.h>

@interface UILabel (YXUI)

/** 
 设置yxText即可，然后改autolayout就autolayout，该sizeToFit就sizeToFit
 注意，这个方法要最后调，否则会取不到alignment、font等属性
 */
@property (nonatomic, strong) NSString *yxText;

/**
 获取当前UILabel实例的布局信息
 */
- (NSDictionary *)getYxAttribute:(BOOL)readMode;

/**
 计算量比较大，有的tablview中需要先计算string来，滚到那行的时候直接显示
 */
+ (NSMutableAttributedString *)getYxAttributeString:(NSString *)str readMode:(BOOL)readMode fontSize:(CGFloat)size alignment:(NSTextAlignment)alignment lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
