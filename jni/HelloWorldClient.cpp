#include <iostream>
#include <binder/IServiceManager.h>
#include "IHelloWorldService.hpp"

using namespace android;

int	main()
{
  sp<IHelloWorldService>	mHelloWorldService;
  // il metodo getService restituisce un puntatore al Binder
  if (getService(String16("HelloWorldService"), &mHelloWorldService) != NO_ERROR)
    {
      std::cerr << "HelloWorldService is not available" << std::endl;
      return 1;
    }
  mHelloWorldService->hello();
  return 0;
}
