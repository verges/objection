@class Car;
@class OtherSingleton;

@interface SingletonBar : NSObject
{
  OtherSingleton *foo;
  Car *theCar;
}

@property(nonatomic, retain) OtherSingleton *otherSingleton;
@property (nonatomic, retain) Car *theCar;

@end

@interface OtherSingleton : NSObject
@property (nonatomic, retain) Car *awokenCar;
@property (nonatomic, retain) SingletonBar *bar;
@end