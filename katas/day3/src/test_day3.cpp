#include <gtest/gtest.h>

#include "day3.hpp"

TEST(kata_day3, parse_success)
{
    auto r = parse_int("123");
    EXPECT_TRUE(std::holds_alternative<int>(r));
    EXPECT_EQ(std::get<int>(r), 123);
}

TEST(kata_day3, parse_error)
{
    auto r = parse_int("12x");
    EXPECT_FALSE(std::holds_alternative<int>(r));
    EXPECT_EQ(std::get<ParseError>(r), ParseError::NonNumeric);
}

TEST(kata_day3, optional_lookup)
{
    std::vector<int> v{1, 2, 3};
    EXPECT_EQ(lookup(v, 1), 2);
    EXPECT_FALSE(lookup(v, 5).has_value());
}

TEST(kata_day3, successful_visit_to_string)
{
    EXPECT_EQ(visit_to_string(parse_int("42")), "value 42");
    EXPECT_EQ(visit_to_string(parse_int("abc")), "error non-numeric");
}
