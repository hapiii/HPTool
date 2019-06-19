//
//  UILabel+HPTool.m
//  HPTool
//
//  Created by hapii on 2019/6/13.
//

#import "UILabel+HPTool.h"
#import <objc/runtime.h>

static NSString *hpLabelPlaceHolderKey = @"hpLabelplaceHolderKey";
static NSString *hpLabelImageKey = @"hpLabelImageKey";

@implementation UILabel (HPTool)

#pragma mark ============ setText方法交换

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalM = class_getInstanceMethod([self class], @selector(setText:));
        Method exchangeM = class_getInstanceMethod([self class], @selector(hp_setText:));
        method_exchangeImplementations(originalM, exchangeM);
    });
}

-(void)hp_setText:(NSString *)text{
    [self hp_setText:text];
    self.hp_isPlaceHolder = NO;
    
}

#pragma mark ============ 属性t关联

- (void)setIv:(nullable UIImageView *)iv{
    objc_setAssociatedObject(self, &hpLabelImageKey, iv, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImageView *)iv{
    return objc_getAssociatedObject(self, &hpLabelImageKey);
}

- (void)setHp_isPlaceHolder:(BOOL)hp_isPlaceHolder{
    
    objc_setAssociatedObject(self, &hpLabelPlaceHolderKey, @(hp_isPlaceHolder), OBJC_ASSOCIATION_ASSIGN);
    if (hp_isPlaceHolder) {
        if (self.iv == nil) {
            self.iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        }
        self.iv.image = [UIImage imageNamed:@"images"];
        [self addSubview:self.iv];
        
    }else{
        if (self.iv) {
            [self.iv removeFromSuperview];
            self.iv = nil;
        }
        
    }
}

- (BOOL)hp_isPlaceHolder{
    return objc_getAssociatedObject(self, &hpLabelPlaceHolderKey);
}

#pragma mark ============ Factory
+ (UILabel *(^)(void))hp_create{
    return ^(void){
        UILabel *lab =[[UILabel alloc] init];
        
        return lab;
    };
}

- (UILabel *(^)(CGRect ))hp_frame{
    return  ^(CGRect frame){
        self.frame = frame;
        self.hp_isPlaceHolder = YES;
        return self;
    };
}

- (UILabel *(^)(CGFloat ))hp_font{
    return ^(CGFloat fontFloat){
        UIFont *font = [UIFont systemFontOfSize:fontFloat];
        self.font = font;
        return self;
    };
}

- (UILabel *(^)(UIColor *))hp_textColor{
    return ^(UIColor *textColor){
        self.textColor = textColor;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))hp_textAlignment{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UILabel *(^)(NSString *))hp_text{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(NSInteger ))hp_numberOfLines{
    
    return ^(NSInteger numberOfLines){
        self.numberOfLines = numberOfLines;
        return self;
    };
}

@end
