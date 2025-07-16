#include "gtest/gtest.h"

#include "app/app.hpp"

TEST(LibTest, FooTest)
{
    ASSERT_EQ(foo(), 0);
}
