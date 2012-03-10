#import "CircularDependencyFixtures.h"
#import "SpecHelper.h"
#import "Fixtures.h"

SPEC_BEGIN(CircularDependencySpecs)

describe(@"circular dependencies", ^{
  beforeEach(^{
    JSObjectionInjector *injector = [JSObjection createInjector];
    [JSObjection setGlobalInjector:injector];
  });

  it(@"are resolved between singletons", ^{
    SingletonBar *bar = [[JSObjection globalInjector] getObject:[SingletonBar class]];
    OtherSingleton *otherSingleton = [[JSObjection globalInjector] getObject:[OtherSingleton class]];

    assertThat(bar, is(sameInstance(otherSingleton.bar)));
    assertThat(otherSingleton.bar, is(sameInstance(bar)));
    assertThat(otherSingleton.awokenCar, is(notNilValue()));
    assertThat(otherSingleton.awokenCar, is(sameInstance(bar.theCar)));
  });
});

SPEC_END