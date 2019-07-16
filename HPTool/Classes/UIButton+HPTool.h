//
//  UIButton+HPTool.h
//  HPTool
//
//  Created by hapii on 2019/6/13.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ButtonImageEdgeInsetsStyle) {
    ///image 上 label下
    ButtonImageEdgeInsetsStyleTop = 0,
    ///image左 label右
    ButtonImageEdgeInsetsStyleLeft,
    ///image下 label上
    ButtonImageEdgeInsetsStyleBottom,
    ///image右 label左
    ButtonImageEdgeInsetsStyleRight
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (HPTool)

///按钮初始化工厂类
+ (UIButton * (^)(void))hp_create;
- (UIButton * (^)(CGRect ))hp_frame;
///文字颜色
- (UIButton * (^)(UIColor *))hp_titleColor;
///setTitle
- (UIButton * (^)(NSString *))hp_title;
///文字颜色
- (UIButton * (^)(CGFloat ))hp_font;
///背景色
- (UIButton * (^)(UIColor *))hp_bgColor;
///setImage
- (UIButton * (^)(UIImage *))hp_image;
///加圆角
- (UIButton * (^)(CGFloat ))hp_maskRadius;
///加投影
- (UIButton *(^)(CGFloat ))addShadow;
///文字图片位置
- (void )hp_edgeInsetsStyle:(CGFloat)space style:(ButtonImageEdgeInsetsStyle )edgeInsetsStyle;

@end

NS_ASSUME_NONNULL_END
