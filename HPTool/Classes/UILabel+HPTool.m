//
//  UILabel+HPTool.m
//  HPTool
//
//  Created by hapii on 2019/6/13.
//

#import "UILabel+HPTool.h"

@implementation UILabel (HPTool)

+ (UILabel *(^)(void))hp_create{
    return ^(void){
         return [[UILabel alloc] init];
    };
}

- (UILabel *(^)(CGRect ))hp_frame{
    return  ^(CGRect frame){
        self.frame = frame;
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

@end
