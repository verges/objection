#import "Objection.h"
#import "CircularDependencyFixtures.h"
#import "Fixtures.h"

@implementation OtherSingleton
objection_register_singleton(OtherSingleton)
objection_requires(@"bar")
@synthesize awokenCar;
@synthesize bar;

- (void)awakeFromObjection {
  self.awokenCar = self.bar.theCar;
}
@end

@implementation SingletonBar
objection_register_singleton(SingletonBar)
objection_requires(@"theCar", @"otherSingleton")
@synthesize otherSingleton;
@synthesize theCar;

@end