#include <gtest/gtest.h>
#include <tuple>

#include "day2.hpp"

TEST(kata_day2, swap_pairs_exchanges_elements_correctly)
{
    EXPECT_EQ((swap_pairs(std::make_pair(42, 'x'))), (std::make_pair('x', 42)));
}

TEST(kata_day2, tuple_sum_of_four_elements_equals_ten)
{
    constexpr std::tuple t{1, 2, 3, 4};
    static_assert(sum_tuple(t) == 10);
    EXPECT_EQ(sum_tuple(t), 10);
}

TEST(kata_day2, tie_reassigns_variables_after_transformation_and_reordering)
{
    int a = 5, b = 10, c = 15;

    std::array values{a, b, c};
    std::ranges::transform(values, values.begin(), [](int x) { return x * 2; });

    std::tie(a, b, c) = std::tuple{values[0], values[2], values[1]};

    EXPECT_EQ(a, 10);
    EXPECT_EQ(b, 30);
    EXPECT_EQ(c, 20);
}
