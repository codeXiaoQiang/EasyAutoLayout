### EasyAutoLayout
=================
与UIView+AutoLayout,masonry这两款主流的自动布局框架相比,虽然功能不够强大,但是解决基本的布局是没有问题的.框架实现是基于`UIView`的分类,开发者只要把`Extension`拖入项目中就可以使用,大大减少了使用第三方的依赖,一行代码搞定布局,没有冗余的垃圾代码

## EasyAutoLayout 

**宽高约束**
```
- (NSLayoutConstraint*)RT_AlignInnerWidth:(CGFloat)hight;
- (NSLayoutConstraint*)RT_AlignInnerHight:(CGFloat)hight;
- (NSArray*)rt_sizeConstraints:(CGSize)size;
```
**填充子视图**
```
- (NSArray*)RT_Fill:(UIView*)referView;
- (NSArray*)RT_FillWithInsets:(UIEdgeInsets)insets  referView:(UIView*)referView;
```
**参照参考视图内部对齐**
```
- (NSArray*)RT_AlignInner:(RT_AlignType)type referView:(UIView*)referView size:(CGSize)size;
- (NSArray*)RT_AlignInnerWithOffset:(CGPoint)offset type:(RT_AlignType)type referView:(UIView*)referView size:(CGSize)size;
```
**参照参考视图垂直对齐**
```
- (NSArray*)RT_AlignVertical:(RT_AlignType)type referView:(UIView*)referView size:(CGSize)size;
- (NSArray*)RT_AlignVerticalWithOffset:(CGPoint)offset  type:(RT_AlignType)type referView:(UIView*)referView size:(CGSize)size;
```
**参照参考视图水平对齐**
```
- (NSArray*)RT_AlignHorizontal:(RT_AlignType)type referView:(UIView*)referView  size:(CGSize)size;
- (NSArray*)RT_AlignHorizontalWithOffset:(CGPoint)offset type:(RT_AlignType)type referView:(UIView*)referView  size:(CGSize)size;
```
** 在当前视图内部水平平铺控件**
```
- (NSArray*)RT_HorizontalTile:(NSArray*)views insets:(UIEdgeInsets)insets;
```
**  在当前视图内部垂直平铺控件**
```
- (NSArray*)RT_VerticalTile:(NSArray*)views insets:(UIEdgeInsets)insets;
```
** 从约束数组中查找指定 attribute 的约束**
```
- (NSLayoutConstraint*)RT_Constraint:(NSArray*)constraintsList attribute:(NSLayoutAttribute)attribute;
```
## Example
**填充子视图**
```
- (NSArray*)RT_Fill:(UIView*)referView;
```
=================
![image](https://github.com/codeXiaoQiang/EasyAutoLayout/blob/master/1.png)

** 在当前视图内部水平平铺控件**
```
- (NSArray*)RT_HorizontalTile:(NSArray*)views insets:(UIEdgeInsets)insets;
```
=================
![image](https://github.com/codeXiaoQiang/EasyAutoLayout/blob/master/2.png)

