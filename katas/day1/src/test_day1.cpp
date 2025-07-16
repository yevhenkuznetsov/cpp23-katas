#include <gtest/gtest.h>

#include "day1.hpp"

TEST(kata_day1, evens_squared_calculated_correctly)
{
    std::vector<int> ref{4, 16};
    EXPECT_EQ(evens_squared({1, 2, 3, 4}), ref);
}
