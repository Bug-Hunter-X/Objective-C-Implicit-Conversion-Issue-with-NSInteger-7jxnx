The solution involves being explicit about type conversions and handling potential data loss.  Instead of relying on implicit conversions, explicitly cast floating-point values to `NSInteger` using appropriate rounding functions if needed.

```objectivec
// Header file (MyClass.h)
@interface MyClass : NSObject
- (void)myMethod:(NSInteger)value;
@end

// Implementation file (MyClass.m)
#import "MyClass.h"
#import <math.h>
@implementation MyClass
- (void)myMethod:(NSInteger)value {
    NSLog (@"Received integer value: %ld", (long)value);
    //Further operations
}
@end

// Usage
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyClass *obj = [[MyClass alloc] init];
        // Correct usage
        [obj myMethod:10];
        
        //Explicit conversion with rounding
        double doubleValue = 20.5;
        [obj myMethod:(NSInteger)round(doubleValue)]; //Rounds to nearest integer

        float floatValue = 30.7f;
        [obj myMethod:(NSInteger)floor(floatValue)]; //Rounds down

        return 0;
    }
}
```
By using `round()` or `floor()`, we handle potential data loss by explicitly rounding the floating-point number before casting. This makes the code's intent clearer and prevents the subtle truncation issues associated with implicit conversions.